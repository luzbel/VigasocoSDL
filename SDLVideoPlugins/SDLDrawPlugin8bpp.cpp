// SDLDrawPlugin8bpp.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLVideoPlugins.h"
#include "IPalette.h"

/////////////////////////////////////////////////////////////////////////////
//// Palette changes
///////////////////////////////////////////////////////////////////////////////

void SDLDrawPlugin8bpp::updateFullPalette(IPalette *palette)
{
	SDL_Color colors[256];

	for (int i = 0; i < palette->getTotalColors(); i++){
		UINT8 r, g, b;

		palette->getColor(i, r, g, b);
		colors[i].r=r;
		colors[i].g=g;
		colors[i].b=b;
		colors[i].a=255;
	}
	SDL_LockMutex(cs);
	SDL_SetPaletteColors(screen->format->palette, colors, 0, palette->getTotalColors());
	SDL_UnlockMutex(cs);
}

void SDLDrawPlugin8bpp::update(IPalette *palette, int data)
{
	if (data != -1){
		// single color update
		UINT8 r, g, b;
		SDL_Color color;

		palette->getColor(data, r, g, b);
		color.r=r;
		color.g=g;
		color.b=b;
		color.a=255;

		SDL_LockMutex(cs);
		SDL_SetPaletteColors(screen->format->palette, &color, data, 1);
		SDL_UnlockMutex(cs);
	} else {
		// full palette update
		updateFullPalette(palette);
	}
}
void SDLDrawPlugin8bpp::render(bool throttle)
{
	SDL_LockMutex(cs);
	SDLBasicDrawPlugin<UINT8>::render(throttle);
	SDL_UnlockMutex(cs);
}


void SDLDrawPlugin8bpp::setPixel(int x, int y, int color)
{
	// Lock the screen for direct access to the pixels 
	if ( SDL_MUSTLOCK(screen) ) {
		if ( SDL_LockSurface(screen) < 0 ) {
			fprintf(stderr, "Can't lock screen: %s\n", SDL_GetError());
			return;
		}
	}
	updateRect(x,y);

	int bpp = screen->format->BytesPerPixel;
	// Here p is the address to the pixel we want to set 
	Uint8 *p = (Uint8 *)screen->pixels + y * screen->pitch + x * bpp;
	*p=color;

	if ( SDL_MUSTLOCK(screen) ) {
		SDL_UnlockSurface(screen);
	}
};
