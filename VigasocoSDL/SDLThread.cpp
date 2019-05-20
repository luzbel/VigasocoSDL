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
#ifndef __EMSCRIPTEN_PTHREADS__ 
	_handle = SDL_CreateThread((int (*)(void*))ThreadProc, this);
#else
	// SDL 1.2 en emscripten aún no hace uso de pthreads
	// aunque emscripten ya tiene soporte pthreads
	// cambiar si migramos a SDL2 o actulizan el 1.2 en emscripten
	// Valorar si tener una clas POSIX_THREAD que implemente iThread
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

		// kill the thread
#ifndef __EMSCRIPTEN_PTHREADS__ 
		SDL_KillThread(_handle);
#else
		pthread_cancel(_handle);
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
