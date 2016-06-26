// PluginMain.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLAudioPlugin.h"

#include "SDL.h"

static const char * const description = "VIGASOCO SDL Audio Plugin v1.1";

static const char *plugins[] = {
	 "SDLAudioPlugin"  
};

/////////////////////////////////////////////////////////////////////////////
// plugin creation/destruction
/////////////////////////////////////////////////////////////////////////////

extern "C" DECLSPEC
#ifdef __VIGASOCO_SDL_STATIC__
void create_AUDIO_Plugin(const char *name,void**plugin)
#else
void createPlugin(const char *name,void**plugin)
#endif
{
	if (strcmp(name, plugins[0]) == 0){
		*plugin=new SDLAudioPlugin(); 
	} else {
		*plugin=NULL;
	}
}

extern "C" DECLSPEC
#ifdef __VIGASOCO_SDL_STATIC__
void destroy_AUDIO_Plugin(IAudioPlugin *plugin)
#else
void destroyPlugin(IAudioPlugin *plugin)
#endif
{
	delete plugin;
}

/////////////////////////////////////////////////////////////////////////////
// plugin information
/////////////////////////////////////////////////////////////////////////////

extern "C" DECLSPEC
#ifdef __VIGASOCO_SDL_STATIC__
int get_AUDIO_Version()
#else
int getVersion()
#endif
{
	return 1;
}

extern "C" DECLSPEC
#ifdef __VIGASOCO_SDL_STATIC__
int get_AUDIO_Type()
#else
int getType()
#endif
{
	return AUDIO_PLUGIN;
}

extern "C" DECLSPEC
#ifdef __VIGASOCO_SDL_STATIC__
const char **get_AUDIO_Plugins(int *num)
#else
const char **getPlugins(int *num)
#endif
{
	*num = sizeof(plugins)/sizeof(plugins[0]);
	return plugins;
}

extern "C" DECLSPEC
#ifdef __VIGASOCO_SDL_STATIC__
const char *get_AUDIO_DLLDescription(int *num)
#else
const char *getDLLDescription(int *num)
#endif
{
	return description;
}
