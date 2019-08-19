// SDLDrawPluginHQX.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLVideoPlugins.h"

bool SDLDrawPluginHQX::init(const VideoInfo *vi, IPalette *pal)
{
	// sobrecargamos el metodo init
	// e inicializamos lo necesario para escalar con XBR
	scaleFactor=4; // de 320x240 a 1280x960
	VideoInfo *_vi=new VideoInfo;
	memcpy(_vi,&vi,sizeof(VideoInfo));
	_vi->width= vi->width*scaleFactor;
	_vi->height = vi->height*scaleFactor;
	_isInitialized = SDLBasicDrawPlugin<UINT32>::init(_vi,pal);

	if ( _isInitialized )
	{
		inBuffer=(uint8_t *)malloc(vi->width * vi->height * 4);
		outBuffer = (uint8_t*)malloc(vi->width * scaleFactor * vi->height * scaleFactor * 4);

		xbrData = (xbr_data *)malloc(sizeof(xbr_data));
		xbr_init_data(xbrData);

		xbrParams.data = xbrData;
		xbrParams.input = inBuffer;
		xbrParams.output = outBuffer;
		xbrParams.inWidth = vi->width;
		xbrParams.inHeight = vi->height;
		xbrParams.inPitch = vi->width * 4;
		xbrParams.outPitch = vi->width * scaleFactor * 4;
	}

	return _isInitialized;
}

void SDLDrawPluginHQX::render(bool throttle)
{
	/* Lock the screen for direct access to the pixels */
	if ( SDL_MUSTLOCK(screen) ) {
		if ( SDL_LockSurface(screen) < 0 ) {
			fprintf(stderr, "Can't lock screen: %s\n", SDL_GetError());
			return;
		}
	}

	// TODO: Escalar solo los Rect actualizados
	xbr_filter_hq4x(&xbrParams);
	memcpy(screen->pixels,outBuffer,xbrParams.inWidth*scaleFactor*xbrParams.inHeight*scaleFactor*4);

	if ( SDL_MUSTLOCK(screen) ) {
		SDL_UnlockSurface(screen);
	}

	SDL_Flip(screen);
}

void SDLDrawPluginHQX::setPixel(int x, int y, int color)
{
	uint8_t *p = inBuffer+ y*xbrParams.inWidth*4 + x*4;
	*(UINT32 *)p = _palette[color];
}
