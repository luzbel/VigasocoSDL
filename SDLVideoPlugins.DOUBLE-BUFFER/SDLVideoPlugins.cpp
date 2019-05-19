// SDLVideoPlugins.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLVideoPlugins.h"

#ifndef __EMSCRIPTEN__
const Uint32 DEFAULT::flags=SDL_HWSURFACE|SDL_DOUBLEBUF;
//const Uint32 DEFAULT::flags=SDL_HWSURFACE|SDL_HWPALETTE|SDL_DOUBLEBUF;
#else
const Uint32 DEFAULT::flags=SDL_HWSURFACE|SDL_HWPALETTE|SDL_DOUBLEBUF;
//const Uint32 DEFAULT::flags=SDL_SWSURFACE; // así va en 8bpp pero no en 32bpp
#endif
//En la PS2 parece que pone a fuego SDL_FULLSCREEN | SDL_SWSURFACE
//y pasa de lo que le pases
//const Uint32 DEFAULT::flags=0;
const int DEFAULT::bpp=8;
