// SDLBasicDrawPluginTemplates.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLBasicDrawPlugin.h"
#include "IPalette.h"

#ifdef __EMSCRIPTEN__
#include "emscripten.h"
#endif

// 6 para cuadricula de 64*64 pixeles (2^6)
// 7 para cuadricula de 128*128 pixeles (2^7)
#define FACTOR_REJILLA 6

template<typename T>
bool SDLBasicDrawPlugin<T>::init(const VideoInfo *vi, IPalette *pal)
{
	if ( SDL_Init(SDL_INIT_VIDEO) < 0 ) {
		fprintf(stderr,
				"Couldn't initialize SDL: %s\n", SDL_GetError());
		return false;
	}

	screen = SDL_SetVideoMode(vi->width, vi->height, _bpp, _flags);
	if ( screen == NULL ) {
		fprintf(stderr, "Couldn't set %dx%dx%d video mode: %s\n",
				vi->width,vi->height,_bpp,SDL_GetError());
		return false;
	}
	printf("set %dx%dx%d BytesPerPixel %d video mode(%s): %s\n",
				vi->width,vi->height,_bpp, screen->format->BytesPerPixel,
				screen->flags & SDL_DOUBLEBUF?"DOUBLEBUFF":"No double buffer",SDL_GetError());

/* No funciona, en el JS generado sigue habiendo una inicializacion con copyOnLock a true  
#ifdef __EMSCRIPTEN__
  EM_ASM("SDL.defaults.copyOnLock = false; SDL.defaults.discardOnLock = true; SDL.defaults.opaqueFrontBuffer = false;");
#endif
*/

	_originalPalette=pal;

	_palette = new T[pal->getTotalColors()];
	pal->attach(this);
	updateFullPalette(pal);

#ifndef _EE
	xrects=(vi->width>>FACTOR_REJILLA);
	yrects=(vi->height>>FACTOR_REJILLA);
	int nrects=xrects*yrects;

	updated_rect = new bool*[xrects];
	for (int i=0;i<xrects;i++)
	{
		updated_rect[i]=new bool[yrects];
	}  
	for(int i=0;i<xrects;i++)
	{
		for(int j=0;j<yrects;j++)
		{
			updated_rect[i][j]=false;
		}
	}

	SDLRects = new SDL_Rect[nrects];
#endif

	_isInitialized = true;
	
	return _isInitialized;
};


template<typename T>
void SDLBasicDrawPlugin<T>::end()  { 
	if ( _originalPalette )
		_originalPalette->detach(this);
	_isInitialized = false;
};


/////////////////////////////////////////////////////////////////////////////
// Palette changes
/////////////////////////////////////////////////////////////////////////////

template<typename T>
void SDLBasicDrawPlugin<T>::updateFullPalette(IPalette *palette)
{
	for (int i = 0; i < palette->getTotalColors(); i++){
		UINT8 r, g, b;

		palette->getColor(i, r, g, b);
		_palette[i] = SDL_MapRGB(screen->format,r,g,b);
	}
}

template<typename T>
void SDLBasicDrawPlugin<T>::update(IPalette *palette, int data)
{
	if (data != -1){
		// single color update
		UINT8 r, g, b;

		palette->getColor(data, r, g, b);
		_palette[data] = SDL_MapRGB(screen->format,r,g,b);
	} else {
		// full palette update
		updateFullPalette(palette);	
	}
}

template<typename T>
inline void SDLBasicDrawPlugin<T>::updateRect(int x,int y)
{
//	fprintf(stderr,"%d %d -> rect %d,%d\n",x,y,x>>FACTOR_REJILLA,y>>FACTOR_REJILLA);

#ifndef _EE
//	updated_rect[x>>FACTOR_REJILLA][y>>FACTOR_REJILLA]=true;
#endif
}

// drawing methods
template<typename T>
void SDLBasicDrawPlugin<T>::render(bool throttle)
{
#ifdef __EMSCRIPTEN__
	if ( SDL_MUSTLOCK(screen) ) {
		SDL_UnlockSurface(screen);
	} 
#endif

	SDL_Flip(screen);

#ifdef __EMSCRIPTEN__
	if ( SDL_MUSTLOCK(screen) ) {
		if ( SDL_LockSurface(screen) < 0 ) {
			return;
		}
	}
#endif

	/*
#ifdef _EE
	SDL_UpdateRects(screen,0,NULL);
#else

	int n=0;
	for(int i=0;i<xrects;i++)
	{
		for(int j=0;j<yrects;j++)
		{
			if (updated_rect[i][j])
			{
				SDLRects[n].x=i<<FACTOR_REJILLA;
				SDLRects[n].y=j<<FACTOR_REJILLA;
				SDLRects[n].w=1<<FACTOR_REJILLA;
				SDLRects[n++].h=1<<FACTOR_REJILLA;
			}
		}
	}
	if(n)
	{
		SDL_UpdateRects(screen,n,SDLRects);
                for(int i=0;i<xrects;i++)
                {
                        for(int j=0;j<yrects;j++)
                        {
                                updated_rect[i][j]=false;
                        }
                }
	}
#endif
*/
};

template<typename T>
void SDLBasicDrawPlugin<T>::setPixel(int x, int y, int color)
{
#ifndef __EMSCRIPTEN__
	/* Lock the screen for direct access to the pixels */
	if ( SDL_MUSTLOCK(screen) ) {
		if ( SDL_LockSurface(screen) < 0 ) {
			fprintf(stderr, "Can't lock screen: %s\n", SDL_GetError());
			return;
		}
	}
#endif
	updateRect(x,y);

	int __bpp = screen->format->BytesPerPixel;
	/* Here p is the address to the pixel we want to set */
	Uint8 *p = (Uint8 *)screen->pixels + y * screen->pitch + x * __bpp;

	*(T *)p = _palette[color]; // Vale para todos los bpp, excepto 24bpp
#ifndef __EMSCRIPTEN__
	if ( SDL_MUSTLOCK(screen) ) {
		SDL_UnlockSurface(screen);
	}
#endif
};
