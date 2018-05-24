// HTTPInputKeyboardPluginV1.cpp
// Mantiene la interfaz web original para ser retrocompatible con agentes
// antiguos.
//
/////////////////////////////////////////////////////////////////////////////

#include <cassert>
#include "HTTPInputPluginV1.h"

#include <vector>
#include "crow_all.h"

SDLKey HTTPInputPluginV1::g_keyMapping[END_OF_INPUTS];

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

HTTPInputPluginV1::HTTPInputPluginV1()
{
	memset(keystate,0,sizeof(keystate));
	_juego=NULL;
	initRemapTable();
}

HTTPInputPluginV1::~HTTPInputPluginV1()
{
}

void HTTPInputPluginV1::update(Abadia::Juego* subject, int data) 
{
fprintf(stderr,"HTTPInputPluginV1::update\n");
/*
	switch ((EventType)data) {
		case RESET:
			std::lock_guard<std::mutex> lock(eventMutex); 
			break;
		default: fprintf(stderr,"HTTPInputPluginV1::update Tipo update desconocido\n");
	}
*/
	if (data>=0 && data <= evEVENT_LAST) {
			std::lock_guard<std::mutex> lock(eventMutex);
			eventos[data]=true; 
			conditionVariable[data].notify_one();
	} else {
		fprintf(stderr,"HTTPInputPluginV1::update Tipo update desconocido\n");
	}
}

void HTTPInputPluginV1::cleanKeys() {
  keystate[SDLK_e]=
  keystate[SDLK_UP]=
  keystate[SDLK_RIGHT]=
  keystate[SDLK_LEFT]=
  keystate[SDLK_DOWN]=
  keystate[SDLK_SPACE]=
  keystate[SDLK_F5]=             // TODO: esto se hace aquÃ­ o solo con el comando \0
  keystate[SDLK_q]=
  keystate[SDLK_r]=
  keystate[SDLK_F5]=
  keystate[SDLK_d]=
  keystate[SDLK_LEFT]=false;
}

// TODO: en V2 habrá que sobrecargar esta funci�n con una variante que acepte varias 
// teclas a la vez y ver como resolver que evento esperar
void HTTPInputPluginV1::sendActionAndWaitForEvent(SDLKey key, EventType event) 
{
//TODO: faltan asserts para controlar el rango de key dentro de las SDLKeys conocidas
//TODO: faltan asserts para controlar el rango de eventos
			std::unique_lock<std::mutex> lock(eventMutex);
			cleanKeys();
			HTTPInputPluginV1::keystate[key]=true;
			eventos[event]=false;
			conditionVariable[event].wait(lock,[this,event](){ return eventos[event]; });
			eventos[event]=false; // Para evitar confusiones si se traza el array
			HTTPInputPluginV1::keystate[key]=false;
}

bool HTTPInputPluginV1::init(Abadia::Juego *juego)
{
	_juego=juego;
	_juego->attach(this);

	std::thread webThread([this]() {
		crow::SimpleApp app;

		CROW_ROUTE(app, "/reset")([this](){
/*
			std::unique_lock<std::mutex> lock(eventMutex);
			cleanKeys();
			HTTPInputPluginV1::keystate[SDLK_e]=true;
			eventos[evRESET]=false;
			conditionVariable[evRESET].wait(lock,[this]{ return eventos[evRESET]; });
			HTTPInputPluginV1::keystate[SDLK_e]=false;
*/
			sendActionAndWaitForEvent(SDLK_e,evRESET);	
                	return crow::response(200);
        	});		

		CROW_ROUTE(app, "/fin")([](){
			SDL_Event sdlevent = {};
			sdlevent.type = SDL_QUIT;
			SDL_PushEvent(&sdlevent);
			return crow::response(200);
		});

		CROW_ROUTE(app, "/dump")([this](){
/*
fprintf(stderr,"sigue reset activo: %d\n",eventos[evRESET]);
			cleanKeys();
//			HTTPInputPluginV1::keystate[SDLK_e]=false;
//llamar a InfoJuego->muestraInfo ... pero y si se toca algo mientras se genera
//si pulsamos una tecla que genere el dump ?como lo recuperamos luego?
//?un tocho string con algun tipo de bloqueo para hilos???
                	//return crow::response(200);
//                	return crow::response(500,"Sin implementar");

			std::unique_lock<std::mutex> lock(eventMutex);
			cleanKeys();
//			HTTPInputPluginV1::keystate[SDLK_F5]=true;
			HTTPInputPluginV1::keystate[SDLK_d]=true;
			eventos[evDUMP]=false;
			conditionVariable[evDUMP].wait(lock,[this]{ return eventos[evDUMP]; });
			HTTPInputPluginV1::keystate[SDLK_d]=false;
//			HTTPInputPluginV1::keystate[SDLK_F5]=false;
*/
			sendActionAndWaitForEvent(SDLK_d,evDUMP);	
// y si el DUMP ha ido mal????
bool ok=true;
       			if (ok) { // TODO: falta control errores
				std::stringstream json;
				char dump[8192]; //TODO: intentar que sea dinamico
				memset(dump,'\0',sizeof(dump));
				std::ifstream dumpfile("abadIA.dump");
				dumpfile.read(dump,8192);
				return crow::response(200, dump);
			}
			else  return crow::response(500, "ERR dumping state"); 
		});

		CROW_ROUTE(app, "/cmd/A")([this](){
			// A de arriba
			sendActionAndWaitForEvent(SDLK_UP,evUP);	
                	return crow::response(200);
		});

		CROW_ROUTE(app, "/cmd/D")([this](){
			// D de derecha
			sendActionAndWaitForEvent(SDLK_RIGHT,evRIGHT);	
                	return crow::response(200);
		});
		CROW_ROUTE(app, "/cmd/I")([this](){
			// I de izquierda
			sendActionAndWaitForEvent(SDLK_LEFT,evLEFT);	
                	return crow::response(200);
		});
		CROW_ROUTE(app, "/cmd/B")([this](){
			// Cursos aBajo para mover a ADSO
			sendActionAndWaitForEvent(SDLK_DOWN,evDOWN);	
                	return crow::response(200);
		});
		CROW_ROUTE(app, "/cmd/_")([this](){
			// barra espaciadora
			sendActionAndWaitForEvent(SDLK_SPACE,evSPACE);	
                	return crow::response(200);
		});
		CROW_ROUTE(app, "/cmd/E")([this](){
			cleanKeys();
			// Volcado del estado
			HTTPInputPluginV1::keystate[SDLK_F5]=true;
// TODO: falla porque se queda todo el rato activando y desactivando
                	return crow::response(500);
		});
		CROW_ROUTE(app, "/cmd/e")([this](){
			cleanKeys();
			// Desactivar el volcado del estado
			HTTPInputPluginV1::keystate[SDLK_F5]=true;
// TODO: falla porque se queda todo el rato activando y desactivando
                	return crow::response(500);
		});
		CROW_ROUTE(app, "/cmd/Q")([this](){
			cleanKeys();
			//
			HTTPInputPluginV1::keystate[SDLK_q]=true;
                	return crow::response(200);
		});
		CROW_ROUTE(app, "/cmd/R")([this](){
			cleanKeys();
			// 
			HTTPInputPluginV1::keystate[SDLK_r]=true;
                	return crow::response(200);
		});
		CROW_ROUTE(app, "/cmd/F")([this](){
			cleanKeys();
			// F de fin
       			SDL_Event sdlevent = {};
			sdlevent.type = SDL_QUIT;
			SDL_PushEvent(&sdlevent);
			return crow::response(200);
		});

		// TODO: fusionar con save y hacer un if segn el headeraccept application/json o no
		CROW_ROUTE(app, "/saveJSON")([this](){
			// ejemplo: curl http://localhost:4477/saveJSON > crow.save.json
/*
			std::string json;

			json = "{}";

			bool ok=false;//elJuego->save(0);
			if (ok) { // TODO: falta control errores
				std::stringstream json;
				char dump[8192]; //TODO: intentar que sea dinamico
				std::ifstream savefile("abadia0.save");
				savefile.read(dump,8192);
				json << "{\"snapshot\":\"" << dump << "\"}";
				return crow::response(200, json.str());
			}
			else  return crow::response(500, json); */

/*
			std::unique_lock<std::mutex> lock(eventMutex);
			cleanKeys();
			HTTPInputPluginV1::keystate[SDLK_g]=true;
			eventos[evSAVE]=false;
			conditionVariable[evSAVE].wait(lock,[this]{ return eventos[evSAVE]; });
			   // lo que sigue estÃ¡cubierto por el lock????
			HTTPInputPluginV1::keystate[SDLK_g]=false; // esto estÃ ¡cubierto por el lock????
*/
			sendActionAndWaitForEvent(SDLK_g,evSAVE);	
// y si el SAVE ha ido mal????
bool ok=true;
       			if (ok) { // TODO: falta control errores
				std::stringstream json;
				char dump[8192]; //TODO: intentar que sea dinamico
				memset(dump,'\0',sizeof(dump));
				std::ifstream savefile("abadia0.save");
				savefile.read(dump,8192);
				json << "{\"snapshot\":\"" << dump << "\"}";
				return crow::response(200, json.str());
			}
			else  return crow::response(500, "ERR saving"); 
	        });

	        CROW_ROUTE(app, "/save")([this](){
                        // ejemplo: curl http://localhost:4477/save > crow.save
/*
			bool ok=elJuego->save(0);
			if (ok) { // TODO: falta control errores
                        	char dump[8192]; //TODO: intentar que sea dinamico
                        	std::ifstream savefile("abadia0.save");
	                        savefile.read(dump,8192);
				return crow::response(200, dump);
                	}
	                else  return crow::response(500);
*/

/*
			std::unique_lock<std::mutex> lock(eventMutex);
			cleanKeys();
			HTTPInputPluginV1::keystate[SDLK_g]=true;
			eventos[evSAVE]=false;
			conditionVariable[evSAVE].wait(lock,[this]{ return eventos[evSAVE]; });
				// lo que sigue estÃ ¡cubierto por el lock????
			HTTPInputPluginV1::keystate[SDLK_g]=false; // esto estÃ¡cubierto por el lock????
*/

			sendActionAndWaitForEvent(SDLK_g,evSAVE);	

bool ok=true;// y si el SAVE ha ido mal????
			if (ok) { // TODO: falta control errores
                        	char dump[8192]; //TODO: intentar que sea dinamico
				memset(dump,'\0',sizeof(dump));
                        	std::ifstream savefile("abadia0.save");
	                        savefile.read(dump,8192);
				return crow::response(200, dump);
                	}
	                else  return crow::response(500,"ERR saving");
	        });

                // TODO: fusionar con load y hacer un if segn el header content-type application/json o no
	        CROW_ROUTE(app, "/loadJSON").methods("POST"_method)([this](const crow::request& req) {
                	auto x=crow::json::load(req.body);
	                if (!x) return crow::response(500);
                	std::ofstream savefile("abadia0.save");
                        // si se envíaasi curl -v -X POST  --data @crow.sav.json http://localhost:4477/loadJSON
                        // se come los cambios de linea y no nos vale. Se tiene que enviar así
                        // curl -v -X POST  -T crow.save.json http://localhost:4477/loadJSON
	                savefile << x["snapshot"].s();
	                savefile.close();
/*
	                std::string json;

	                json = "{}";
	                bool ok=elJuego->cargar(0);

	                if (ok) {
		                elJuego->reset();
				return crow::response(200, json);
                	}
                	else return crow::response(500, "{ \"MUST RESET\"}" ); // TODO: mandar el reset aqui mismo
*/

/*
			std::unique_lock<std::mutex> lock(eventMutex);
			cleanKeys();
			HTTPInputPluginV1::keystate[SDLK_c]=true;
			eventos[evLOAD]=false;
			conditionVariable[evLOAD].wait(lock,[this]{ return eventos[evLOAD]; });
			HTTPInputPluginV1::keystate[SDLK_c]=false; */
			sendActionAndWaitForEvent(SDLK_c,evLOAD);	
// y si el LOAD ha ido mal????
                	return crow::response(200);
 
        	});

	        CROW_ROUTE(app, "/load").methods("POST"_method)([this](const crow::request& req) {
	                std::ofstream savefile("abadia0.save");
                        // si se enva asi curl -v -X POST  --data @crow.save http://localhost:4477/loa
                        // se come los cambios de linea y no nos vale. Se tiene que enviar asÃ­
                        // curl -v -X POST  -T crow.save http://localhost:4477/load
	                savefile << req.body;
	                savefile.close();
/*
	                std::string json;

	                json = "{}";
	                bool ok=elJuego->cargar(0);

	                if (ok) {
		                elJuego->reset();
				return crow::response(200, json);
	                }
	                else return crow::response(500, "{ \"MUST RESET\"}" ); // TODO: mandar el reset aqui mismo
*/
/*
			std::unique_lock<std::mutex> lock(eventMutex);
			cleanKeys();
			HTTPInputPluginV1::keystate[SDLK_c]=true;
			eventos[evLOAD]=false;
			conditionVariable[evLOAD].wait(lock,[this]{ return eventos[evLOAD]; });
			HTTPInputPluginV1::keystate[SDLK_c]=false; */
			sendActionAndWaitForEvent(SDLK_c,evLOAD);	
// y si el LOAD ha ido mal????
                	return crow::response(200);
        	});

		app.port(4477).run();
	});
	webThread.detach();
	return true;
}

void HTTPInputPluginV1::end()
{
	if ( _juego )
		_juego->detach(this); 
}

void HTTPInputPluginV1::acquire()
{
}

void HTTPInputPluginV1::unAcquire()
{
}

/////////////////////////////////////////////////////////////////////////////
// input processing
/////////////////////////////////////////////////////////////////////////////

bool HTTPInputPluginV1::process(int *inputs)
{
	// iterate through the inputs checking associated keys
	for (int i = 0; i < END_OF_INPUTS; i++){
		// if we're interested in that input, check it's value
		if (inputs[i] >= 0){
			// if the input is mapped and the key is pressed,
			// update inputs
			if (g_keyMapping[i] != 0){
				if (keystate[g_keyMapping[i]] ){
//fprintf(stderr,"keystate %d keymap %d\n",i,g_keyMapping[i]);
					inputs[i]++;
				}
			}
		}
	}

	// El servidor web no modifica ninguna variable de esta clase para indicr
	// que se debe devolver false en process para salir del juego
	// En su lugar inyecta el evento SDL_QUIT para que se procese adecuadamente
	// con el plugin PollEvent
	return true; // este plugin no tiene nada para provocar la salida del juego
}

/////////////////////////////////////////////////////////////////////////////
// helper methods
/////////////////////////////////////////////////////////////////////////////

void HTTPInputPluginV1::initRemapTable()
{
	memset(g_keyMapping, 0, sizeof(g_keyMapping));

	// game driver inputs

	g_keyMapping[P1_UP] = SDLK_UP;
	g_keyMapping[P1_LEFT] = SDLK_LEFT;
	g_keyMapping[P1_DOWN] = SDLK_DOWN;
	g_keyMapping[P1_RIGHT] = SDLK_RIGHT;

	g_keyMapping[P1_BUTTON1] = SDLK_LCTRL;
	g_keyMapping[P1_BUTTON1] = SDLK_SPACE;
	g_keyMapping[P1_BUTTON2] = SDLK_LSUPER;

	g_keyMapping[P2_UP] = SDLK_w;
	g_keyMapping[P2_LEFT] = SDLK_a; 
	g_keyMapping[P2_DOWN] = SDLK_s;
	g_keyMapping[P2_RIGHT] = SDLK_d;
	g_keyMapping[P2_BUTTON1] = SDLK_y;
	g_keyMapping[P2_BUTTON2] = SDLK_u;

	g_keyMapping[START_1] = SDLK_1;
	g_keyMapping[START_2] = SDLK_2;
	g_keyMapping[COIN_1] = SDLK_5;
	g_keyMapping[COIN_2] = SDLK_6;
	g_keyMapping[SERVICE_1] = SDLK_9;
	g_keyMapping[SERVICE_2] = SDLK_0;

	// keyboard inputs
	g_keyMapping[KEYBOARD_A] = SDLK_a;
	g_keyMapping[KEYBOARD_B] = SDLK_b;
	g_keyMapping[KEYBOARD_C] = SDLK_c;
	g_keyMapping[KEYBOARD_D] = SDLK_d;
	g_keyMapping[KEYBOARD_E] = SDLK_e;
	g_keyMapping[KEYBOARD_F] = SDLK_f;
	g_keyMapping[KEYBOARD_G] = SDLK_g;
	g_keyMapping[KEYBOARD_H] = SDLK_h;
	g_keyMapping[KEYBOARD_I] = SDLK_i;
	g_keyMapping[KEYBOARD_J] = SDLK_j;
	g_keyMapping[KEYBOARD_K] = SDLK_k;
	g_keyMapping[KEYBOARD_L] = SDLK_l;
	g_keyMapping[KEYBOARD_M] = SDLK_m;
	g_keyMapping[KEYBOARD_N] = SDLK_n;
	g_keyMapping[KEYBOARD_O] = SDLK_o;
	g_keyMapping[KEYBOARD_P] = SDLK_p;
	g_keyMapping[KEYBOARD_Q] = SDLK_q;
	g_keyMapping[KEYBOARD_R] = SDLK_r;
	g_keyMapping[KEYBOARD_S] = SDLK_s;
	g_keyMapping[KEYBOARD_T] = SDLK_t;
	g_keyMapping[KEYBOARD_U] = SDLK_u;
	g_keyMapping[KEYBOARD_V] = SDLK_v;
	g_keyMapping[KEYBOARD_W] = SDLK_w;
	g_keyMapping[KEYBOARD_X] = SDLK_x;
	g_keyMapping[KEYBOARD_Y] = SDLK_y;
	g_keyMapping[KEYBOARD_Z] = SDLK_z;
	g_keyMapping[KEYBOARD_0] = SDLK_0;
	g_keyMapping[KEYBOARD_1] = SDLK_1;
	g_keyMapping[KEYBOARD_2] = SDLK_2;
	g_keyMapping[KEYBOARD_3] = SDLK_3;
	g_keyMapping[KEYBOARD_4] = SDLK_4;
	g_keyMapping[KEYBOARD_5] = SDLK_5;
	g_keyMapping[KEYBOARD_6] = SDLK_6;
	g_keyMapping[KEYBOARD_7] = SDLK_7;
	g_keyMapping[KEYBOARD_8] = SDLK_8;
	g_keyMapping[KEYBOARD_9] = SDLK_9; 
	g_keyMapping[KEYBOARD_SPACE] = SDLK_SPACE;
	g_keyMapping[KEYBOARD_INTRO] = SDLK_RETURN; // SDLK_KP_ENTER;
	g_keyMapping[KEYBOARD_SUPR] = SDLK_DELETE;

	// core inputs
	g_keyMapping[FUNCTION_1] = SDLK_F1;
	g_keyMapping[FUNCTION_2] = SDLK_F2;
	g_keyMapping[FUNCTION_3] = SDLK_F3;
	g_keyMapping[FUNCTION_4] = SDLK_F4;
	g_keyMapping[FUNCTION_5] = SDLK_F5;
	g_keyMapping[FUNCTION_6] = SDLK_F6;
	g_keyMapping[FUNCTION_7] = SDLK_F7;
	g_keyMapping[FUNCTION_8] = SDLK_F8;
	g_keyMapping[FUNCTION_9] = SDLK_F9;
	g_keyMapping[FUNCTION_10] = SDLK_F10;
	g_keyMapping[FUNCTION_11] = SDLK_F11;
	g_keyMapping[FUNCTION_12] = SDLK_F12;

	// check that all inputs have been mapped (for safety)
	for (int i = 0; i < END_OF_INPUTS; i++){
		assert(g_keyMapping[i] != 0);
	}
}

/////////////////////////////////////////////////////////////////////////////
// Custom plugin properties
/////////////////////////////////////////////////////////////////////////////

const std::string HTTPInputPluginV1::g_properties[] = {
	"keyConfig"
};

const int HTTPInputPluginV1::g_paramTypes[] = {
	// TODO: resolver este cast de forma elegante
	(int)(PARAM_ARRAY | PARAM_INPUT)
};

const int * HTTPInputPluginV1::getPropertiesType() const
{
	return HTTPInputPluginV1::g_paramTypes;
}

const std::string * HTTPInputPluginV1::getProperties(int *num) const 
{
	*num = sizeof(g_paramTypes)/sizeof(g_paramTypes[0]);
	return HTTPInputPluginV1::g_properties;
}

void HTTPInputPluginV1::setProperty(std::string prop, int data)
{
}

void HTTPInputPluginV1::setProperty(std::string prop, int index, int data)
{
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			g_keyMapping[index] = (SDLKey)data;
		}
	}
}

int HTTPInputPluginV1::getProperty(std::string prop) const
{
	return -1;
};

int HTTPInputPluginV1::getProperty(std::string prop, int index) const
{
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			return g_keyMapping[index];
		}
	} 
	return -1; 
};