// PluginHandler.cpp
//
/////////////////////////////////////////////////////////////////////////////
#include "PluginHandler.h"


#ifndef __VIGASOCO_SDL_STATIC__

/////////////////////////////////////////////////////////////////////////////
// load/unload
/////////////////////////////////////////////////////////////////////////////
bool PluginHandler::loadPlugin(std::string DLLName, std::string pluginName, PluginType type, int version, DLLEntry *info)
{
	// load DLL
	void *hModule = SDL_LoadObject(DLLName.c_str());

	// if the system can't find the DLL, error
	if (hModule == NULL){
		return false;
	}

	// get address of the plugin interface functions
	CREATE_PLUGIN createPlugin = (CREATE_PLUGIN)SDL_LoadFunction(hModule, "createPlugin");
	DESTROY_PLUGIN destroyPlugin = (DESTROY_PLUGIN)SDL_LoadFunction(hModule, "destroyPlugin");
	GET_TYPE getVersion = (GET_TYPE)SDL_LoadFunction(hModule, "getVersion");
	GET_TYPE getType = (GET_TYPE)SDL_LoadFunction(hModule, "getType");
	GET_PLUGINS getPlugins = (GET_PLUGINS)SDL_LoadFunction(hModule, "getPlugins");
	GET_DESCRIPTION getDLLDescription = (GET_DESCRIPTION)SDL_LoadFunction(hModule, "getDLLDescription");

	// if the DLL doesn't have the interface, error
	if ((createPlugin == NULL) || (destroyPlugin == NULL) || (getVersion == NULL) || 
		(getType == NULL) || (getPlugins == NULL) || (getDLLDescription == NULL)){
		// free DLL
		SDL_UnloadObject(hModule);
		return false;
	}

	// if the DLL is not compatible
	if ((type != getType()) || (getVersion() < version))
	{
		// free DLL
		SDL_UnloadObject(hModule);
		return false;
	}

	// if the plugin isn't one of the available types, exit
	int num;
	const char ** plugins = getPlugins(&num);

	bool found = false;
	for (int i = 0; i < num; i++){
		if (pluginName.compare(plugins[i]) == 0){
			found = true;
			break;
		}
	}

	if (!found){
		// free DLL
		SDL_UnloadObject(hModule);
		return false;
	}

	// everything went OK, copy DLL settings for later
	info->libHandle = hModule;
	info->createPlugin = createPlugin;
	info->destroyPlugin = destroyPlugin;
	info->description = getDLLDescription();
	createPlugin(pluginName.c_str(),&info->plugin);

	return true;
}

void PluginHandler::unloadPlugin(DLLEntry *info)
{
	// delete plugin and free DLL
	if (info->libHandle != 0){
		info->destroyPlugin(info->plugin);
		SDL_UnloadObject(info->libHandle);
		info->libHandle = 0;
		info->createPlugin = 0;
		info->destroyPlugin = 0;
		info->description = 0;
		info->plugin = 0;
	}
}

#else // __VIGASOCO_SDL_STATIC__

extern "C" void create_VIDEO_Plugin(const char *,void**);
extern "C" void destroy_VIDEO_Plugin(void *);
extern "C" const char *get_VIDEO_DLLDescription(int *);
extern "C" void create_INPUT_Plugin(const char *,void**);
extern "C" void destroy_INPUT_Plugin(void *);
extern "C" const char *get_INPUT_DLLDescription(int *);
extern "C" void create_AUDIO_Plugin(const char *,void**);
extern "C" void destroy_AUDIO_Plugin(void *);
extern "C" const char *get_AUDIO_DLLDescription(int *);


bool PluginHandler::loadPlugin(std::string DLLName, std::string pluginName, PluginType type, int version, DLLEntry *info)
{
	// load DLL
	void *hModule = NULL; 

	if (type==VIDEO_PLUGIN)
	{
		// everything went OK, copy DLL settings for later
		info->libHandle = hModule;
		info->createPlugin = create_VIDEO_Plugin;
		info->destroyPlugin = destroy_VIDEO_Plugin;
		info->description = get_VIDEO_DLLDescription(&version);
		create_VIDEO_Plugin(pluginName.c_str(),&info->plugin);
	}
	else
	{
		if (type==INPUT_PLUGIN)
		{
			// everything went OK, copy DLL settings for later
			info->libHandle = hModule;
			info->createPlugin = create_INPUT_Plugin;
			info->destroyPlugin = destroy_INPUT_Plugin;
			info->description = get_INPUT_DLLDescription(&version);
			create_INPUT_Plugin(pluginName.c_str(),&info->plugin);
		}
		else
		{
			if(type==AUDIO_PLUGIN)
			{
				// everything went OK, copy DLL settings for later
				info->libHandle = hModule;
				info->createPlugin = create_AUDIO_Plugin;
				info->destroyPlugin = destroy_AUDIO_Plugin;
				info->description = get_AUDIO_DLLDescription(&version);
				create_AUDIO_Plugin(pluginName.c_str(),&info->plugin);
			}
		}
	}
	return true;
}

void PluginHandler::unloadPlugin(DLLEntry *info)
{
	// delete plugin and free DLL
	if (info->libHandle != 0){
		info->destroyPlugin(info->plugin);
//		SDL_UnloadObject(info->libHandle);
		info->libHandle = 0;
		info->createPlugin = 0;
		info->destroyPlugin = 0;
		info->description = 0;
		info->plugin = 0;
	}
}

#endif // __VIGASOCO_SDL_STATIC__
