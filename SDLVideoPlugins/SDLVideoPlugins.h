// SDLVideoPlugins.h 
/////////////////////////////////////////////////////////////////////////////

#ifndef _SDL_VIDEO_PLUGINS_H_
#define _SDL_VIDEO_PLUGINS_H_

#include "SDLBasicDrawPlugin.h"
#include "SDL.h"
#include "filters.h"


class SDLDrawPlugin8bpp : public SDLBasicDrawPlugin<UINT8>
{
	private:
		SDL_mutex *cs; // No se puede actualizar la paleta y el render a la vez
	public:
		SDLDrawPlugin8bpp() { cs=SDL_CreateMutex(); } 
		virtual ~SDLDrawPlugin8bpp() { SDL_DestroyMutex(cs); }
		virtual void render(bool throttle);
		virtual void setPixel(int x, int y, int color);
	protected:
		// palette changed notification
		virtual void update(IPalette *palette, int data);
		virtual void updateFullPalette(IPalette *palette);
};

class SDLDrawPlugin16bpp : public SDLBasicDrawPlugin<UINT16>
{
};

class SDLDrawPlugin24bpp : public SDLBasicDrawPlugin<UINT32>
{
	public:
		SDLDrawPlugin24bpp() { _bpp = 24; }
		virtual void setPixel(int x, int y, int color);
};

class SDLDrawPlugin32bppScale : public SDLBasicDrawPlugin<UINT32>
{
// TODO
};

class SDLDrawPlugin32bpp : public SDLBasicDrawPlugin<UINT32>
{
};

class SDLDrawPluginPixelScaler: public SDLBasicDrawPlugin<UINT32>
{
	public:
		virtual ~SDLDrawPluginPixelScaler() = 0;
		virtual bool init(const VideoInfo *vi, IPalette *pal);
		virtual void render(bool throttle);
		virtual void setPixel(int x, int y, int color);
	protected:
		// TODO: Seguro que hay formas más elegantes en C++
		// que usar un puntero a una función
		void (*xbr_filter_function)(const xbr_params *);
	private:
		uint8_t *inBuffer, *outBuffer;
		int scaleFactor=4;
		xbr_data *xbrData;
		xbr_params xbrParams;
};


class SDLDrawPluginXBR: public SDLDrawPluginPixelScaler
{
	public:
		virtual bool init(const VideoInfo *vi, IPalette *pal);
};

class SDLDrawPluginHQX: public SDLDrawPluginPixelScaler
{
	public:
		virtual bool init(const VideoInfo *vi, IPalette *pal);
};

class SDLDrawPluginPaletaGrises8bpp : public SDLBasicDrawPlugin<UINT8>
{
	public:
		virtual bool init(const VideoInfo *vi, IPalette *pal);
};

typedef SDLDrawPlugin8bpp SDLDrawPluginWindow8bpp;
typedef SDLDrawPlugin16bpp SDLDrawPluginWindow16bpp;
typedef SDLDrawPlugin24bpp SDLDrawPluginWindow24bpp;
typedef SDLDrawPlugin32bpp SDLDrawPluginWindow32bpp;
typedef SDLDrawPluginPaletaGrises8bpp SDLDrawPluginWindowPaletaGrises8bpp;
typedef SDLBasicDrawPluginGrayScale<UINT16> SDLDrawPluginWindowPaletaGrises16bpp;
typedef SDLBasicDrawPluginGrayScale<UINT32> SDLDrawPluginWindowPaletaGrises24bpp;
typedef SDLBasicDrawPluginGrayScale<UINT32> SDLDrawPluginWindowPaletaGrises32bpp;


template <class T>
class SDLDrawPluginFullScreen: public T
{
	public:
		SDLDrawPluginFullScreen() { T::_flags|=SDL_FULLSCREEN; }
};

typedef SDLDrawPluginFullScreen<SDLDrawPlugin8bpp> SDLDrawPluginFullScreen8bpp;
typedef SDLDrawPluginFullScreen<SDLBasicDrawPlugin<UINT16>> SDLDrawPluginFullScreen16bpp;
typedef SDLDrawPluginFullScreen<SDLDrawPlugin24bpp> SDLDrawPluginFullScreen24bpp;
typedef SDLDrawPluginFullScreen<SDLBasicDrawPlugin<UINT32>> SDLDrawPluginFullScreen32bpp;
typedef SDLDrawPluginFullScreen<SDLDrawPluginPaletaGrises8bpp> SDLDrawPluginFullScreenPaletaGrises8bpp;
typedef SDLDrawPluginFullScreen<SDLBasicDrawPluginGrayScale<UINT16>> SDLDrawPluginFullScreenPaletaGrises16bpp;
typedef SDLDrawPluginFullScreen<SDLBasicDrawPluginGrayScale<UINT32>> SDLDrawPluginFullScreenPaletaGrises24bpp;
typedef SDLDrawPluginFullScreen<SDLBasicDrawPluginGrayScale<UINT32>> SDLDrawPluginFullScreenPaletaGrises32bpp; 

#endif // _SDL_VIDEO_PLUGINS_H_
