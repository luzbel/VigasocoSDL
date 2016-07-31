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
Uint32 format;
SDL_QueryTexture(texture,&format,NULL,NULL,NULL); //666 TODO falta comprobar error
//fprintf(stderr,"format %s ",SDL_GetPixelFormatName(format));
_palette[i] = SDL_MapRGB(SDL_AllocFormat(format),r,g,b);
	}
	SDL_mutexP(cs);
//666 SDL2 TODO cambiar esto a setpalette
//	SDL_SetColors(screen, colors, 0, 256); 
	SDL_mutexV(cs);
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

		SDL_mutexP(cs);
//666 SDL2 TODO cambiar esto a setpalette
//		SDL_SetColors(screen, &color, data, 1);
Uint32 format;
SDL_QueryTexture(texture,&format,NULL,NULL,NULL); //666 TODO falta comprobar error
//fprintf(stderr,"format %s ",SDL_GetPixelFormatName(format));
_palette[data] = SDL_MapRGB(SDL_AllocFormat(format),r,g,b);
		SDL_mutexV(cs);
	} else {
		// full palette update
		updateFullPalette(palette);
	} 
}
void SDLDrawPlugin8bpp::render(bool throttle)
{
	SDL_mutexP(cs);
	SDLBasicDrawPlugin<UINT8>::render(throttle);
	SDL_mutexV(cs);
}


void SDLDrawPlugin8bpp::setPixel(int x, int y, int color)
{
//TODO SDL2
Uint8 *p = (Uint8 *)myPixels + y * _pitch + x ;
*p = color; // Vale para todos los bpp, excepto 24bpp
/*
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
*/
};
