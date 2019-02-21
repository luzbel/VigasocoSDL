// PluginMain.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "NULLVideoPlugin.h"
#define DECLSPEC __attribute__ ((visibility("default")))
#include <string.h>


static const char * const description = "VIGASOCO NULL Video Plugin v1.0";

static const char *plugins[] = {
	 "NULLVideoPlugin"  
};

/////////////////////////////////////////////////////////////////////////////
// plugin creation/destruction
/////////////////////////////////////////////////////////////////////////////

extern "C" DECLSPEC
#ifdef __VIGASOCO_SDL_STATIC__
void create_VIDEO_Plugin(const char *name,void**plugin)
#else
void createPlugin(const char *name,void**plugin)
#endif
{
	if (strcmp(name, plugins[0]) == 0){
		*plugin=new NULLVideoPlugin(); 
	} else {
		*plugin=NULL;
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
