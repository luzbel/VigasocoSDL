// SDLTimer.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLTimer.h"
#include "SDL.h"

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

SDLTimer::SDLTimer()
{
}

SDLTimer::~SDLTimer()
{
}

bool SDLTimer::init()
{
	if ( SDL_InitSubSystem(SDL_INIT_TIMER) == -1 ) return false;

	_ticksPerSecond = calcTicksPerSecond()/5;
	_ticksPerMilliSecond = _ticksPerSecond/1000;

	return true;
}

void SDLTimer::end()
{
}

/////////////////////////////////////////////////////////////////////////////
// timer methods
/////////////////////////////////////////////////////////////////////////////

INT64 SDLTimer::getTime()
{
	return SDL_GetTicks();
}

INT64 SDLTimer::getTicksPerSecond()
{
	return _ticksPerSecond;
}

// windows Sleep function isn't precise enough, so here it's a better sleep method
void SDLTimer::sleep(UINT32 milliseconds)
{
#ifdef _EE
/* Esto falla en fedora 7, gcc 4.1.2 , SDL 1.2.11 y libstdc++6.0.8 ...
	INT64 time1, time2;
	bool finished = false;

	time1 = getTime();

	while (!finished){
		time2 = getTime();

		finished = (time2 - time1) >= _ticksPerMilliSecond*milliseconds;
		if (!finished){
			SDL_Delay(0);
		}
	}
*/
#else
SDL_Delay(milliseconds);
#endif
}

/////////////////////////////////////////////////////////////////////////////
// helper methods
/////////////////////////////////////////////////////////////////////////////

INT64 SDLTimer::calcTicksPerSecond()
{
	// raise the priority for accurate timing
	// TODO: ¡¡¡ FALTA POR IMPLEMENTAR !!!

	// wait for 0.25 seconds
	INT64 begin = SDLTimer::getTime();

	SDL_Delay(1000/4);

	INT64 end = SDLTimer::getTime();

	// restore the previous priority
	// TODO: ¡¡¡ FALTA POR IMPLEMENTAR !!!

	return (end - begin)*4;
}
