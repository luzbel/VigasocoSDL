// DirectInputKeyboardPlugin.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include <cassert>
#include "FakeInputKeyboardPlugin.h"

#include <vector>

#include <iostream>
#include <fstream>


// TODO: revisar he incluido crow web server 

#include "crow_all.h"

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

void start_web_server() {
	std::cout << "Starting Web Server" << std::endl;

	crow::SimpleApp app;

	CROW_ROUTE(app, "/")([](){
		keystate[SDLK_UP]=true; 
		keystate[SDLK_RIGHT]=false; 
		keystate[SDLK_LEFT]=false; 
		keystate[SDLK_DOWN]=false;  
		keystate[SDLK_F5]=true;  
		keystate[SDLK_SPACE]=false;  
		return "Hello world";
	});

	//std::thread server_thread([&app](){
    	//Start server                                                                                                                                                               
    	app.port(8888).run();
    //});
}
 
std::thread t1(start_web_server);

bool FakeInputKeyboardPlugin::init()
{
fprintf(stderr,"FakeInputKeyboardPlugin::init\n");
// app.port(8888).multithreaded().run();
fprintf(stderr,"FakeInputKeyboardPlugin::WebServer Started Listening at 8888\n");

#if defined _EE || defined _PS3
	if ( SDL_InitSubSystem(SDL_INIT_JOYSTICK) != -1 )
	{
		// Check for joystick
		if(SDL_NumJoysticks()>0){
			// Open joystick
			joy=SDL_JoystickOpen(0);

			if(joy)
			{
				printf("Opened Joystick 0\n");
				printf("Name: %s\n", SDL_JoystickName(0));
				printf("Number of Axes: %d\n",
					SDL_JoystickNumAxes(joy));
				printf("Number of Buttons: %d\n",
					SDL_JoystickNumButtons(joy));
				printf("Number of Balls: %d\n",
					SDL_JoystickNumBalls(joy));
				printf("Number of Hats: %d\n",
					SDL_JoystickNumHats(joy));
			}
			else
				printf("Couldn't open Joystick 0\n");

			// Close if opened
			// if(SDL_JoystickOpened(0))
			// 	SDL_JoystickClose(joy);
		} else printf("\n!!! NUMERO DE JOYSTICKS 0!!!\n\n");
	}
#endif   // _EE _PS3
	return true;
}

void FakeInputKeyboardPlugin::end()
{
#if defined _EE || defined _PS3
	if(SDL_NumJoysticks()>0)
	{
		if(SDL_JoystickOpened(0))
		{
			if (joy) SDL_JoystickClose(joy);
		}
	}
#endif
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

#ifdef _EE
enum ps2_sdl_buttons
{
        PAD_SQUARE,
        PAD_CROSS,
        PAD_CIRCLE,
        PAD_TRIANGLE,
        PAD_SELECT,
        PAD_START,
        PAD_L1,
        PAD_R1,
        PAD_L2,
        PAD_R2,
        PAD_L3,
        PAD_R3
};
#endif // _EE

#ifdef _PS3
enum ps3_sixaxis_sdl_buttons
{
	PAD_SELECT,
	PAD_L3,
	PAD_R3,
	PAD_START,
	PAD_UP,
	PAD_RIGHT,
	PAD_DOWN,
	PAD_LEFT,
	PAD_L2,
	PAD_R2,
	PAD_L1,
	PAD_R1,
	PAD_TRIANGLE,
	PAD_CIRCLE,
	PAD_CROSS,
	PAD_SQUARE,
	PAD_PS
};

enum ps3_sixaxis_sdl_axis
{
	AXIS_L3_HORIZONTAL,
	AXIS_L3_VERTICAL,
	AXIS_R3_HORIZONTAL,
	AXIS_R3_VERTICAL,
	AXIS_UNKNONW4,
	AXIS_UNKNONW5,
	AXIS_UNKNONW6,
	AXIS_UNKNONW7,
	AXIS_UP,
	AXIS_RIGHT,
	AXIS_DOWN,
	AXIS_LEFT,
	AXIS_L2,
	AXIS_R2,
	AXIS_L1,
	AXIS_R1,
	AXIS_TRIANGLE,
	AXIS_CIRCLE,
	AXIS_CROSS,
	AXIS_SQUARE		
/* a partir del 19 no se que boton es ... */
};

#endif // _PS3

void FakeInputKeyboardPlugin::process(int *inputs)
{
	//Uint8 *keystate = SDL_GetKeyState(NULL);
	int size;
//	Uint8 *keystate_tmp=SDL_GetKeyState(&size);
//	std::vector<Uint8> keystate(keystate_tmp,keystate_tmp+size);

#if defined _EE || defined _PS3
	if(joy)
	{

		SDL_JoystickUpdate();

		/* analogico */
		Sint16 x_move = SDL_JoystickGetAxis(joy,0);
		keystate[SDLK_RIGHT] |= ( x_move > 10000  && !keystate[SDLK_LEFT] );
		keystate[SDLK_LEFT]  |= ( x_move < -10000 && !keystate[SDLK_RIGHT] );
		Sint16 y_move = SDL_JoystickGetAxis(joy,1);
		keystate[SDLK_DOWN]  |= ( y_move > 10000  && !keystate[SDLK_UP] );
		keystate[SDLK_UP]    |= ( y_move < -10000 && !keystate[SDLK_DOWN] );

		keystate[SDLK_F8] |= SDL_JoystickGetButton(joy,PAD_L3);
		keystate[SDLK_F9] |= SDL_JoystickGetButton(joy,PAD_R3);
		keystate[SDLK_F10] |= SDL_JoystickGetButton(joy,PAD_SELECT);
		keystate[SDLK_DELETE] |= SDL_JoystickGetButton(joy,PAD_START);
		keystate[SDLK_SPACE] |= SDL_JoystickGetButton(joy,PAD_CROSS);
		// Cambiar entre graficos CPC y VGA
		keystate[SDLK_F2] |= SDL_JoystickGetButton(joy,PAD_TRIANGLE);
		// contestar afirmativamente a una pregunta
		keystate[SDLK_s] |= SDL_JoystickGetButton(joy,PAD_CIRCLE);
		// contesta negativamente a una pregunta
		keystate[SDLK_n] |= SDL_JoystickGetButton(joy,PAD_SQUARE);
		// q y r se usan en la habitacion del espejo
		keystate[SDLK_q] |= SDL_JoystickGetButton(joy,PAD_L2);
		keystate[SDLK_r] |= SDL_JoystickGetButton(joy,PAD_R2);

		keystate[SDLK_c] |= SDL_JoystickGetButton(joy,PAD_L1); // cargar partida
		keystate[SDLK_g] |= SDL_JoystickGetButton(joy,PAD_R1); // grabar partida

#ifdef _EE
		Uint8 hat = SDL_JoystickGetHat(joy,0);


		// Cruzeta 
		// La primera condicion mira si se ha pulsado esa direccion,
		// la segunda direccion mira que no se tiene pulsado el boton contrario
		//  (?se puede fisicamente?)
		// y la tercera que no tengamos pulsado ya el movimiento contrario 
		// en la seta analogica

		keystate[SDLK_UP]    |= 
			(hat & SDL_HAT_UP) && 
			!(hat & SDL_HAT_DOWN)  &&
			!keystate[SDLK_DOWN];

		keystate[SDLK_DOWN]  |= 
			(hat & SDL_HAT_DOWN)  &&
			!(hat & SDL_HAT_UP)   &&
			!keystate[SDLK_UP];

		keystate[SDLK_RIGHT] |= 
			(hat & SDL_HAT_RIGHT) && !(hat & SDL_HAT_LEFT) &&
			!keystate[SDLK_LEFT];

		keystate[SDLK_LEFT]  |= 
			(hat & SDL_HAT_LEFT)	&&
			!(hat & SDL_HAT_RIGHT)	&&
			!keystate[SDLK_RIGHT]; 
#endif // _EE

#ifdef _PS3
		keystate[SDLK_UP]    |= SDL_JoystickGetButton(joy,PAD_UP)    && !keystate[SDLK_DOWN];
		keystate[SDLK_DOWN]  |= SDL_JoystickGetButton(joy,PAD_DOWN)  && !keystate[SDLK_UP];
		keystate[SDLK_RIGHT] |= (SDL_JoystickGetButton(joy,PAD_RIGHT) && !keystate[SDLK_LEFT]);
		keystate[SDLK_LEFT]  |= (SDL_JoystickGetButton(joy,PAD_LEFT)  && !keystate[SDLK_RIGHT]);

#endif // _PS3


	} // if joy
#endif // _EE y _PS3

std::ifstream in("/tmp/pipe"); // TODO , no abrir en cada bucle
char kk[2];
kk[0]=NULL;
kk[1]=NULL;
int ret; 
if (in.fail()) {
	fprintf(stderr, "error al abrir la stdin!!!");
}

ret = in.readsome(kk, 1);
// fprintf(stderr,"leidos %d (%d) %c \r", ret, kk[0], kk[0] );
if (ret > 0) {
fprintf(stderr,"comando %c\n", kk[0] );

keystate[SDLK_F5]=false;  
 switch(kk[0]) {
   case 'A':    // A de Arriba
		keystate[SDLK_UP]=true; 
		keystate[SDLK_RIGHT]=false; 
		keystate[SDLK_LEFT]=false; 
		keystate[SDLK_DOWN]=false;  
		keystate[SDLK_F5]=true;  
		keystate[SDLK_SPACE]=false;  
		break;     // A de Arriba
   case 'D':    // D de Derecha
		keystate[SDLK_UP]=false; 
		keystate[SDLK_RIGHT]=true; 
		keystate[SDLK_LEFT]=false; 
		keystate[SDLK_DOWN]=false;  
		keystate[SDLK_F5]=true;  
		keystate[SDLK_SPACE]=false;  
		break;   // D de Derecha
   case 'I': 
		break;    // I de Izquierda
		keystate[SDLK_UP]=false; 
		keystate[SDLK_RIGHT]=false; 
		keystate[SDLK_LEFT]=true; 
		keystate[SDLK_DOWN]=false;  
		keystate[SDLK_F5]=true;  
		keystate[SDLK_SPACE]=false;  
		break;    // I de Izquierda
   case 'B': 
		break; // Cursor aBajo para mover a Adso
		keystate[SDLK_UP]=false; 
		keystate[SDLK_RIGHT]=false; 
		keystate[SDLK_LEFT]=false; 
		keystate[SDLK_DOWN]=true;  
		keystate[SDLK_F5]=true;  
		keystate[SDLK_SPACE]=false;  
		break; // Cursor aBajo para mover a Adso
   case ' ': 
		break;  // barra espaciadora
		keystate[SDLK_UP]=false; 
		keystate[SDLK_RIGHT]=false; 
		keystate[SDLK_LEFT]=false; 
		keystate[SDLK_DOWN]=false;  
		keystate[SDLK_F5]=true;  
		keystate[SDLK_SPACE]=true;  
		break;  // barra espaciadora
   case 'E': 
		break;    // E de esperar, STOP, esto debe imprimir el estado
		keystate[SDLK_UP]=false; 
		keystate[SDLK_RIGHT]=false; 
		keystate[SDLK_LEFT]=false; 
		keystate[SDLK_DOWN]=false;  
		keystate[SDLK_F5]=true;  
		keystate[SDLK_SPACE]=false;  
		break;    // E de esparar, STOP, esto debe imprimir el estado
   case 'Q': 
		keystate[SDLK_q]=true;  
		break; 
   case 'R': 
		keystate[SDLK_r]=true; 
		break; 
   case 'F':    // F de fin
		keystate[SDLK_ESCAPE]=true; 
		break; 
   default: fprintf(stderr,"No entiendo el comando %c\n", kk[0] ); // TODO devolver en JSON indicando status error
 }
// fprintf(stderr,"ups %d\n", keystate[SDLK_UP] );

}

	
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
