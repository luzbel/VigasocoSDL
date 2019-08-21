// PluginMain.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLVideoPlugins.h"

#include "SDL.h"

static const char * const description = "VIGASOCO SDL Video Plugins v1.1";

static const char *plugins[] = {
	"win8"		,	// 0 
	"win16"		,	// 1
	"win24"		,	// 2 
	"win32"		,	// 3 
	"wingris8"	,	// 4 
	"wingris16"	,	// 5 
	"wingris24"	,	// 6 
	"wingris32"	,	// 7
	"full8"		,	// 8
	"full16"	,	// 9
	"full24"	,	// 10 
	"full32"	,	// 11 
	"fullgris8"	,	// 12 
	"fullgris16"	,	// 12+2 
	"fullgris24"	,	// 14 
	"fullgris32"	,	// 15 
	"xbr4x"		,	// 16 
	"hq4x"			// 17  
};

/////////////////////////////////////////////////////////////////////////////
// plugin creation/destruction
/////////////////////////////////////////////////////////////////////////////

extern "C" DECLSPEC
#ifdef __VIGASOCO_SDL_STATIC__
void create_VIDEO_Plugin(const char *name,void**a)
#else
void createPlugin(const char *name,void**a)
#endif
{
	if (strcmp(name, plugins[0]) == 0){
		*a=new SDLDrawPluginWindow8bpp(); 
	} else if (strcmp(name, plugins[1]) == 0){
		*a=new SDLDrawPluginWindow16bpp();
	} else if (strcmp(name, plugins[2]) == 0){
		*a=new SDLDrawPluginWindow24bpp();
	} else if (strcmp(name, plugins[3]) == 0){
		*a=new SDLDrawPluginWindow32bpp();
	} else if (strcmp(name, plugins[4]) == 0){
		*a=new SDLDrawPluginWindowPaletaGrises8bpp();
	} else if (strcmp(name, plugins[5]) == 0){
		*a=new SDLDrawPluginWindowPaletaGrises16bpp();
	} else if (strcmp(name, plugins[6]) == 0){
		*a=new SDLDrawPluginWindowPaletaGrises24bpp();
	} else if (strcmp(name, plugins[7]) == 0){
		*a=new SDLDrawPluginWindowPaletaGrises32bpp();
	} else if (strcmp(name, plugins[8]) == 0){
		*a=new SDLDrawPluginFullScreen8bpp();
	} else if (strcmp(name, plugins[9]) == 0){
		*a=new SDLDrawPluginFullScreen16bpp();
	} else if (strcmp(name, plugins[10]) == 0){
		*a=new SDLDrawPluginFullScreen24bpp();
	} else if (strcmp(name, plugins[11]) == 0){
		*a=new SDLDrawPluginFullScreen32bpp();
	} else if (strcmp(name, plugins[12]) == 0){
		*a=new SDLDrawPluginFullScreenPaletaGrises8bpp();
	} else if (strcmp(name, plugins[12+1]) == 0){
		*a=new SDLDrawPluginFullScreenPaletaGrises16bpp();
	} else if (strcmp(name, plugins[14]) == 0){
		*a=new SDLDrawPluginFullScreenPaletaGrises24bpp();
	} else if (strcmp(name, plugins[15]) == 0){
		*a=new SDLDrawPluginFullScreenPaletaGrises32bpp();
	} else if (strcmp(name, plugins[16]) == 0){
		*a=new SDLDrawPluginXBR();
	} else if (strcmp(name, plugins[17]) == 0){
		*a=new SDLDrawPluginHQX();
	} else {
		*a=NULL;
	}
}

extern "C" DECLSPEC
#ifdef __VIGASOCO_SDL_STATIC__
void destroy_VIDEO_Plugin(IDrawPlugin *plugin)
#else
void destroyPlugin(IDrawPlugin *plugin)
#endif
{
	delete plugin;
}

/////////////////////////////////////////////////////////////////////////////
// plugin information
/////////////////////////////////////////////////////////////////////////////

extern "C" DECLSPEC
#ifdef __VIGASOCO_SDL_STATIC__
int get_VIDEO_Version()
#else
int getVersion()
#endif
{
	return 1;
}

extern "C" DECLSPEC
#ifdef __VIGASOCO_SDL_STATIC__
int get_VIDEO_Type()
#else
int getType()
#endif
{
	return VIDEO_PLUGIN;
}

extern "C" DECLSPEC
#ifdef __VIGASOCO_SDL_STATIC__
const char **get_VIDEO_Plugins(int *num)
#else
const char **getPlugins(int *num)
#endif
{
	*num = sizeof(plugins)/sizeof(plugins[0]);
	return plugins;
}

extern "C" DECLSPEC
#ifdef __VIGASOCO_SDL_STATIC__
const char *get_VIDEO_DLLDescription(int *num)
#else
const char *getDLLDescription(int *num)
#endif
{
	return description;
}
