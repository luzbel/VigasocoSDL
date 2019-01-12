//SDLDrawPlugin24bpp.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLVideoPlugins.h"

void SDLDrawPlugin24bpp::setPixel(int x, int y, int color)
{
	/* Lock the screen for direct access to the pixels */
	if ( SDL_MUSTLOCK(screen) ) {
		if ( SDL_LockSurface(screen) < 0 ) {
			fprintf(stderr, "Can't lock screen: %s\n", SDL_GetError());
			return;
		}
	}

	updateRect(x,y);
	
	int __bpp = screen->format->BytesPerPixel;
	/* Here p is the address to the pixel we want to set */
	Uint8 *p = (Uint8 *)screen->pixels + y * screen->pitch + x * __bpp;
	Uint32 pixel = _palette[color];

	if(SDL_BYTEORDER == SDL_BIG_ENDIAN) {
		p[0] = (pixel >> 16) & 0xff;
		p[1] = (pixel >> 8) & 0xff;
		p[2] = pixel & 0xff;
	} else {
		p[0] = pixel & 0xff;
		p[1] = (pixel >> 8) & 0xff;
		p[2] = (pixel >> 16) & 0xff;
	}

	if ( SDL_MUSTLOCK(screen) ) {
		SDL_UnlockSurface(screen);
	}
};
