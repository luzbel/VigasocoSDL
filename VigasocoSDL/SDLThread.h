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

#ifdef __EMSCRIPTEN_PTHREADS__ 
#include <pthread.h>
#endif

class SDLThread : public IThread
{
// fields
protected:
#ifdef __EMSCRIPTEN_PTHREADS__ 
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
