// DirectInputKeyboardPlugin.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include <cassert>
#include "FakeInputKeyboardPlugin.h"

#include <vector>

#include <iostream>
#include <fstream>


#include "crow_all.h"

char webCommand = '\0';

void start_web_server() {
	std::cout << "Starting Web Server" << std::endl;

	crow::SimpleApp app;

	CROW_ROUTE(app, "/")([](){
		webCommand = 'E';
		return "Cambiado el webCommand";
	});

	CROW_ROUTE(app, "/fin")([](){
		webCommand = 'F';
		return "Pido Salir";
	});

	CROW_ROUTE(app, "/cmd/<string>")
	([ = ](crow::request req, std::string str){
		webCommand = str.at(0);
		return crow::response(200, str);
	});

    app.port(4477).run(); // la primera letra de cuatro y la septima QR
}

std::thread t1(start_web_server);


SDLKey FakeInputKeyboardPlugin::g_keyMapping[END_OF_INPUTS];

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

FakeInputKeyboardPlugin::FakeInputKeyboardPlugin()
{
	_errorMsg = "";
#if defined _EE || defined _PS3
	joy = NULL;
#endif

	initRemapTable();
}

FakeInputKeyboardPlugin::~FakeInputKeyboardPlugin()
{
}




bool FakeInputKeyboardPlugin::init()
{
	fprintf(stderr,"FakeInputKeyboardPlugin::init\n");
	fprintf(stderr,"FakeInputKeyboardPlugin::WebServer Started Listening at 8888\n");

	return true;
}

void FakeInputKeyboardPlugin::end()
{
	SDL_WM_GrabInput(SDL_GRAB_OFF);
}

void FakeInputKeyboardPlugin::acquire()
{
	SDL_WM_GrabInput(SDL_GRAB_ON);
}

void FakeInputKeyboardPlugin::unAcquire()
{
	SDL_WM_GrabInput(SDL_GRAB_OFF);
}

/////////////////////////////////////////////////////////////////////////////
// input processing
/////////////////////////////////////////////////////////////////////////////

void FakeInputKeyboardPlugin::process(int *inputs)
{
	//Uint8 *keystate = SDL_GetKeyState(NULL);
	int size;
//	Uint8 *keystate_tmp=SDL_GetKeyState(&size);
//	std::vector<Uint8> keystate(keystate_tmp,keystate_tmp+size);

// keystate[SDLK_F5]=false;
// keystate[SDLK_RIGHT]=false;
// keystate[SDLK_LEFT]=false;

switch(webCommand) {
   case 'A':    // A de Arriba
		keystate[SDLK_UP]=true;
		keystate[SDLK_RIGHT]=false;
		keystate[SDLK_LEFT]=false;
		keystate[SDLK_DOWN]=false;
		keystate[SDLK_F5]=true;
		keystate[SDLK_SPACE]=false;
   		fprintf(stderr,"Muevo hacia Arriba\n");
		break;     // A de Arriba
   case 'D':    // D de Derecha
		keystate[SDLK_UP]=false;
		keystate[SDLK_RIGHT]=true;
		keystate[SDLK_LEFT]=false;
		keystate[SDLK_DOWN]=false;
		keystate[SDLK_F5]=true;
		keystate[SDLK_SPACE]=false;
   		fprintf(stderr,"Muevo hacia a la Derecha\n");
		break;   // D de Derecha
   case 'I':
		keystate[SDLK_UP]=false;
		keystate[SDLK_RIGHT]=false;
		keystate[SDLK_LEFT]=true;
		keystate[SDLK_DOWN]=false;
		keystate[SDLK_F5]=true;
		keystate[SDLK_SPACE]=false;
   		fprintf(stderr,"Muevo hacia a la izquierda\n");
		break;    // I de Izquierda
   case 'B':
		keystate[SDLK_UP]=false;
		keystate[SDLK_RIGHT]=false;
		keystate[SDLK_LEFT]=false;
		keystate[SDLK_DOWN]=true;
		keystate[SDLK_F5]=true;
		keystate[SDLK_SPACE]=false;
   		fprintf(stderr,"Muevo hacia abajo a Adso \n");
		break; // Cursor aBajo para mover a Adso
   case '_':
		keystate[SDLK_UP]=false;
		keystate[SDLK_RIGHT]=false;
		keystate[SDLK_LEFT]=false;
		keystate[SDLK_DOWN]=false;
		keystate[SDLK_F5]=true;
		keystate[SDLK_SPACE]=true;
		break;  // barra espaciadora
   case 'E':
		keystate[SDLK_UP]=false;
		keystate[SDLK_RIGHT]=false;
		keystate[SDLK_LEFT]=false;
		keystate[SDLK_DOWN]=false;
		keystate[SDLK_F5]=true;
		keystate[SDLK_SPACE]=false;
   		fprintf(stderr,"Volcado del Estado (habría que hacerlo directamente sin esperar al driver) \n");
		break;    // E de esperar, STOP, esto debe imprimir el estado
   case 'e':
		keystate[SDLK_F5]=false;
   		fprintf(stderr,"Desactivo el Volcado del Estado \n");
		break;    // e de esperar, STOP, esto debe imprimir el estado
   case 'Q':
		keystate[SDLK_q]=true;
		break;
   case 'R':
		keystate[SDLK_r]=true;
		break;
   case 'F':    // F de fin
		keystate[SDLK_ESCAPE]=true;
   		fprintf(stderr,"Salgo ..... \n");
		break;
   case '\0':
   		fprintf(stderr,"No hago nada\r");
		break;
   default:
   		fprintf(stderr,"No entiendo el comando %c\n", webCommand ); // TODO devolver en JSON indicando status error
 }

// I just DID what I need to DO, so I reset

webCommand = '\0';

// fprintf(stderr,"ups %d\n", keystate[SDLK_UP] );

	// iterate through the inputs checking associated keys
	for (int i = 0; i < END_OF_INPUTS; i++){
		// if we're interested in that input, check it's value
		if (inputs[i] >= 0){
			// if the input is mapped and the key is pressed,
			// update inputs
			if (g_keyMapping[i] != 0){
//fprintf(stderr,"SDLInput %i\n",i);
				if (keystate[g_keyMapping[i]] ){
					inputs[i]++;
				}
			}
		}
	}
}

/////////////////////////////////////////////////////////////////////////////
// helper methods
/////////////////////////////////////////////////////////////////////////////

void FakeInputKeyboardPlugin::initRemapTable()
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

const std::string FakeInputKeyboardPlugin::g_properties[] = {
	"keyConfig"
};

const int FakeInputKeyboardPlugin::g_paramTypes[] = {
	int(PARAM_ARRAY | PARAM_INPUT)
};

const int * FakeInputKeyboardPlugin::getPropertiesType() const
{
	return FakeInputKeyboardPlugin::g_paramTypes;
}

const std::string * FakeInputKeyboardPlugin::getProperties(int *num) const
{
	*num = sizeof(g_paramTypes)/sizeof(g_paramTypes[0]);
	return FakeInputKeyboardPlugin::g_properties;
}

void FakeInputKeyboardPlugin::setProperty(std::string prop, int data)
{
}

void FakeInputKeyboardPlugin::setProperty(std::string prop, int index, int data)
{
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			g_keyMapping[index] = (SDLKey)data;
		}
	}
}

int FakeInputKeyboardPlugin::getProperty(std::string prop) const
{
	return -1;
};

int FakeInputKeyboardPlugin::getProperty(std::string prop, int index) const
{
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			return g_keyMapping[index];
		}
	}
	return -1;
};
