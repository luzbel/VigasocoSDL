// SDLBasicDrawPluginTemplates.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLBasicDrawPlugin.h"
#include "IPalette.h"

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

	myPixels = new Uint32[vi->width*vi->height];
	if (myPixels==NULL) {
		SDL_ShowSimpleMessageBox(
			SDL_MESSAGEBOX_ERROR,
			"Memoria VigasocoSDLDrawPlugin ERROR",
			"No se puede reservar memoria para los gráficos",
			NULL);
		return false;
	}

	SDL_CreateWindowAndRenderer(vi->width,vi->height,_flags,&window,&renderer);
	
	if ( window == NULL || renderer == NULL ) {
		fprintf(stderr, "Couldn't set %dx%dx%d video mode: %s\n",
				vi->width,vi->height,_bpp,SDL_GetError());
		return false;
	}
//	printf("set %dx%dx%d video mode(%s): %s\n",
//				vi->width,vi->height,_bpp,screen->flags & SDL_DOUBLEBUF?"DOUBLEBUFF":"No double buffer",SDL_GetError());

	Uint32 format;
	switch(_bpp) 
	{
		case 8: 
			format=SDL_PIXELFORMAT_INDEX8; 
			_pitch=vi->width*sizeof(Uint8); break;
			break;
		case 16: 
			format=SDL_PIXELFORMAT_ARGB4444; 
			_pitch=vi->width*sizeof(Uint16); break;
		case 24: 
			format=SDL_PIXELFORMAT_RGB24;
			_pitch=vi->width*(sizeof(Uint32)-sizeof(Uint8)); break;
			break;
		case 32: 
			format=SDL_PIXELFORMAT_ARGB8888;
			_pitch=vi->width*sizeof(Uint32); break;
			break;
		default: SDL_ShowSimpleMessageBox(
				SDL_MESSAGEBOX_ERROR,
				"BitsPerPixel VigasocoSDLDrawPlugin ERROR",
				"Numero de bits por pixel no soportados",
				NULL);
			return false;
	}

	SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "linear");
	texture=SDL_CreateTexture(renderer,
		format, 
		SDL_TEXTUREACCESS_STREAMING,
		vi->width, vi->height);
	if (texture==NULL) {
		SDL_ShowSimpleMessageBox(
			SDL_MESSAGEBOX_ERROR,
			"SDL_CreateTexture VigasocoSDLDrawPlugin ERROR",
			SDL_GetError(),
			NULL);
		return false;
	}
	if (SDL_RenderSetLogicalSize(renderer, vi->width, vi->height)<0) {
		SDL_ShowSimpleMessageBox(
			SDL_MESSAGEBOX_ERROR,
			"SDL_RenderSetLogicalSize VigasocoSDLDrawPlugin ERROR",
			SDL_GetError(),
			NULL);
		return false;
	}

//SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
//SDL_RenderClear(renderer);
//SDL_RenderPresent(renderer);

	//if (SDL_QueryTexture(texture,&format,NULL,NULL,NULL)<0) {
	if (SDL_QueryTexture(texture,&format,NULL,NULL,NULL)<0) {
		//	fprintf(stderr,"format %s ",SDL_GetPixelFormatName(format));
		SDL_ShowSimpleMessageBox(
			SDL_MESSAGEBOX_ERROR,
			"SDL_QueryTexture VigasocoSDLDrawPlugin ERROR",
			SDL_GetError(),
			NULL);
		return false;
	}
	pixelFormat=SDL_AllocFormat(format);
	if (pixelFormat==NULL) {
		//	fprintf(stderr,"BytesPerPixel %d ",pf->BytesPerPixel);
		SDL_ShowSimpleMessageBox(
			SDL_MESSAGEBOX_ERROR,
			"SDL_AllocFormat VigasocoSDLDrawPlugin ERROR",
			SDL_GetError(),
			NULL);
		return false;
	}

	_originalPalette=pal;

	_palette = new T[pal->getTotalColors()];
	pal->attach(this);
	updateFullPalette(pal);

#ifndef _EE
	// TODO SDL2
	// limpiar, no creo que haya SDL2 homebrew para Playstation2
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
//SDL_ShowSimpleMessageBox( SDL_MESSAGEBOX_ERROR, "aa", "aa", NULL);
	if ( _originalPalette )
		_originalPalette->detach(this);
//TODO SDL2
fprintf(stderr,"11a\n");
fflush(stderr);
	SDL_DestroyTexture(texture);
fprintf(stderr,"2a\n");
fflush(stderr);
	SDL_DestroyRenderer(renderer);
fprintf(stderr,"3a\n");
fflush(stderr);
	SDL_DestroyWindow(window);
fprintf(stderr,"aa\n");
fflush(stderr);
fprintf(stderr,"aa\n");		
fflush(stderr);
;
fprintf(stderr,"aa\n");
fprintf(stderr,"aa\n");
fprintf(stderr,"aa\n");
fprintf(stderr,"aa\n");
	if (myPixels!=NULL) delete[] myPixels;
fprintf(stderr,"bb\n");
fflush(stderr);
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
		_palette[i] = SDL_MapRGB(pixelFormat,r,g,b);
	}
}

template<typename T>
void SDLBasicDrawPlugin<T>::update(IPalette *palette, int data)
{
	if (data != -1){
		// single color update
		UINT8 r, g, b;

		palette->getColor(data, r, g, b);
		_palette[data] = SDL_MapRGB(pixelFormat,r,g,b);
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
	updated_rect[x>>FACTOR_REJILLA][y>>FACTOR_REJILLA]=true;
#endif
}

// drawing methods
template<typename T>
void SDLBasicDrawPlugin<T>::render(bool throttle)
{
#ifdef _EE
	SDL_UpdateRects(screen,0,NULL);
#else

/* 
// TODO SDL2
// probar a optimizar con rectangulos como en el plugin SDL1

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
*/
	SDL_UpdateTexture(texture, NULL, myPixels, _pitch);
	SDL_RenderClear(renderer);
	SDL_RenderCopy(renderer,texture,NULL,NULL);
	SDL_RenderPresent(renderer);
#endif
};

template<typename T>
void SDLBasicDrawPlugin<T>::setPixel(int x, int y, int color)
{

	Uint8 *p = (Uint8 *)myPixels + y * _pitch + x * pixelFormat->BytesPerPixel;
	*(T *)p = _palette[color]; // Vale para todos los bpp, excepto 24bpp

/*
//TODO SDL2
// Limpiar
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

	*(T *)p = _palette[color]; // Vale para todos los bpp, excepto 24bpp

	if ( SDL_MUSTLOCK(screen) ) {
		SDL_UnlockSurface(screen);
	}
*/
};
//TODO SDL2
// Limpiar
