// HTTPInputPlugin.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include <cassert>
#include "HTTPInputPlugin.h"

#include "crow_all.h"

//#include <vector>

SDLKey HTTPInputPlugin::g_keyMapping[END_OF_INPUTS];

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

HTTPInputPlugin::HTTPInputPlugin()
{
//	_errorMsg = "";

	initRemapTable();
}

HTTPInputPlugin::~HTTPInputPlugin()
{
}


void HTTPInputPlugin::simulateKeys(int repeat, int interval, std::vector<char *> keys )
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

bool HTTPInputPlugin::init()
{
	std::thread webThread([this]() {
		crow::SimpleApp app;
// ver https://developers.perfectomobile.com/pages/viewpage.action?pageId=13893814
// algo así ?keys=q,r&howlong=100 ¿o mejor en un json de entrada en el body?
// ¿queremos un tiempo de espera antes de pulsar?
// ¿queremos indicar cuantos veces repetir ? 
		CROW_ROUTE(app, "/test")([this](){
//			HTTPInputPlugin::keystate[SDLK_ESCAPE]=true;
// se sale en VigasocoSDL::processEvents por evento , no por tecla pulsada
// o bien cambiar  Vigasoco::processCoreInputs( para que devuelve false y cambiar el bucle principal para salir en esa condicion
// o bien  inyectar evento
SDL_Event sdlevent = {};
sdlevent.type = SDL_QUIT;
//sdlevent.key.keysym.sym = SDLK_LEFT;
SDL_PushEvent(&sdlevent);
                	return crow::response(200);
        	});		

		CROW_ROUTE(app, "/press/<int>")([this](crow::request req, int sdlkey){
			HTTPInputPlugin::keystate[sdlkey]=true;
                	return crow::response(200);
        	});		

		CROW_ROUTE(app, "/reset1")([this](){
			HTTPInputPlugin::keystate[SDLK_e]=true;
                	return crow::response(200);
        	});		

		CROW_ROUTE(app, "/reset2")([this](){
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


		CROW_ROUTE(app, "/simple-event/key/<int>")([this](crow::request req, int sdlkey){
//			HTTPInputPlugin::keystate[sdlkey]=true;
/*
int count=5;
while (--count) {
SDL_Event sdlevent = {};
sdlevent.type = SDL_KEYDOWN;
sdlevent.key.state=SDL_PRESSED;
sdlevent.key.keysym.sym = SDLKey(sdlkey);
SDL_PushEvent(&sdlevent);
//elJuego->timer->sleep(50);
std::this_thread::sleep_for(std::chrono::milliseconds(50));
}
*/
	std::thread keyThread([sdlkey]() {
// TODO, el 10 y el 25 deber�an recibirse como parametros del API
int count=10;
while (--count) {
SDL_Event sdlevent = {};
sdlevent.type = SDL_KEYDOWN;
sdlevent.key.state=SDL_PRESSED;
sdlevent.key.keysym.sym = SDLKey(sdlkey);
SDL_PushEvent(&sdlevent);
//elJuego->timer->sleep(50);
std::this_thread::sleep_for(std::chrono::milliseconds(25));
}
}		
	); keyThread.detach();

// ?cambiar sdlinputkeyboard para hacer pollevents en vez de llamar a getkeystate ?
// o en el process de este hacer el pollevents y ahorrarse pasar a las lambdas this para llegar a keystate???
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

/*
				//std::thread keyThread([repeat,interval,keys]() mutable {
				std::thread keyThread([repeat,interval,keys]() {
fprintf(stderr,"dentro repeat %d interval %d key0 %s size %d\n",repeat,interval,keys[0],(int)keys.size()); 
				int r=repeat;
				//while (repeat--) {
				while (r--) {
					for(int i=0;i<keys.size();i++) 
					{	
						SDL_Event sdlevent = {};
						sdlevent.type = SDL_KEYDOWN;
						sdlevent.key.state=SDL_PRESSED;
fprintf(stderr,"i %d keys[i] %s atoi %d\n",i,keys[i],std::atoi(keys[i]));
						sdlevent.key.keysym.sym = SDLKey(std::atoi(keys[i]));
						SDL_PushEvent(&sdlevent);
					} 
					std::this_thread::sleep_for(std::chrono::milliseconds(interval));
				} 
			}); 
 // no podemos hacer detach porque desapareceria del contexto la variable keys que usa el hilo que envia los eventos
			//keyThread.detach();
			keyThread.join();  // para esto no montamos un hilo, pero mientras arreglamos lo del contexto
*/
                	return crow::response(200);
		});


		CROW_ROUTE(app, "/simulate-post").methods("POST"_method)([this](crow::request req){
			auto x=crow::json::load(req.body);
			if (!x) return crow::response(500);
//			fprintf(stderr,"%s\n", x["keys"].s());
                	return crow::response(200);
        	});		


		//app.port(8182).run();
		app.port(4477).run();
	});
	webThread.detach();
	return true;
}

void HTTPInputPlugin::end()
{
}

void HTTPInputPlugin::acquire()
{
}

void HTTPInputPlugin::unAcquire()
{
}

/////////////////////////////////////////////////////////////////////////////
// input processing
/////////////////////////////////////////////////////////////////////////////

bool HTTPInputPlugin::process(int *inputs)
{

	// iterate through the inputs checking associated keys
	for (int i = 0; i < END_OF_INPUTS; i++){
		// if we're interested in that input, check it's value
		if (inputs[i] >= 0){
			// if the input is mapped and the key is pressed,
			// update inputs
			if (g_keyMapping[i] != 0){
				if (keystate[g_keyMapping[i]] ){
					inputs[i]++;
				}
			}
		}
	}

	// El servidor web no modifica ninguna variable de esta clase para indicr
	// que se debe devolver false en process para salir del juego
	// En su lugar inyecta el evento SDL_QUIT para que se procese adecuadamente
	// con el plugin PollEvent
	return true; 
}

/////////////////////////////////////////////////////////////////////////////
// helper methods
/////////////////////////////////////////////////////////////////////////////

void HTTPInputPlugin::initRemapTable()
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

const std::string HTTPInputPlugin::g_properties[] = {
	"keyConfig"
};

const int HTTPInputPlugin::g_paramTypes[] = {
	int(PARAM_ARRAY | PARAM_INPUT) // TODO: Estos casts no molan en C++ moderno
};

const int * HTTPInputPlugin::getPropertiesType() const
{
	return HTTPInputPlugin::g_paramTypes;
}

const std::string * HTTPInputPlugin::getProperties(int *num) const 
{
	*num = sizeof(g_paramTypes)/sizeof(g_paramTypes[0]);
	return HTTPInputPlugin::g_properties;
}

void HTTPInputPlugin::setProperty(std::string prop, int data)
{
}

void HTTPInputPlugin::setProperty(std::string prop, int index, int data)
{
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			g_keyMapping[index] = (SDLKey)data;
		}
	}
}

int HTTPInputPlugin::getProperty(std::string prop) const
{
	return -1;
};

int HTTPInputPlugin::getProperty(std::string prop, int index) const
{
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			return g_keyMapping[index];
		}
	} 
	return -1; 
};
