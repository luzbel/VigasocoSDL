// SDLThread.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLThread.h"

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

SDLThread::SDLThread()
{
	_handle = NULL;
}

SDLThread::~SDLThread()
{
	end();
}

/////////////////////////////////////////////////////////////////////////////
// thread function
/////////////////////////////////////////////////////////////////////////////

int SDLThread::ThreadProc(SDLThread *thread)
{
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
#ifndef _VIGASOCO_SDL_THREAD_PTHREADS_
	_handle = SDL_CreateThread((SDL_ThreadFunction)ThreadProc, "VigasocoGameLogic", this);
#else
	pthread_create(&_handle,NULL,(void *(*)(void *))ThreadProc,this);
#endif

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

		// el hilo de lógica no tiene parada cooperativa: hay que matarlo
		// antes de que se liberen los plugins que está usando
#ifndef _VIGASOCO_SDL_THREAD_PTHREADS_
		// SDL2 eliminó SDL_KillThread; sin pthreads solo se puede separar
		// el hilo y dejar que el sistema operativo lo recoja al salir
		SDL_DetachThread(_handle);
#else
		pthread_cancel(_handle);
		pthread_join(_handle,NULL);
#endif

		_handle = NULL;
	}
}

void SDLThread::pause()
{
//SuspendThread(_handle);
// TODO:  ¡¡¡ FALTA POR IMPLEMENTAR !!!
}

void SDLThread::resume()
{
//ResumeThread(_handle);
// TODO: ¡¡¡ FALTA POR IMPLEMENTAR !!!
}
