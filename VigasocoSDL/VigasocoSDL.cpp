// VigasocoSDL.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "IDrawPlugin.h"
#include "SDLPalette.h"
#include "FileLoader.h"
#include "FontManager.h"
#include "IInputPlugin.h"
#include "InputHandler.h"
#include "TimingHandler.h"
#include "VigasocoSDL.h"

#ifdef RDTSC
#include "RDTSCTimer.h"
#else
#include "SDLTimer.h"
#endif

#include "SDLCriticalSection.h"
#include "SDLThread.h"

// para los eventos y para poner el titulo de la ventana
#include "SDL.h"

#ifdef _EE
bool PS2SpecificInit(void);
#endif

// current plugin versions
int VigasocoSDL::g_currentVideoPluginVersion = 1;
int VigasocoSDL::g_currentInputPluginVersion = 1;
int VigasocoSDL::g_currentLoaderPluginVersion = 1;
int VigasocoSDL::g_currentAudioPluginVersion = 1;

// paths for the plugins
std::string VigasocoSDL::g_videoPluginPath = "video/";
std::string VigasocoSDL::g_inputPluginPath = "input/";
std::string VigasocoSDL::g_loaderPluginPath = "loaders/";
std::string VigasocoSDL::g_audioPluginPath = "audio/";

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

VigasocoSDL::VigasocoSDL(std::string game,
				std::string drawPluginsDLL,
				std::string drawPlugin,
				Strings inputPluginsDLLs,
				Strings inputPlugins,
				std::string audioPluginsDLL,
				std::string audioPlugin,
				Strings paths)
{
	_pluginHandler = 0;
	_game = game;

	_sDrawPluginsDLL = drawPluginsDLL;
	_sDrawPlugin = drawPlugin;
	_sInputPluginsDLLs = inputPluginsDLLs;
	_sInputPlugins = inputPlugins;
	_sAudioPluginsDLL = audioPluginsDLL;
	_sAudioPlugin = audioPlugin;
	_sPaths = paths;
}

VigasocoSDL::~VigasocoSDL()
{
}

/////////////////////////////////////////////////////////////////////////////
// platform services
/////////////////////////////////////////////////////////////////////////////

ICriticalSection * VigasocoSDL::createCriticalSection()
{
	return new SDLCriticalSection();
}

/////////////////////////////////////////////////////////////////////////////
// construction template methods overrides
/////////////////////////////////////////////////////////////////////////////

bool VigasocoSDL::platformSpecificInit()
{
	// creates the plugin handler
	// TODO:
	// esto no compila en Linux y no lo usamos en la version SDL
	//_pluginHandler = new PluginHandler(_settings); 

#ifdef _EE
	return PS2SpecificInit();
#else
	return true;
#endif
}

void VigasocoSDL::createPalette()
{
	_palette = new SDLPalette();
}

void VigasocoSDL::addCustomLoaders(FileLoader *fl)
{
// TODO
/* !!! FALTA POR IMPLEMENTAR EN LINUX 
	HANDLE hSearch;
	WIN32_FIND_DATA findData;

	SetCurrentDirectory(g_loaderPluginPath.substr(0, g_loaderPluginPath.size() - 1).c_str());

	// traverse all the files in the loader directory searching for plugins
	hSearch = FindFirstFile("*.dll", &findData);
	if (hSearch != INVALID_HANDLE_VALUE){
		do {
			ILoader *customLoader = 0;
			DLLEntry entry;

			// try to load the plugin from the DLL
			if (_pluginHandler->loadPlugin(findData.cFileName, 
				"CustomLoader", LOADER_PLUGIN, g_currentLoaderPluginVersion, &entry)){
				customLoader = (ILoader *)entry.plugin;
			}

			if (customLoader != 0){
				// save DLL reference for later
				_loaderPluginsInfo.push_back(entry);

				// add the plugin to the fileLoader
				fl->addLoader(customLoader);
			}
		} while (FindNextFile(hSearch, &findData));
	}
	FindClose(hSearch);

	SetCurrentDirectory("..");

	// add optional paths to the file loader
	for (Strings::size_type i = 0; i < _sPaths.size(); i++){
		fl->addPath(_sPaths[i]);
	}
*/
}

void VigasocoSDL::createDrawPlugin()
{
	// load the plugin from a DLL
	if (_pluginHandler->loadPlugin(g_videoPluginPath + _sDrawPluginsDLL, 
		_sDrawPlugin, VIDEO_PLUGIN, g_currentVideoPluginVersion, &_drawPluginInfo)){
		_drawPlugin = (IDrawPlugin *)_drawPluginInfo.plugin;
	}

	if (_drawPlugin != 0){
		// TODO: set plugin properties
	}
}

void VigasocoSDL::createAudioPlugin()
{
	// load the plugin from a DLL
	if (_pluginHandler->loadPlugin(g_audioPluginPath + _sAudioPluginsDLL, 
		_sAudioPlugin, AUDIO_PLUGIN, g_currentAudioPluginVersion, &_audioPluginInfo)){
		_audioPlugin = (IAudioPlugin *)_audioPluginInfo.plugin;
	}

	if (_audioPlugin != 0){
		// TODO: set plugin properties
	}
}

void VigasocoSDL::addCustomInputPlugins()
{
	for (Strings::size_type i = 0; i < _sInputPluginsDLLs.size(); i++){
		DLLEntry entry;
		IInputPlugin *ip = 0;

		// load the plugin from a DLL
		if (_pluginHandler->loadPlugin(g_inputPluginPath + _sInputPluginsDLLs[i], 
			_sInputPlugins[i], INPUT_PLUGIN, g_currentInputPluginVersion, &entry)){
			ip = (IInputPlugin *)entry.plugin;
		}

		if (ip != 0){
			// TODO: set plugin properties

			// save DLL reference for later
			_inputPluginsInfo.push_back(entry);	

			_inputHandler->addInputPlugin(ip);
		}
	}
}

void VigasocoSDL::createTimer()
{
#ifdef RDTSC
	_timer = new RDTSCTimer();
#else
	_timer = new SDLTimer();
#endif
}

void VigasocoSDL::createAsyncThread()
{
	_asyncThread = new SDLThread();
}

void VigasocoSDL::initCompleted()
{
	std::string titulo_ventana = "VigasocoSDL v0.096: " + _driver->getFullName();
	SDL_WM_SetCaption(titulo_ventana.c_str(),titulo_ventana.c_str());
	SDL_ShowCursor(SDL_DISABLE);
}

/////////////////////////////////////////////////////////////////////////////
// destruction template methods overrides
/////////////////////////////////////////////////////////////////////////////

void VigasocoSDL::destroyAsyncThread()
{
	delete _asyncThread;
	_asyncThread = 0;
}

void VigasocoSDL::destroyTimer()
{
	delete _timer;
	_timer = 0;
}

void VigasocoSDL::removeCustomInputPlugins()
{
	// delete the plugins and free DLLs
	for (DLLEntries::size_type i = 0; i < _inputPluginsInfo.size(); i++){
		_inputHandler->removeInputPlugin((IInputPlugin *)_inputPluginsInfo[i].plugin);
		_pluginHandler->unloadPlugin(&_inputPluginsInfo[i]);
	}
	_inputPluginsInfo.clear();
}

void VigasocoSDL::destroyDrawPlugin()
{
	_pluginHandler->unloadPlugin(&_drawPluginInfo);
}

void VigasocoSDL::destroyAudioPlugin()
{
	_pluginHandler->unloadPlugin(&_audioPluginInfo);
}

void VigasocoSDL::removeCustomLoaders(FileLoader *fl)
{
	// delete the plugins and free DLLs
	for (DLLEntries::size_type i = 0; i < _loaderPluginsInfo.size(); i++){
		fl->removeLoader((ILoader *)_loaderPluginsInfo[i].plugin);
		_pluginHandler->unloadPlugin(&_loaderPluginsInfo[i]);
	}
	_loaderPluginsInfo.clear();
}

void VigasocoSDL::destroyPalette()
{
	delete _palette;
	_palette = 0;
}

void VigasocoSDL::platformSpecificEnd()
{
	assert(!_drawPluginInfo.libHandle);
	assert(_inputPluginsInfo.size() == 0);
	assert(_loaderPluginsInfo.size() == 0);
	assert(!_audioPluginInfo.libHandle);

	delete _pluginHandler;
	_pluginHandler = 0;
} 

/////////////////////////////////////////////////////////////////////////////
// main loop template methods overrides
/////////////////////////////////////////////////////////////////////////////

bool VigasocoSDL::processEvents()
{
	SDL_Event event;
	if ( SDL_PollEvent(&event) )
	{
		if (event.type==SDL_QUIT) return false;
#ifndef __native_client__
// en el navegador no salimos al pulsar ESC, porque se queda la pantalla sin limpiar y parece que se ha colgado
// habría que buscar una manera de finalizar de una manera elegante
		if (event.type==SDL_KEYDOWN && event.key.keysym.sym==SDLK_ESCAPE) return false;
#endif
	}

	return true;
}

/////////////////////////////////////////////////////////////////////////////
// window procedure
/////////////////////////////////////////////////////////////////////////////

// windows function
//LRESULT CALLBACK VigasocoWin32::wndProc(HWND hWnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
// TODO
// No hay nada parecido por ahora en la version Linux
