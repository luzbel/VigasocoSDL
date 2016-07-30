// SDLDrawPluginPaletaGrises8bpp.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLVideoPlugins.h"

bool SDLDrawPluginPaletaGrises8bpp::init(const VideoInfo *vi, IPalette *pal)
{
	// sobrecargamos el metodo init
	// e inicializamos a fuego
	// con una paleta de grises la pantalla
	_isInitialized = SDLBasicDrawPlugin<UINT8>::init(vi,pal);

	if ( _isInitialized )
	{
		SDL_Color colors[256];

		for (int i = 0; i < 256; i++){
			colors[i].r=i;
			colors[i].g=i;
			colors[i].b=i;
Uint32 format;
SDL_QueryTexture(texture,&format,NULL,NULL,NULL); //666 TODO falta comprobar error
//fprintf(stderr,"format %s ",SDL_GetPixelFormatName(format));
_palette[i] = SDL_MapRGB(SDL_AllocFormat(format),i,i,i);
			} 

//666 SDL2 TODO cambiar esto a setpalette
//		SDL_SetColors(screen, colors, 0, 256); 

		pal->attach(this);
		updateFullPalette(pal);
	}

	return _isInitialized;
}
