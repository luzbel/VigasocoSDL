// SDLThread.cpp
//
/////////////////////////////////////////////////////////////////////////////

/* Para depurar cambiando el color de fondo de pantalla y asi poder ir
marcando por donde va pasando el codigo
#define GS_SREG_BGCOLOR         0x120000e0
#define RGBA(r, g, b, a)    \
	        ((u64)(r)|((u64)(g) << 8)|((u64)(b) << 16)|((u64)(a) << 24))
#define SETBG(r, g, b) _sd(RGBA(r, g, b, 0), GS_SREG_BGCOLOR)
*/

#include "SDLThread.h"
#include "kernel.h"

#define INTC_TIM0       9
#define T0_COUNT        (*((volatile u32 *)0x10000000))
#define T0_MODE         (*((volatile u32 *)0x10000010))
#define T0_COMP         (*((volatile u32 *)0x10000020))
static int tim0_handler_id = -1;
int _gthread_main_id=-1;
int _gthread_async_id=-1;
int _gCAMBIAR=1;

// Con este ya va, pero estamos limitados 
// a cambiar solo entre 2 hilos, que son los que usa
// la abadia en Vigasoco
static int ms_handler(int ca)
{
	static int cambiar_a_main;

	if (_gCAMBIAR)
	{
		if (_gthread_async_id!=-1)
		{
			if (cambiar_a_main==1)
			{
				/* Estos 2 se pueden poner por
				 * seguridad para evitar que las llamadas
				 * RPC de por medio la lien */
				iSuspendThread(_gthread_async_id);
				iResumeThread(_gthread_main_id);

				// salir de los SleepThread de SDL_Delay
				iWakeupThread(_gthread_main_id);

				cambiar_a_main=0;

				iChangeThreadPriority(_gthread_async_id,65); 
				iChangeThreadPriority(_gthread_main_id,64); 
			}
			else
			{
				/* Estos 2 se pueden poner por
				 * seguridad para evitar que las llamadas
				 * RPC de por medio la lien  */
				iSuspendThread(_gthread_main_id);
				iResumeThread(_gthread_async_id);

				// salir de los SleepThread de SDL_Delay
				iWakeupThread(_gthread_async_id);

				cambiar_a_main=1;
				//cambiar_a_main++;

				iChangeThreadPriority(_gthread_main_id,65); 
				iChangeThreadPriority(_gthread_async_id,64); 
			}
			iRotateThreadReadyQueue(64);
		}
	}

	/* reset counter */
	T0_COUNT = 0;
	/* reset interrupt */
	T0_MODE |= (1 << 10);
	__asm__ volatile("sync.l; ei");

	return ca;
}

/*
// prueba a ver si no hace falta tanta complicacion
// pues no, no va
// usar el otro que solo va con 2 hilos
// nos vale para la abadia, pero no para otros
// juegos que implemente vigasoco
static int ms_handler_NO_VA(int ca)
{
	iRotateThreadReadyQueue(64);

	// reset counter
	T0_COUNT = 0;
	// reset interrupt 
	T0_MODE |= (1 << 10);
	__asm__ volatile("sync.l; ei");

	return ca;
}
*/

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

SDLThread::SDLThread()
{
	_handle = NULL;
	_gthread_main_id = GetThreadId();
}

SDLThread::~SDLThread()
{
	T0_MODE = 0; // Deshabilito antes de tocar nada
	DisableIntc(INTC_TIM0);
	if (tim0_handler_id >= 0)
	{
		RemoveIntcHandler(INTC_TIM0, tim0_handler_id);
		tim0_handler_id = -1;
	}
	end();
}

/////////////////////////////////////////////////////////////////////////////
// thread function
/////////////////////////////////////////////////////////////////////////////

int SDLThread::ThreadProc(SDLThread *thread)
{
	_gthread_async_id = GetThreadId();

	T0_MODE = 0; // Deshabilito antes de tocar nada
	tim0_handler_id = AddIntcHandler(INTC_TIM0, ms_handler, 0);
	EnableIntc(INTC_TIM0);
	T0_COUNT = 0;
	T0_COMP = 586; // 150MHZ / 256 / 1000 
	//T0_COMP = 50;
	T0_MODE = 2 | (0<<2) | (0<<6) | (1<<7) | (1<<8);

	return thread->run();
}

/////////////////////////////////////////////////////////////////////////////
// thread life cycle
/////////////////////////////////////////////////////////////////////////////

bool SDLThread::start()
{
	if (_isRunning){
		return false;
	}

	// creates the thread
	_handle = SDL_CreateThread((int (*)(void*))ThreadProc, this);

	if (_handle == NULL){
		// error creating the thread
		return false;
	}

	_isRunning = true;

	return true;
}

void SDLThread::end()
{
	if (_handle != NULL){
		_isRunning = false;

		// kill the thread
		SDL_KillThread(_handle);

		_handle = NULL;
	}
}

void SDLThread::pause()
{
//SuspendThread(_handle);
//TODO: Â¡Â¡Â¡ FALTA POR IMPLEMENTAR !!!
}

void SDLThread::resume()
{
//ResumeThread(_handle);
//TODO: Â¡Â¡Â¡ FALTA POR IMPLEMENTAR !!!
}
