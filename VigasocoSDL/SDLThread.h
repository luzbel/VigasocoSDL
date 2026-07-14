// SDLThread.h
//
//	Class that encapsulates a SDL thread
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _SDL_THREAD_H_
#define _SDL_THREAD_H_


#include "IThread.h"
#include "SDL.h"
#include "SDL_thread.h"

// SDL2 eliminó SDL_KillThread, pero el hilo de lógica del juego no tiene
// parada cooperativa, así que en sistemas POSIX se usan pthreads
// directamente para poder cancelarlo al salir (como hacía SDL_KillThread)
#if defined(__EMSCRIPTEN_PTHREADS__) || defined(__unix__) || defined(__APPLE__)
#define _VIGASOCO_SDL_THREAD_PTHREADS_
#include <pthread.h>
#endif

class SDLThread : public IThread
{
// fields
protected:
#ifdef _VIGASOCO_SDL_THREAD_PTHREADS_
	pthread_t _handle;
#else
	SDL_Thread *_handle;
#endif

public:
	// initialization and cleanup
	SDLThread();
	virtual ~SDLThread();

	// IThread interface
	virtual bool start();
	virtual void end();
	virtual void pause();
	virtual void resume();

	// helper method
	static int ThreadProc(SDLThread *thread);
};

#endif	// _SDL_THREAD_H_
