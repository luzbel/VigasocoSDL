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

	SDL_CreateWindowAndRenderer(640,480,_flags,&window,&renderer);
	
//			(vi->width, vi->height, _bpp, _flags);
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
   case 8: format=SDL_PIXELFORMAT_INDEX8; break;
   case 16: format=SDL_PIXELFORMAT_ARGB4444; break;
   //case 16: format=SDL_PIXELFORMAT_BGRA4444; break;
   case 24: format=SDL_PIXELFORMAT_RGB24; break;
   case 32: format=SDL_PIXELFORMAT_ARGB8888; break;
   default: format=SDL_PIXELFORMAT_ARGB8888;
}

	texture=SDL_CreateTexture(renderer,
		format, 
//SDL_PIXELFORMAT_ARGB8888,
		SDL_TEXTUREACCESS_STREAMING,
		vi->width, vi->height);
	SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, "linear");
	SDL_RenderSetLogicalSize(renderer, vi->width, vi->height);

SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
SDL_RenderClear(renderer);
SDL_RenderPresent(renderer);

SDL_QueryTexture(texture,&format,NULL,NULL,NULL); //666 TODO falta comprobar error
fprintf(stderr,"format %s ",SDL_GetPixelFormatName(format));
SDL_PixelFormat*pf= SDL_AllocFormat(format);
fprintf(stderr,"BytesPerPixel %d ",pf->BytesPerPixel);

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
//666 TODO SDL2
//		_palette[i] = SDL_MapRGB(SDL_AllocFormat(SDL_PIXELFORMAT_ARGB8888),r,g,b);
		Uint32 format;
		SDL_QueryTexture(texture,&format,NULL,NULL,NULL); //666 TODO falta comprobar error
//fprintf(stderr,"format %s ",SDL_GetPixelFormatName(format));
		_palette[i] = SDL_MapRGB(SDL_AllocFormat(format),r,g,b);
	}
}

template<typename T>
void SDLBasicDrawPlugin<T>::update(IPalette *palette, int data)
{
	if (data != -1){
		// single color update
		UINT8 r, g, b;

		palette->getColor(data, r, g, b);
//666 TODO SDL2
		//_palette[data] = SDL_MapRGB(SDL_AllocFormat(SDL_PIXELFORMAT_ARGB8888),r,g,b);
		//_palette[data] = SDL_MapRGB((SDL_Texture*)texture->GetSDLSurface()->format,r,g,b);
		Uint32 format;
		SDL_QueryTexture(texture,&format,NULL,NULL,NULL); //666 TODO falta comprobar error
//fprintf(stderr,"format %s ",SDL_GetPixelFormatName(format));
		_palette[data] = SDL_MapRGB(SDL_AllocFormat(format),r,g,b);
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
	// 666 TODO SDL2 quitar este 640 a fuego
	//SDL_UpdateTexture(texture, NULL, myPixels, 640*sizeof(Uint32));
int tmp;
switch(_bpp) 
{
   case 8: tmp=sizeof(Uint8); break;
   case 16: tmp=sizeof(Uint16); break;
   case 24: tmp=sizeof(Uint32)-sizeof(Uint8); break;
   case 32: tmp=sizeof(Uint32); break;
   default: tmp=sizeof(Uint32);
}
	//SDL_UpdateTexture(texture, NULL, myPixels, 640*sizeof(Uint32));
	SDL_UpdateTexture(texture, NULL, myPixels, 640*tmp);
	SDL_RenderClear(renderer);
	SDL_RenderCopy(renderer,texture,NULL,NULL);
	SDL_RenderPresent(renderer);
#endif
};

template<typename T>
void SDLBasicDrawPlugin<T>::setPixel(int x, int y, int color)
{

		Uint32 format;
		SDL_QueryTexture(texture,&format,NULL,NULL,NULL); //666 TODO falta comprobar error
//fprintf(stderr,"format %s ",SDL_GetPixelFormatName(format));
	SDL_PixelFormat*pf= SDL_AllocFormat(format);
	Uint8 *p = (Uint8 *)myPixels + y * (640*pf->BytesPerPixel) + x * pf->BytesPerPixel;
	//Uint8 *p = (Uint8 *)myPixels + y * 640 + x ;
	*(T *)p = _palette[color]; // Vale para todos los bpp, excepto 24bpp


if(x==100 && y==100) {
 fprintf(stderr,"100,100 color %d palette %d\n",color,_palette[color]);
 fprintf(stderr,"%p %p %p \n",myPixels, (Uint8 *)myPixels+(y*640*4)+x*4, myPixels+y*640+x);
 fprintf(stderr,"AAA %d %p %p %p \n", pf->BytesPerPixel, myPixels, (Uint8 *)myPixels+4, myPixels+1);
 fprintf(stderr,"CCC %d %p %p %p \n", pf->BytesPerPixel, myPixels, (Uint8 *)myPixels+(1*4+4), myPixels+(1+1));
 fprintf(stderr,"BBB %d %p %p %p \n", pf->BytesPerPixel, myPixels, (Uint8 *)myPixels+1*4+1*4, (Uint32 *)myPixels+1*1+1);
fprintf(stderr,"size 32 %ld 24 %ld 16 %ld 8 %ld\n",sizeof(Uint32),sizeof(Uint32), sizeof(Uint16), sizeof(Uint8));
}
	//666 TODO SDL2 quitar ese 640 a fuego
//	myPixels[x+640*y]=_palette[color];
	
	//Uint8 *p = (Uint8 *)myPixels + y * 640 + x ;
	//*(T *)p = _palette[color]; // Vale para todos los bpp, excepto 24bpp

	//Uint16 *p = (Uint16 *)myPixels + y * 640*2 + x*2 ;
	//*(T *)p = _palette[color]; // Vale para todos los bpp, excepto 24bpp
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

	*(T *)p = _palette[color]; // Vale para todos los bpp, excepto 24bpp

	if ( SDL_MUSTLOCK(screen) ) {
		SDL_UnlockSurface(screen);
	}
*/
};
