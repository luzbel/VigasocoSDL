// SDLMain.cpp
//
// Based on VIGASOCO Project Win32 port (c) 2003 by MAB
//	SDL port @2006,2007,2008,2009,2010,2011,2012,2012+1,2014 by Luzbel
//
//	See readme.txt for license and usage information.
//
/////////////////////////////////////////////////////////////////////////////

#include "VigasocoSDL.h"
#include "SDL.h"
#include "iostream"

#ifdef __native_client__
#include <sys/mount.h>
#include <errno.h>
#endif

typedef std::vector<std::string> Strings;

// default options
std::string g_game("abadia");
// abadIA se suele ejecutar en entornes headless sin salida gráfica
#ifdef __abadIA_HEADLESS__
std::string g_drawPluginsDLL("libVigasocoNULLVideoPlugin.so");
std::string g_drawPlugin("NULLVideoPlugin");
#else
std::string g_drawPluginsDLL("libVigasocoSDLDrawPlugin.so");
std::string g_drawPlugin("win8");
#endif

// Se aÃ±ade plugin NULLAudio sin salida de sonido
// para poder compilar en Windows Services for Linux que no tiene soporte ALSA
// "Audio isnt supported at this time. Were currently focusing on supporting developer scenarios."
// https://blogs.msdn.microsoft.com/commandline/2016/04/06/bash-on-ubuntu-on-windows-download-now-3/
// NULLAudio existe como un plugin dentro de la libreria dinÃ¡mica SDLAudioPlugin
// o como libreria independiente sin ninguna dependencia con SDL
// Ejemplos invocaciones cambiado plugins
// ./VigasocoSDL abadia -video:libVigasocoSDLDrawPlugin.so,win8 -audio:libVigasocoSDLAudioPlugin.so,NULLAudioPlugin
// ./VigasocoSDL abadia -video:libVigasocoSDLDrawPlugin.so,wingris8 -audio:libVigasocoSDLAudioPlugin.so,SDLAudioPlugin
// ./VigasocoSDL abadia -video:libVigasocoSDLDrawPlugin.so,win8 -audio:libVigasocoNULLAudioPlugin.so,NULLAudioPlugin

// abadIA se suele ejecutar en entornes headless sin tarjeta de sonido
#ifdef __abadIA__
std::string g_audioPluginsDLL("libVigasocoNULLAudioPlugin.so");
std::string g_audioPlugin("NULLAudioPlugin");
#else
std::string g_audioPluginsDLL("libVigasocoSDLAudioPlugin.so");
std::string g_audioPlugin("SDLAudioPlugin");
#endif

Strings g_inputPluginsDLLs;
Strings g_inputPlugins;
Strings g_paths;

#ifdef __abadIA__
bool gb_test(false);  // Âestamos en modo normal o ejecutando tests de pruebas?
std::string g_test("");  // Escenario de pruebas
#endif

// parser helper function
bool parseCommandLine(std::string cmdLine);

void showError(std::string error);
void showUsage(std::string error);

/////////////////////////////////////////////////////////////////////////////
//	SDL application entry point
/////////////////////////////////////////////////////////////////////////////

#ifdef __native_client__
int internal_game_main(void *ptr);

//666 777 TODO pruebas nuevo SDLMain en pepper_35 
// int game_main(void *ptr)
int main(int argc,char **argv)
{
	SDL_Thread *thread=NULL;
        int threadReturnValue;

			// la rom, archivos de sonido, graficos VGA,etc.
			// se descargan via http 
//Â¿funciona con el http mount por defecto de SDL_Main ???
// en el servidor web esta directamente el directorio abadia
// y SDL_Main monta el /
// pero si creamos un directorio roms en la raiz del servidor web, y dentro va el directorio abadia, entonces si va
//666 777
int result=666;
	//pruebas
	//con localhost no monta bien, uso ubuntu que es lo que hay en el /etc/hostname
	// y /etc/host para pruebas locales
	//int result = mount("http://ubuntu/", "/roms", "httpfs", 0, "");
	//int result = mount("http://192.168.159.176/", "/roms", "httpfs", 0, "");

	//almacenado en google drive
	//int result = mount("https://googledrive.com/host/0B2D2jhRcf6o-Z2VwcUp0TDBIa0k/", "/roms", "httpfs", 0, "");
	// los de google drive han cambiado el enlace, al ir al interior redirigen a este otro
	// ver si see puede recibir como parametro desde la web para evitar que si lo cambian otra vez no funcione
//666 777 comentado mientras pruebo en local
	//int result = mount("https://d7a3675a31436e0742da09235a5ca70b3ec1902d.googledrive.com/host/0B2D2jhRcf6o-Z2VwcUp0TDBIa0k/", "/roms", "httpfs", 0, "");
	printf("result mount httpfs =%d %s\n",result,strerror(errno));

	//almacenado en google drive la version para 99redpotions
	//int result = mount("https://googledrive.com/host/0B2D2jhRcf6o-Z2VwcUp0TDBIa0k/abadia99rp/", "/roms", "httpfs", 0, "");
	//printf("result mount httpfs =%d %s\n",result,strerror(errno));

			// para poder cargar y grabar la partida
			// se usa el almacenamiento persistente de HTML5
			// en el javascrip de la pagina hay que reservar el espacio
			// y el usuario debe aceptar la solicitud en el navegador
			// 
			// para comprobar que se ha generado el fichero abadia.save
			// ir en el navegador a 
			// filesystem:http://ubuntu/persistent/
			// cambiando ubuntu por el hosting correspondiente
	//result = mount("UNUSED", "/save", "html5fs", 0, "type=PERSISTENT,expected_size=1024*20");
	result = mount("", "/save", "html5fs", 0, "type=PERSISTENT,expected_size=20480");
	printf("result mount html5fs =%d %d %s\n",result,errno,strerror(errno));

	thread=SDL_CreateThread(internal_game_main,(void *)NULL);
	if(NULL==thread)
        {
                //printf("ERR createthread\n");
        }
        else
        {
                SDL_WaitThread( thread, &threadReturnValue);
                //printf("despues de waitthread\n");
        }
	return 0;
}

int internal_game_main(void *ptr)
{
	int argc=1;
	const char *argv[]={ "test" };
	//argc=3; const char *argv[]={ "da-igual", "abadia" "-video:libVigasocoSDLDrawPlugin.so,wingris8" };;

#else
int main(int argc,char **argv)
{
#endif
	std::string szCmdLine;
	for ( int icont=1;icont<argc;icont++)
	{
		szCmdLine+=argv[icont];
		szCmdLine+=" ";	
	}

	if (!parseCommandLine(szCmdLine)){
		showUsage("Unknown parameters! Read the documentation for detailed information about usage.");
		return -1;
	}
	VigasocoSDL VIGASOCO( g_game, g_drawPluginsDLL, g_drawPlugin,
				g_inputPluginsDLLs, g_inputPlugins,
				g_audioPluginsDLL, g_audioPlugin,
				g_paths);
	// init the game
	if (!VIGASOCO.init(g_game)){
		VIGASOCO.end();
		SDL_Quit(); //TODO: REVISAR SI ES CORRECTO HACER EL SDL_Quit aqui
		// if there was an error, show it and exit
		showError(VIGASOCO.getError());

		return -1;
	}

	// run until the user has closed the window
	VIGASOCO.mainLoop();

	// cleanup
	VIGASOCO.end();

	SDL_Quit();

	return 0;
}


/////////////////////////////////////////////////////////////////////////////
//	Parser helper functions
/////////////////////////////////////////////////////////////////////////////

void split(std::string source, char splitChar, Strings *strings)
{
	std::string::size_type index, prevIndex = 0;
	
	do {
		// find next occurrence of the splitChar
		index = source.find(splitChar, prevIndex);

		// get substring from previous occurrence to this occurrence
		std::string substr = (source.substr(prevIndex, index - prevIndex));

		// if it's not the empty substring, save it
		if (substr.size() != 0){
			strings->push_back(substr);
		}

		prevIndex = index + 1;
	} while (index != std::string::npos);
}

#ifdef __abadIA__
bool parseTests(Strings &params)
{
	if (params.size() != 2){
		return false;
	}

	g_test=params[1];
	gb_test=true;
	
	return true;
}
#endif

bool parseVideo(Strings &params)
{
	for (std::string::size_type i = 1; i < params.size(); i++){
		Strings subParams;

		// split parameter in DLL and plugin
		split(params[i], ',', &subParams);

		if (subParams.size() != 2){
			return false;
		}

		// save DLL and plugin
		g_drawPluginsDLL = subParams[0];
		g_drawPlugin = subParams[1];
	}

	return true;
}

bool parseAudio(Strings &params)
{
	for (std::string::size_type i = 1; i < params.size(); i++){
		Strings subParams;

		// split parameter in DLL and plugin
		split(params[i], ',', &subParams);

		if (subParams.size() != 2){
			return false;
		}

		// save DLL and plugin
		g_audioPluginsDLL = subParams[0];
		g_audioPlugin = subParams[1];
	}

	return true;
}

bool parseInputs(Strings &params)
{
	for (std::string::size_type i = 1; i < params.size(); i++){
		Strings subParams;

		// split parameter in DLL and plugin groups
		split(params[i], ';', &subParams);

		for (std::string::size_type j = 0; j < subParams.size(); j++){
			Strings pluginInfo;

			// split parameter in DLL and plugin
			split(subParams[j], ',', &pluginInfo);

			if (pluginInfo.size() != 2){
				return false;
			}

			// save DLL and plugin
			g_inputPluginsDLLs.push_back(pluginInfo[0]);
			g_inputPlugins.push_back(pluginInfo[1]);
		}
	}

	return true;
}

bool parsePaths(Strings &params)
{
	if (params.size() != 2){
		return false;
	}

	// split multiple paths
	split(params[1], ';', &g_paths);

	return true;
}

bool parseCommands(Strings &params)
{
	for (std::string::size_type i = 1; i < params.size(); i++){
		Strings subParams;

		// split parameter in command and arguments
		split(params[i], ':', &subParams);

		// process known commands
		if (subParams[0] == "-video"){
			if (!parseVideo(subParams))	return false;
		} else if (subParams[0] == "-input"){
			if (!parseInputs(subParams))	return false;
		} else if (subParams[0] == "-audio"){
			if (!parseAudio(subParams))	return false;
		} else if (subParams[0] == "-path"){
			if (!parsePaths(subParams))	return false;
#ifdef __abadIA__
		} else if (subParams[0] == "-test"){  // Escenarios de tests
			if (!parseTests(subParams))	return false;
#endif
		} else {	// error
			return false;
		}
	}

	return true;
}

bool parseCommandLine(std::string cmdLine)
{
	Strings params;

	// split user parameters
	split(cmdLine, ' ', &params);

	// parse user parameters
	if (params.size() > 0){
		g_game = params[0];

		if (params.size() > 1){
			if (!parseCommands(params)){
				return false;
			}
		}
	}

	// if the user hasn't set any input plugin, set the default one
	if (g_inputPluginsDLLs.size() == 0){
#ifdef __abadIA__
		g_inputPluginsDLLs.push_back("libVigasocoHTTPInputPlugin.so");
		g_inputPlugins.push_back("crowV3");
#else
		g_inputPluginsDLLs.push_back("libVigasocoSDLInputPlugin.so");
		g_inputPlugins.push_back("SDLInputPlugin");
#endif
	}

	return true;
}

void showError(std::string error)
{
	if (error == ""){
		std::cerr << 
		"Unexpected error loading VIGASOCO. "
		"Read the manual for usage information!" << std::endl <<
		"Error!" << std::endl;
	} else {
		std::cerr << error.c_str() << std::endl << "Error!" << std::endl;
	} 
}

void showUsage(std::string error)
{
	std::cerr << (error +
		"\nUsage: vigasoco <game> "
		"-video:<pluginDLL>, <plugin> "
		"-input:{<pluginDLL>, <plugin>;}* <pluginDLL>, <plugin>"
		"-path:{<path>;}* <path>"
		) << std::endl << "Error!" << std::endl;
}
