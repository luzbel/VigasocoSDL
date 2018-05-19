// HTTPInputPluginV2.cpp
// Una interfaz menos intrusiva con el bucle principal de Vigasoco
// Necesita usarse de forma combinada con el plugin PollEvent 
// de SDLInputKeyboardPlugin.so
//
/////////////////////////////////////////////////////////////////////////////

#include <cassert>
#include "HTTPInputPluginV2.h"

#include "crow_all.h"

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

HTTPInputPluginV2::HTTPInputPluginV2()
{
	_juego=NULL;
}

HTTPInputPluginV2::~HTTPInputPluginV2()
{
}

void HTTPInputPluginV2::update(Abadia::Juego* subject, int data) 
{
fprintf(stderr,"HTTPInputPluginV2::update\n");
}

void HTTPInputPluginV2::simulateKeys(int repeat, int interval, std::vector<char *> keys )
{
	std::thread keyThread([repeat,interval,keys]() {
		fprintf(stderr,"dentro repeat %d interval %d key0 %s size %d\n",
			repeat,interval,keys[0],(int)keys.size()); 
		int r=repeat;
		//while (repeat--) {
		while (r--) {
			for(int i=0;i<keys.size();i++) 
			{	
				SDL_Event sdlevent = {};
				sdlevent.type = SDL_KEYDOWN;
				sdlevent.key.state=SDL_PRESSED;
				fprintf(stderr,"i %d keys[i] %s atoi %d\n",
					i,keys[i],std::atoi(keys[i]));
				sdlevent.key.keysym.sym = SDLKey(std::atoi(keys[i]));
				SDL_PushEvent(&sdlevent);
			} 
			std::this_thread::sleep_for(std::chrono::milliseconds(interval));
		} 
	});
 	// no podemos hacer detach porque desapareceria del contexto la variable keys que usa el hilo que envia los eventos
	//keyThread.detach();
	keyThread.join();  // para esto no montamos un hilo, pero mientras arreglamos lo del contexto
}

bool HTTPInputPluginV2::init(Abadia::Juego *juego)
{
	_juego=juego;
	_juego->attach(this);
	std::thread webThread([this]() {
		crow::SimpleApp app;

		CROW_ROUTE(app, "/reset")([this](){
//TODO : poner constantes para  10 y 25 que se puedan usar varias veces por el codigo
			std::vector<char *> keys;
			char rEset[]="101"; // TODO, convertir a cadena SDLK_e
			keys.push_back(rEset);
//			keys.push_back(std::to_string(SDLK_e).c_str());
// y si en vez de pasar un array simplemente pasamos una cadena que recorremos
// y cada char un caracter ¿puede ser problema con alguna tecla ?
// o seguir usando SDLKeys ...???
			simulateKeys(10,25,keys);
                	return crow::response(200);
        	});		

		CROW_ROUTE(app, "/fin")([](){
			SDL_Event sdlevent = {};
			sdlevent.type = SDL_QUIT;
			SDL_PushEvent(&sdlevent);
			return crow::response(200);
		});

		CROW_ROUTE(app, "/dump")([this](){
			std::unique_lock<std::mutex> lock(eventMutex);
			eventos[evDUMP]=false;
			std::vector<char *> keys;
			char key[]="100"; // SDLK_d , d de Dump
			keys.push_back(key);
			simulateKeys(20,25,keys);	
			conditionVariable[evDUMP].wait(lock,[this]{ return eventos[evDUMP]; });
// y si el DUMP ha ido mal????
bool ok=true;
       			if (ok) { // TODO: falta control errores
				std::stringstream json;
				char dump[8192]; //TODO: intentar que sea dinamico
				std::ifstream dumpfile("abadIA.dump");
				dumpfile.read(dump,8192);
				return crow::response(200, dump);
			}
			else  return crow::response(500, "ERR dumping state"); 
		});

#ifdef _CROW_V1_COMPATIBLE_MODE_
		CROW_ROUTE(app, "/cmd/<string>")([this](crow::request req, std::string comando){
			// cursor Arriba 
			std::vector<char *> keys;
			char key[4]; 
			switch (comando.at(0)) {	
				// TODO: convertir los valores desde SDLK_ y no poner la cadena a fuego
				case 'A': strcpy(key,"273"); break; // cursor Arriba
				case 'B': strcpy(key,"274"); break; // cursor aBajo
				case 'D': strcpy(key,"275"); break; // cursor Derecha
				case 'I': strcpy(key,"276"); break; // cursor Izquierda
				case '_': strcpy(key,"32"); break; // barra espaciadora
				case 'Q': strcpy(key,"113"); break; // Q
				case 'R': strcpy(key,"114"); break; // R
				default: return crow::response(400,"cmd desconocido");
			}
			keys.push_back(key);
			simulateKeys(10,25,keys);
			return crow::response(200);
		});

		CROW_ROUTE(app, "/saveJSON")([this](){
			std::unique_lock<std::mutex> lock(eventMutex);
			eventos[evSAVE]=false;
			std::vector<char *> keys;
			char key[]="103"; // SDLK_g , g de Grabar
			keys.push_back(key);
			simulateKeys(10,25,keys);	
			conditionVariable[evSAVE].wait(lock,[this]{ return eventos[evSAVE]; });
			   // lo que sigue estÃ¡cubierto por el lock????
// y si el SAVE ha ido mal????
bool ok=true;
       			if (ok) { // TODO: falta control errores
				std::stringstream json;
				char dump[8192]; //TODO: intentar que sea dinamico
				std::ifstream savefile("abadia0.save");
				savefile.read(dump,8192);
				json << "{\"snapshot\":\"" << dump << "\"}";
				return crow::response(200, json.str());
			}
			else  return crow::response(500, "ERR saving"); 
		});

		CROW_ROUTE(app, "/loadJSON").methods("POST"_method)([this](const crow::request& req){
			auto x=crow::json::load(req.body);
			if(!x) return crow::response(500);
			std::ofstream savefile("abadia0.save");
                        // si se enví�a asi curl -v -X POST  --data @crow.sav.json http://localhost:4477/loadJSON
                        // se come los cambios de linea y no nos vale. Se tiene que enviar así
                        // curl -v -X POST  -T crow.save.json http://localhost:4477/loadJSON
			savefile << x["snapshot"].s();
			savefile.close();
			std::unique_lock<std::mutex> lock(eventMutex);
			std::vector<char *> keys;
			char key[]="99";  // SDLK_c , c de Cargar
			keys.push_back(key);
			simulateKeys(10,25,keys);
			eventos[evLOAD]=false;
			conditionVariable[evLOAD].wait(lock,[this]{ return eventos[evLOAD]; });
// y si el LOAD ha ido mal????
                	return crow::response(200);
		});
#endif

		CROW_ROUTE(app, "/save")([this](){
			std::unique_lock<std::mutex> lock(eventMutex);
			eventos[evSAVE]=false;
			std::vector<char *> keys;
			char key[]="103"; // SDLK_g , g de Grabar
			keys.push_back(key);
			simulateKeys(10,25,keys);	
			conditionVariable[evSAVE].wait(lock,[this]{ return eventos[evSAVE]; });
			   // lo que sigue estÃ¡cubierto por el lock????
// y si el SAVE ha ido mal????
bool ok=true;
       			if (ok) { // TODO: falta control errores
				std::stringstream json;
				char dump[8192]; //TODO: intentar que sea dinamico
				std::ifstream savefile("abadia0.save");
				savefile.read(dump,8192);
				return crow::response(200, dump);
			}
			else  return crow::response(500, "ERR saving"); 
		});

		CROW_ROUTE(app, "/load").methods("POST"_method)([this](const crow::request& req){
	                std::ofstream savefile("abadia0.save");
                        // si se enva asi curl -v -X POST  --data @crow.save http://localhost:4477/loa
                        // se come los cambios de linea y no nos vale. Se tiene que enviar asÃ­
                        // curl -v -X POST  -T crow.save http://localhost:4477/load
	                savefile << req.body;
	                savefile.close();
			std::vector<char *> keys;
			char key[]="99";  // SDLK_c , c de Cargar
			keys.push_back(key);
			simulateKeys(10,25,keys);
			eventos[evLOAD]=false;
			std::unique_lock<std::mutex> lock(eventMutex);
			conditionVariable[evLOAD].wait(lock,[this]{ return eventos[evLOAD]; });
// y si el LOAD ha ido mal????
			return crow::response(200);
		});


		// ejemplo enviar QR . SDLK_q=113 y SDLK_r=114
		// /simulate?repeat=10&interval=25&keys[]=113&keys[]=114	
		CROW_ROUTE(app, "/simulate")([this](crow::request req){
			int repeat=10;   // cuantas veces repetir el envio del evento
			int interval=25; // ms entre repeticion
			if(req.url_params.get("repeat") != nullptr) {
		            repeat = boost::lexical_cast<int>(req.url_params.get("repeat"));
        		};
			if(req.url_params.get("interval") != nullptr) {
		            interval = boost::lexical_cast<int>(req.url_params.get("interval"));
        		};
			auto keys = req.url_params.get_list("keys");
			//std::vector<char *> keys = req.url_params.get_list("keys");
			if (keys.size()<1) crow::response(400);
fprintf(stderr,"fuera repeat %d interval %d key0 %s size %d\n",repeat,interval,keys[0],(int)keys.size()); 

                        simulateKeys(repeat,interval,keys);

                        return crow::response(200);
                });

                app.port(8182).run();
        });
        webThread.detach();
        return true;
}

void HTTPInputPluginV2::end()
{
	if ( _juego )
		_juego->detach(this); 
}

void HTTPInputPluginV2::acquire()
{
}

void HTTPInputPluginV2::unAcquire()
{
}

/////////////////////////////////////////////////////////////////////////////
// input processing
/////////////////////////////////////////////////////////////////////////////

bool HTTPInputPluginV2::process(int *inputs)
{
	// El servidor web no modifica ninguna variable de esta clase para indicr
	// que se debe devolver false en process para salir del juego
	// En su lugar inyecta el evento SDL_QUIT para que se procese adecuadamente
	// con el plugin PollEvent
	return true;
}

/////////////////////////////////////////////////////////////////////////////
// helper methods
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// Custom plugin properties
/////////////////////////////////////////////////////////////////////////////

const std::string HTTPInputPluginV2::g_properties[] = {
};

const int HTTPInputPluginV2::g_paramTypes[] = {
	// TODO: resolver este cast de forma elegante
	(int)(PARAM_ARRAY | PARAM_INPUT)
	// TODO ?hace falta o se puede eliminar??
};

const int * HTTPInputPluginV2::getPropertiesType() const
{
	return HTTPInputPluginV2::g_paramTypes;
}

const std::string * HTTPInputPluginV2::getProperties(int *num) const 
{
	*num = sizeof(g_paramTypes)/sizeof(g_paramTypes[0]);
	return HTTPInputPluginV2::g_properties;
}

void HTTPInputPluginV2::setProperty(std::string prop, int data)
{
}

void HTTPInputPluginV2::setProperty(std::string prop, int index, int data)
{
}

int HTTPInputPluginV2::getProperty(std::string prop) const
{
	return -1;
};

int HTTPInputPluginV2::getProperty(std::string prop, int index) const
{
	return -1; 
};
