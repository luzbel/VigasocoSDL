//SDLDrawPlugin24bpp.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLVideoPlugins.h"

void SDLDrawPlugin24bpp::setPixel(int x, int y, int color)
{
		Uint32 format;
		SDL_QueryTexture(texture,&format,NULL,NULL,NULL); //666 TODO falta comprobar error
//fprintf(stderr,"format %s ",SDL_GetPixelFormatName(format));
	SDL_PixelFormat*pf= SDL_AllocFormat(format);
	Uint8 *p = (Uint8 *)myPixels + y * (640*pf->BytesPerPixel) + x * pf->BytesPerPixel;
	//Uint8 *p = (Uint8 *)myPixels + y * 640 + x ;

	Uint32 pixel = _palette[color]; // Vale para todos los bpp, excepto 24bpp

	if(SDL_BYTEORDER == SDL_BIG_ENDIAN) {
		p[0] = (pixel >> 16) & 0xff;
		p[1] = (pixel >> 8) & 0xff;
		p[2] = pixel & 0xff;
	} else {
		p[0] = pixel & 0xff;
		p[1] = (pixel >> 8) & 0xff;
		p[2] = (pixel >> 16) & 0xff;
	}

if(x==100 && y==100) {
 fprintf(stderr,"100,100 color %d palette %d\n",color,_palette[color]);
 fprintf(stderr,"%p %p %p \n",myPixels, (Uint8 *)myPixels+(y*640*4)+x*4, myPixels+y*640+x);
 fprintf(stderr,"AAA %d %p %p %p \n", pf->BytesPerPixel, myPixels, (Uint8 *)myPixels+4, myPixels+1);
 fprintf(stderr,"CCC %d %p %p %p \n", pf->BytesPerPixel, myPixels, (Uint8 *)myPixels+(1*4+4), myPixels+(1+1));
 fprintf(stderr,"BBB %d %p %p %p \n", pf->BytesPerPixel, myPixels, (Uint8 *)myPixels+1*4+1*4, (Uint32 *)myPixels+1*1+1);
}
	//666 TODO SDL2 quitar ese 640 a fuego
//	myPixels[x+640*y]=_palette[color];
//666 TODO SDL2
/*
	// Lock the screen for direct access to the pixels 
	if ( SDL_MUSTLOCK(screen) ) {
		if ( SDL_LockSurface(screen) < 0 ) {
			fprintf(stderr, "Can't lock screen: %s\n", SDL_GetError());
			return;
		}
	}

	updateRect(x,y);
	
	int __bpp = screen->format->BytesPerPixel;
	// Here p is the address to the pixel we want to set 
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
*/
};
