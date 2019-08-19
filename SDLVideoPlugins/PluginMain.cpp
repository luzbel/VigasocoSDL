// PluginMain.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLVideoPlugins.h"

#include "SDL.h"

static const char * const description = "VIGASOCO SDL Video Plugins v1.1";

static const char *plugins[] = {
	 "win8"  , "win16" , "win24"  , "win32"  , "wingris8" ,
	 "full8" , "full16", "full24" , "full32" , "fullgris8",
	 "xbr4x" , "hq4x"
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
		*a=new SDLDrawPluginFullScreen8bpp();
	} else if (strcmp(name, plugins[6]) == 0){
		*a=new SDLDrawPluginFullScreen16bpp();
	} else if (strcmp(name, plugins[7]) == 0){
		*a=new SDLDrawPluginFullScreen24bpp();
	} else if (strcmp(name, plugins[8]) == 0){
		*a=new SDLDrawPluginFullScreen32bpp();
	} else if (strcmp(name, plugins[9]) == 0){
		*a=new SDLDrawPluginFullScreenPaletaGrises8bpp();
	} else if (strcmp(name, plugins[10]) == 0){
		*a=new SDLDrawPluginXBR();
	} else if (strcmp(name, plugins[11]) == 0){
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
