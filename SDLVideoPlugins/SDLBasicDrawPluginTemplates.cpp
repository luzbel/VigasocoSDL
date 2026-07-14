// SDLBasicDrawPluginTemplates.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLBasicDrawPlugin.h"
#include "IPalette.h"

template<typename T>
bool SDLBasicDrawPlugin<T>::init(const VideoInfo *vi, IPalette *pal)
{
	if ( SDL_Init(SDL_INIT_VIDEO) < 0 ) {
		fprintf(stderr,
				"Couldn't initialize SDL: %s\n", SDL_GetError());
		return false;
	}

	window = SDL_CreateWindow("VigasocoSDL",
			SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
			vi->width, vi->height, _flags);
	if ( window == NULL ) {
		fprintf(stderr, "Couldn't create %dx%d window: %s\n",
				vi->width,vi->height,SDL_GetError());
		return false;
	}

	renderer = SDL_CreateRenderer(window, -1, 0);
	if ( renderer == NULL ) {
		fprintf(stderr, "Couldn't create renderer: %s\n", SDL_GetError());
		return false;
	}

	// escalado con relacion de aspecto correcta en fullscreen/resize
	SDL_RenderSetLogicalSize(renderer, vi->width, vi->height);

	texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888,
			SDL_TEXTUREACCESS_STREAMING, vi->width, vi->height);
	if ( texture == NULL ) {
		fprintf(stderr, "Couldn't create texture: %s\n", SDL_GetError());
		return false;
	}

	screen = SDL_CreateRGBSurface(0, vi->width, vi->height, _bpp, 0, 0, 0, 0);
	if ( screen == NULL ) {
		fprintf(stderr, "Couldn't create %dx%dx%d surface: %s\n",
				vi->width,vi->height,_bpp,SDL_GetError());
		return false;
	}

	rgbaScreen = SDL_CreateRGBSurfaceWithFormat(0, vi->width, vi->height,
			32, SDL_PIXELFORMAT_ARGB8888);
	if ( rgbaScreen == NULL ) {
		fprintf(stderr, "Couldn't create conversion surface: %s\n",
				SDL_GetError());
		return false;
	}

	_originalPalette=pal;

	_palette = new T[pal->getTotalColors()];
	pal->attach(this);
	updateFullPalette(pal);

	_isInitialized = true;

	return _isInitialized;
};


template<typename T>
void SDLBasicDrawPlugin<T>::end()  {
	if ( _originalPalette )
		_originalPalette->detach(this);

    if ( rgbaScreen ) {
        SDL_FreeSurface(rgbaScreen);
        rgbaScreen = NULL;
    }

	if ( screen ) {
        SDL_FreeSurface(screen);
        screen = NULL;
    }

	if ( texture ) {
        SDL_DestroyTexture(texture);
        texture = NULL;
    }

	if ( renderer ) {
        SDL_DestroyRenderer(renderer);
        renderer = NULL;
    }

	if ( window ) {
        SDL_DestroyWindow(window);
        window = NULL;
    }

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
	// con SDL2 se sube la textura completa y se presenta en cada render,
	// por lo que ya no hace falta llevar la cuenta de zonas modificadas
}

// drawing methods
template<typename T>
void SDLBasicDrawPlugin<T>::render(bool throttle)
{
	// el juego dibuja en la superficie con paleta; se convierte a
	// ARGB8888, se sube a la textura y se presenta
	SDL_BlitSurface(screen, NULL, rgbaScreen, NULL);
	SDL_UpdateTexture(texture, NULL, rgbaScreen->pixels, rgbaScreen->pitch);
	SDL_RenderClear(renderer);
	SDL_RenderCopy(renderer, texture, NULL, NULL);
	SDL_RenderPresent(renderer);
};

template<typename T>
void SDLBasicDrawPlugin<T>::setPixel(int x, int y, int color)
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

	*(T *)p = _palette[color]; // Vale para todos los bpp, excepto 24bpp

	if ( SDL_MUSTLOCK(screen) ) {
		SDL_UnlockSurface(screen);
	}
};
