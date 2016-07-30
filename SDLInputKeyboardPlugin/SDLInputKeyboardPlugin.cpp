// DirectInputKeyboardPlugin.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include <cassert>
#include "SDLInputKeyboardPlugin.h"

#include <vector>

SDL_Scancode SDLInputKeyboardPlugin::g_keyMapping[END_OF_INPUTS];


/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

SDLInputKeyboardPlugin::SDLInputKeyboardPlugin()
{
	_errorMsg = "";
#if defined _EE || defined _PS3
	joy = NULL;
#endif

	initRemapTable();
}

SDLInputKeyboardPlugin::~SDLInputKeyboardPlugin()
{
}

bool SDLInputKeyboardPlugin::init()
{
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

void SDLInputKeyboardPlugin::end()
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
	SDL_SetRelativeMouseMode(SDL_FALSE);
}

void SDLInputKeyboardPlugin::acquire()
{
	SDL_SetRelativeMouseMode(SDL_TRUE);
}

void SDLInputKeyboardPlugin::unAcquire()
{
	SDL_SetRelativeMouseMode(SDL_FALSE);
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

void SDLInputKeyboardPlugin::process(int *inputs)
{
	//Uint8 *keystate = SDL_GetKeyState(NULL);
	int size;
	const Uint8 *keystate_tmp=SDL_GetKeyboardState(&size);
	std::vector<Uint8> keystate(keystate_tmp,keystate_tmp+size);

#if defined _EE || defined _PS3
	if(joy)
	{

		SDL_JoystickUpdate();

		/* analogico */
		Sint16 x_move = SDL_JoystickGetAxis(joy,0);
		keystate[SDL_GetScancodeFromKey(SDLK_RIGHT)] |= ( x_move > 10000  && !keystate[SDL_GetScancodeFromKey(SDLK_LEFT)] );
		keystate[SDL_GetScancodeFromKey(SDLK_LEFT]  |= ( x_move < -10000 && !keystate[SDL_GetScancodeFromKey(SDLK_RIGHT)] );
		Sint16 y_move = SDL_JoystickGetAxis(joy,1);
		keystate[SDL_GetScancodeFromKey(SDLK_DOWN]  |= ( y_move > 10000  && !keystate[SDL_GetScancodeFromKey(SDLK_UP)] );
		keystate[SDL_GetScancodeFromKey(SDLK_UP]    |= ( y_move < -10000 && !keystate[SDL_GetScancodeFromKey(SDLK_DOWN)] );

		keystate[SDL_GetScancodeFromKey(SDLK_F8)] |= SDL_JoystickGetButton(joy,PAD_L3);
		keystate[SDL_GetScancodeFromKey(SDLK_F9)] |= SDL_JoystickGetButton(joy,PAD_R3);
		keystate[SDL_GetScancodeFromKey(SDLK_F10)] |= SDL_JoystickGetButton(joy,PAD_SELECT);
		keystate[SDL_GetScancodeFromKey(SDLK_DELETE)] |= SDL_JoystickGetButton(joy,PAD_START);
		keystate[SDL_GetScancodeFromKey(SDLK_SPACE)] |= SDL_JoystickGetButton(joy,PAD_CROSS);
		// Cambiar entre graficos CPC y VGA
		keystate[SDL_GetScancodeFromKey(SDLK_F2)] |= SDL_JoystickGetButton(joy,PAD_TRIANGLE);
		// contestar afirmativamente a una pregunta
		keystate[SDL_GetScancodeFromKey(SDLK_s)] |= SDL_JoystickGetButton(joy,PAD_CIRCLE);
		// contesta negativamente a una pregunta
		keystate[SDL_GetScancodeFromKey(SDLK_n)] |= SDL_JoystickGetButton(joy,PAD_SQUARE);
		// q y r se usan en la habitacion del espejo
		keystate[SDL_GetScancodeFromKey(SDLK_q)] |= SDL_JoystickGetButton(joy,PAD_L2);
		keystate[SDL_GetScancodeFromKey(SDLK_r)] |= SDL_JoystickGetButton(joy,PAD_R2);

		keystate[SDL_GetScancodeFromKey(SDLK_c)] |= SDL_JoystickGetButton(joy,PAD_L1); // cargar partida
		keystate[SDL_GetScancodeFromKey(SDLK_g)] |= SDL_JoystickGetButton(joy,PAD_R1); // grabar partida

#ifdef _EE
		Uint8 hat = SDL_JoystickGetHat(joy,0);


		// Cruzeta 
		// La primera condicion mira si se ha pulsado esa direccion,
		// la segunda direccion mira que no se tiene pulsado el boton contrario
		//  (?se puede fisicamente?)
		// y la tercera que no tengamos pulsado ya el movimiento contrario 
		// en la seta analogica

		keystate[SDL_GetScancodeFromKey(SDLK_UP)]    |= 
			(hat & SDL_HAT_UP) && 
			!(hat & SDL_HAT_DOWN)  &&
			!keystate[SDL_GetScancodeFromKey(SDLK_DOWN)];

		keystate[SDL_GetScancodeFromKey(SDLK_DOWN)]  |= 
			(hat & SDL_HAT_DOWN)  &&
			!(hat & SDL_HAT_UP)   &&
			!keystate[SDL_GetScancodeFromKey(SDLK_UP)];

		keystate[SDL_GetScancodeFromKey(SDLK_RIGHT)] |= 
			(hat & SDL_HAT_RIGHT) && !(hat & SDL_HAT_LEFT) &&
			!keystate[SDL_GetScancodeFromKey(SDLK_LEFT)];

		keystate[SDL_GetScancodeFromKey(SDLK_LEFT)]  |= 
			(hat & SDL_HAT_LEFT)	&&
			!(hat & SDL_HAT_RIGHT)	&&
			!keystate[SDL_GetScancodeFromKey(SDLK_RIGHT)]; 
#endif // _EE

#ifdef _PS3
		keystate[SDL_GetScancodeFromKey(SDLK_UP)]    |= SDL_JoystickGetButton(joy,PAD_UP)    && !keystate[SDL_GetScancodeFromKey(SDLK_DOWN)];
		keystate[SDL_GetScancodeFromKey(SDLK_DOWN)]  |= SDL_JoystickGetButton(joy,PAD_DOWN)  && !keystate[SDL_GetScancodeFromKey(SDLK_UP)];
		keystate[SDL_GetScancodeFromKey(SDLK_RIGHT)] |= (SDL_JoystickGetButton(joy,PAD_RIGHT) && !keystate[SDL_GetScancodeFromKey(SDLK_LEFT)]);
		keystate[SDL_GetScancodeFromKey(SDLK_LEFT)]  |= (SDL_JoystickGetButton(joy,PAD_LEFT)  && !keystate[SDL_GetScancodeFromKey(SDLK_RIGHT)]);

#endif // _PS3


	} // if joy
#endif // _EE y _PS3
	
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
}

/////////////////////////////////////////////////////////////////////////////
// helper methods
/////////////////////////////////////////////////////////////////////////////

void SDLInputKeyboardPlugin::initRemapTable()
{
	memset(g_keyMapping, 0, sizeof(g_keyMapping));

	// game driver inputs

	g_keyMapping[P1_UP] = SDL_GetScancodeFromKey(SDLK_UP);
	g_keyMapping[P1_LEFT] = SDL_GetScancodeFromKey(SDLK_LEFT);
	g_keyMapping[P1_DOWN] = SDL_GetScancodeFromKey(SDLK_DOWN);
	g_keyMapping[P1_RIGHT] = SDL_GetScancodeFromKey(SDLK_RIGHT);

	g_keyMapping[P1_BUTTON1] = SDL_GetScancodeFromKey(SDLK_LCTRL);
	g_keyMapping[P1_BUTTON1] = SDL_GetScancodeFromKey(SDLK_SPACE);
	g_keyMapping[P1_BUTTON2] = SDL_GetScancodeFromKey(SDLK_LGUI);

	g_keyMapping[P2_UP] = SDL_GetScancodeFromKey(SDLK_w);
	g_keyMapping[P2_LEFT] = SDL_GetScancodeFromKey(SDLK_a); 
	g_keyMapping[P2_DOWN] = SDL_GetScancodeFromKey(SDLK_s);
	g_keyMapping[P2_RIGHT] = SDL_GetScancodeFromKey(SDLK_d);
	g_keyMapping[P2_BUTTON1] = SDL_GetScancodeFromKey(SDLK_y);
	g_keyMapping[P2_BUTTON2] = SDL_GetScancodeFromKey(SDLK_u);

	g_keyMapping[START_1] = SDL_GetScancodeFromKey(SDLK_1);
	g_keyMapping[START_2] = SDL_GetScancodeFromKey(SDLK_2);
	g_keyMapping[COIN_1] = SDL_GetScancodeFromKey(SDLK_5);
	g_keyMapping[COIN_2] = SDL_GetScancodeFromKey(SDLK_6);
	g_keyMapping[SERVICE_1] = SDL_GetScancodeFromKey(SDLK_9);
	g_keyMapping[SERVICE_2] = SDL_GetScancodeFromKey(SDLK_0);

	// keyboard inputs
	g_keyMapping[KEYBOARD_A] = SDL_GetScancodeFromKey(SDLK_a);
	g_keyMapping[KEYBOARD_B] = SDL_GetScancodeFromKey(SDLK_b);
	g_keyMapping[KEYBOARD_C] = SDL_GetScancodeFromKey(SDLK_c);
	g_keyMapping[KEYBOARD_D] = SDL_GetScancodeFromKey(SDLK_d);
	g_keyMapping[KEYBOARD_E] = SDL_GetScancodeFromKey(SDLK_e);
	g_keyMapping[KEYBOARD_F] = SDL_GetScancodeFromKey(SDLK_f);
	g_keyMapping[KEYBOARD_G] = SDL_GetScancodeFromKey(SDLK_g);
	g_keyMapping[KEYBOARD_H] = SDL_GetScancodeFromKey(SDLK_h);
	g_keyMapping[KEYBOARD_I] = SDL_GetScancodeFromKey(SDLK_i);
	g_keyMapping[KEYBOARD_J] = SDL_GetScancodeFromKey(SDLK_j);
	g_keyMapping[KEYBOARD_K] = SDL_GetScancodeFromKey(SDLK_k);
	g_keyMapping[KEYBOARD_L] = SDL_GetScancodeFromKey(SDLK_l);
	g_keyMapping[KEYBOARD_M] = SDL_GetScancodeFromKey(SDLK_m);
	g_keyMapping[KEYBOARD_N] = SDL_GetScancodeFromKey(SDLK_n);
	g_keyMapping[KEYBOARD_O] = SDL_GetScancodeFromKey(SDLK_o);
	g_keyMapping[KEYBOARD_P] = SDL_GetScancodeFromKey(SDLK_p);
	g_keyMapping[KEYBOARD_Q] = SDL_GetScancodeFromKey(SDLK_q);
	g_keyMapping[KEYBOARD_R] = SDL_GetScancodeFromKey(SDLK_r);
	g_keyMapping[KEYBOARD_S] = SDL_GetScancodeFromKey(SDLK_s);
	g_keyMapping[KEYBOARD_T] = SDL_GetScancodeFromKey(SDLK_t);
	g_keyMapping[KEYBOARD_U] = SDL_GetScancodeFromKey(SDLK_u);
	g_keyMapping[KEYBOARD_V] = SDL_GetScancodeFromKey(SDLK_v);
	g_keyMapping[KEYBOARD_W] = SDL_GetScancodeFromKey(SDLK_w);
	g_keyMapping[KEYBOARD_X] = SDL_GetScancodeFromKey(SDLK_x);
	g_keyMapping[KEYBOARD_Y] = SDL_GetScancodeFromKey(SDLK_y);
	g_keyMapping[KEYBOARD_Z] = SDL_GetScancodeFromKey(SDLK_z);
	g_keyMapping[KEYBOARD_0] = SDL_GetScancodeFromKey(SDLK_0);
	g_keyMapping[KEYBOARD_1] = SDL_GetScancodeFromKey(SDLK_1);
	g_keyMapping[KEYBOARD_2] = SDL_GetScancodeFromKey(SDLK_2);
	g_keyMapping[KEYBOARD_3] = SDL_GetScancodeFromKey(SDLK_3);
	g_keyMapping[KEYBOARD_4] = SDL_GetScancodeFromKey(SDLK_4);
	g_keyMapping[KEYBOARD_5] = SDL_GetScancodeFromKey(SDLK_5);
	g_keyMapping[KEYBOARD_6] = SDL_GetScancodeFromKey(SDLK_6);
	g_keyMapping[KEYBOARD_7] = SDL_GetScancodeFromKey(SDLK_7);
	g_keyMapping[KEYBOARD_8] = SDL_GetScancodeFromKey(SDLK_8);
	g_keyMapping[KEYBOARD_9] = SDL_GetScancodeFromKey(SDLK_9); 
	g_keyMapping[KEYBOARD_SPACE] = SDL_GetScancodeFromKey(SDLK_SPACE);
	g_keyMapping[KEYBOARD_INTRO] = SDL_GetScancodeFromKey(SDLK_RETURN); // SDL_GetScancodeFromKey(SDLK_KP_ENTER;
	g_keyMapping[KEYBOARD_SUPR] = SDL_GetScancodeFromKey(SDLK_DELETE);

	// core inputs
	g_keyMapping[FUNCTION_1] = SDL_GetScancodeFromKey(SDLK_F1);
	g_keyMapping[FUNCTION_2] = SDL_GetScancodeFromKey(SDLK_F2);
	g_keyMapping[FUNCTION_3] = SDL_GetScancodeFromKey(SDLK_F3);
	g_keyMapping[FUNCTION_4] = SDL_GetScancodeFromKey(SDLK_F4);
	g_keyMapping[FUNCTION_5] = SDL_GetScancodeFromKey(SDLK_F5);
	g_keyMapping[FUNCTION_6] = SDL_GetScancodeFromKey(SDLK_F6);
	g_keyMapping[FUNCTION_7] = SDL_GetScancodeFromKey(SDLK_F7);
	g_keyMapping[FUNCTION_8] = SDL_GetScancodeFromKey(SDLK_F8);
	g_keyMapping[FUNCTION_9] = SDL_GetScancodeFromKey(SDLK_F9);
	g_keyMapping[FUNCTION_10] = SDL_GetScancodeFromKey(SDLK_F10);
	g_keyMapping[FUNCTION_11] = SDL_GetScancodeFromKey(SDLK_F11);
	g_keyMapping[FUNCTION_12] = SDL_GetScancodeFromKey(SDLK_F12);

	// check that all inputs have been mapped (for safety)
	for (int i = 0; i < END_OF_INPUTS; i++){
		assert(g_keyMapping[i] != 0);
	}
}

/////////////////////////////////////////////////////////////////////////////
// Custom plugin properties
/////////////////////////////////////////////////////////////////////////////

const std::string SDLInputKeyboardPlugin::g_properties[] = {
	"keyConfig"
};

const int SDLInputKeyboardPlugin::g_paramTypes[] = {
	PARAM_ARRAY | PARAM_INPUT
};

const int * SDLInputKeyboardPlugin::getPropertiesType() const
{
	return SDLInputKeyboardPlugin::g_paramTypes;
}

const std::string * SDLInputKeyboardPlugin::getProperties(int *num) const 
{
	*num = sizeof(g_paramTypes)/sizeof(g_paramTypes[0]);
	return SDLInputKeyboardPlugin::g_properties;
}

void SDLInputKeyboardPlugin::setProperty(std::string prop, int data)
{
}

void SDLInputKeyboardPlugin::setProperty(std::string prop, int index, int data)
{
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			g_keyMapping[index] = (SDL_Scancode)data;
		}
	}
}

int SDLInputKeyboardPlugin::getProperty(std::string prop) const
{
	return -1;
};

int SDLInputKeyboardPlugin::getProperty(std::string prop, int index) const
{
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			return g_keyMapping[index];
		}
	} 
	return -1; 
};
