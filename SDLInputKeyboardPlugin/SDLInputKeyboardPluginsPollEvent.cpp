// DirectInputKeyboardPlugin.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include <cassert>
#include "SDLInputKeyboardPluginsPollEvent.h"

#include <vector>

SDLKey SDLInputKeyboardPluginsPollEvent::g_keyMapping[END_OF_INPUTS];
Inputs SDLInputKeyboardPluginsPollEvent::g_sdlkeyMapping[END_OF_INPUTS];

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

SDLInputKeyboardPluginsPollEvent::SDLInputKeyboardPluginsPollEvent()
{
	_errorMsg = "";
	initRemapTable();
}

SDLInputKeyboardPluginsPollEvent::~SDLInputKeyboardPluginsPollEvent()
{
}

bool SDLInputKeyboardPluginsPollEvent::init()
{
	return true;
}

void SDLInputKeyboardPluginsPollEvent::end()
{
}

void SDLInputKeyboardPluginsPollEvent::acquire()
{
}

void SDLInputKeyboardPluginsPollEvent::unAcquire()
{
}

/////////////////////////////////////////////////////////////////////////////
// input processing
/////////////////////////////////////////////////////////////////////////////

bool SDLInputKeyboardPluginsPollEvent::process(int *inputs)
{
	SDL_Event event;
SDL_PumpEvents();
	//if (SDL_PollEvent(&ev)) {
	while (SDL_PollEvent(&event)) {

		// Si recibimos el evento de salir (cierre ventana o similar), lo propagamos
		// para que se salga del bucle principal del juego
		if (event.type==SDL_QUIT) return false;
#ifndef __native_client__
// en el navegador no salimos al pulsar ESC, porque se queda la pantalla sin limpiar y parece que se ha colgado
// habría que buscar una manera de finalizar de una manera elegante
		if (event.type==SDL_KEYDOWN && event.key.keysym.sym==SDLK_ESCAPE) 
			return false;
#endif

		if(event.type == SDL_KEYDOWN) {
			
				printf("SDL_KEYDOWN %d %d %d\n",event.key.keysym.sym,inputs[event.key.keysym.sym],g_keyMapping[event.key.keysym.sym]);
//		if (inputs[i] >= 0){
			// if the input is mapped and the key is pressed,
			// update inputs
//			if (g_keyMapping[i] != 0){

//			if (inputs[ev.key.keysym.sym] && g_keyMapping[ev.key.keysym.sym]) {
			//if (inputs[ev.key.keysym.sym]>=0 && g_keyMapping[ev.key.keysym.sym]!=0) {
//			if (g_keyMapping[ev.key.keysym.sym]!=0 && inputs[g_keyMapping[ev.key.keysym.sym]]>=0) {
//				 inputs[g_keyMapping[ev.key.keysym.sym]]++;
//				printf("inputs && g_keyMapping %d\n",g_keyMapping[ev.key.keysym.sym]);
//			}

			// TODO, hacer un remap inverso para pasar de teclas SDL a teclas Vigasoco
			// g_keyMapping 2
/*
			switch(ev.key.keysym.sym) {
				case SDLK_SPACE:
					inputs[P1_BUTTON1]++; 
					inputs[KEYBOARD_SPACE]++; 
					break;
				case SDLK_RETURN:
					inputs[KEYBOARD_INTRO]++; // SDLK_KP_ENTER;
					break;
				case SDLK_UP:
					inputs[P1_UP]++; 
				printf("UP PRESSED\n");
					break;
				case SDLK_LEFT:
					inputs[P1_LEFT]++; 
					break;
				case SDLK_RIGHT:
					inputs[P1_RIGHT]++; 
					break;
				case SDLK_DOWN:
					inputs[P1_DOWN]++; 
					break;
				case SDLK_q:
					inputs[KEYBOARD_Q]++; 
					break;
				case SDLK_r:
					inputs[KEYBOARD_R]++; 
					break;
//TODO: faltan teclas
				default: break;			
			}
*/		
			inputs[g_sdlkeyMapping[event.key.keysym.sym]]++;
			// SDLK_SPACE se mapea tanto a KEYBOARD_SPACE como a P1_BUTTON1
			if (event.key.keysym.sym == SDLK_SPACE) inputs[P1_BUTTON1]++; 

/*
			if (ev.key.keysym.sym == SDLK_LEFT) {
				printf("LEFT PRESSED\n");
			}
			if (ev.key.keysym.sym == SDLK_RIGHT) {
				printf("RIGHT PRESSED\n");
			}
*/
		}
	}
	//Uint8 *keystate = SDL_GetKeyState(NULL);
	int size;
/*
//SDL_PumpEvents(); //no llega lo que paso con SDL_PushEvents :-(
// TODO: esto parece que se puede hacer una sola vez al principio
	Uint8 *keystate_tmp=SDL_GetKeyState(&size);
	std::vector<Uint8> keystate(keystate_tmp,keystate_tmp+size);

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
*/

	return true;
}

/////////////////////////////////////////////////////////////////////////////
// helper methods
/////////////////////////////////////////////////////////////////////////////

void SDLInputKeyboardPluginsPollEvent::initRemapTable()
{
	memset(g_keyMapping, 0, sizeof(g_keyMapping));
	memset(g_sdlkeyMapping, 0, sizeof(g_sdlkeyMapping));

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

	//////////////////////////////////////////
	// Mapeo inverso, de SDLKey a VigasocoKey
	/////////////////////////////////////////

	// game driver inputs

	g_sdlkeyMapping[SDLK_UP] = P1_UP;
	g_sdlkeyMapping[SDLK_LEFT] = P1_LEFT;
	g_sdlkeyMapping[SDLK_DOWN] = P1_DOWN;
	g_sdlkeyMapping[SDLK_RIGHT] = P1_RIGHT;
	
	g_sdlkeyMapping[SDLK_LCTRL] = P1_BUTTON1;
	g_sdlkeyMapping[SDLK_SPACE] = P1_BUTTON1;
	g_sdlkeyMapping[SDLK_LSUPER] = P1_BUTTON2;

	g_sdlkeyMapping[SDLK_w] = P2_UP;
	g_sdlkeyMapping[SDLK_a] = P2_LEFT;
	g_sdlkeyMapping[SDLK_s] = P2_DOWN;
	g_sdlkeyMapping[SDLK_d] = P2_RIGHT;
	g_sdlkeyMapping[SDLK_y] = P2_BUTTON1;
	g_sdlkeyMapping[SDLK_u] = P2_BUTTON2;

	g_sdlkeyMapping[SDLK_1] = START_1;
	g_sdlkeyMapping[SDLK_2] = START_2;
	g_sdlkeyMapping[SDLK_5] = COIN_1;
	g_sdlkeyMapping[SDLK_6] = COIN_2;
	g_sdlkeyMapping[SDLK_9] = SERVICE_1;
	g_sdlkeyMapping[SDLK_0] = SERVICE_2;

	// keyboard inputs
	g_sdlkeyMapping[SDLK_a] = KEYBOARD_A;
	g_sdlkeyMapping[SDLK_b] = KEYBOARD_B;
	g_sdlkeyMapping[SDLK_c] = KEYBOARD_C;
	g_sdlkeyMapping[SDLK_d] = KEYBOARD_D;
	g_sdlkeyMapping[SDLK_e] = KEYBOARD_E;
	g_sdlkeyMapping[SDLK_f] = KEYBOARD_F;
	g_sdlkeyMapping[SDLK_g] = KEYBOARD_G;
	g_sdlkeyMapping[SDLK_h] = KEYBOARD_H;
	g_sdlkeyMapping[SDLK_i] = KEYBOARD_I;
	g_sdlkeyMapping[SDLK_j] = KEYBOARD_J;
	g_sdlkeyMapping[SDLK_k] = KEYBOARD_K;
	g_sdlkeyMapping[SDLK_l] = KEYBOARD_L;
	g_sdlkeyMapping[SDLK_m] = KEYBOARD_M;
	g_sdlkeyMapping[SDLK_n] = KEYBOARD_N;
	g_sdlkeyMapping[SDLK_o] = KEYBOARD_O;
	g_sdlkeyMapping[SDLK_p] = KEYBOARD_P;
	g_sdlkeyMapping[SDLK_q] = KEYBOARD_Q;
	g_sdlkeyMapping[SDLK_r] = KEYBOARD_R;
	g_sdlkeyMapping[SDLK_s] = KEYBOARD_S;
	g_sdlkeyMapping[SDLK_t] = KEYBOARD_T;
	g_sdlkeyMapping[SDLK_u] = KEYBOARD_U;
	g_sdlkeyMapping[SDLK_v] = KEYBOARD_V;
	g_sdlkeyMapping[SDLK_w] = KEYBOARD_W;
	g_sdlkeyMapping[SDLK_x] = KEYBOARD_X;
	g_sdlkeyMapping[SDLK_y] = KEYBOARD_Y;
	g_sdlkeyMapping[SDLK_z] = KEYBOARD_Z;
	g_sdlkeyMapping[SDLK_0] = KEYBOARD_0;
	g_sdlkeyMapping[SDLK_1] = KEYBOARD_1;
	g_sdlkeyMapping[SDLK_2] = KEYBOARD_2;
	g_sdlkeyMapping[SDLK_3] = KEYBOARD_3;
	g_sdlkeyMapping[SDLK_4] = KEYBOARD_4;
	g_sdlkeyMapping[SDLK_5] = KEYBOARD_5;
	g_sdlkeyMapping[SDLK_6] = KEYBOARD_6;
	g_sdlkeyMapping[SDLK_7] = KEYBOARD_7;
	g_sdlkeyMapping[SDLK_8] = KEYBOARD_8;
	g_sdlkeyMapping[SDLK_9] = KEYBOARD_9;
	g_sdlkeyMapping[SDLK_SPACE] = KEYBOARD_SPACE;
	g_sdlkeyMapping[SDLK_RETURN] = KEYBOARD_INTRO; // SDLK_KP_ENTER;
	g_sdlkeyMapping[SDLK_DELETE] = KEYBOARD_SUPR;

	// core inputs
	g_sdlkeyMapping[SDLK_F1] = FUNCTION_1;
	g_sdlkeyMapping[SDLK_F2] = FUNCTION_2;
	g_sdlkeyMapping[SDLK_F3] = FUNCTION_3;
	g_sdlkeyMapping[SDLK_F4] = FUNCTION_4;
	g_sdlkeyMapping[SDLK_F5] = FUNCTION_5;
	g_sdlkeyMapping[SDLK_F6] = FUNCTION_6;
	g_sdlkeyMapping[SDLK_F7] = FUNCTION_7;
	g_sdlkeyMapping[SDLK_F8] = FUNCTION_8;
	g_sdlkeyMapping[SDLK_F9] = FUNCTION_9;
	g_sdlkeyMapping[SDLK_F10] = FUNCTION_10;
	g_sdlkeyMapping[SDLK_F11] = FUNCTION_11;
	g_sdlkeyMapping[SDLK_F12] = FUNCTION_12;
}

/////////////////////////////////////////////////////////////////////////////
// Custom plugin properties
/////////////////////////////////////////////////////////////////////////////

const std::string SDLInputKeyboardPluginsPollEvent::g_properties[] = {
	"keyConfig"
};

const int SDLInputKeyboardPluginsPollEvent::g_paramTypes[] = {
	PARAM_ARRAY | PARAM_INPUT
};

const int * SDLInputKeyboardPluginsPollEvent::getPropertiesType() const
{
	return SDLInputKeyboardPluginsPollEvent::g_paramTypes;
}

const std::string * SDLInputKeyboardPluginsPollEvent::getProperties(int *num) const 
{
	*num = sizeof(g_paramTypes)/sizeof(g_paramTypes[0]);
	return SDLInputKeyboardPluginsPollEvent::g_properties;
}

void SDLInputKeyboardPluginsPollEvent::setProperty(std::string prop, int data)
{
}

void SDLInputKeyboardPluginsPollEvent::setProperty(std::string prop, int index, int data)
{
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			g_keyMapping[index] = (SDLKey)data;
			g_sdlkeyMapping[data] = (Inputs)index;
		}
	}

	if (prop == "sdlkeyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			g_sdlkeyMapping[index] = (Inputs)data;
			g_keyMapping[data] = (SDLKey)index;
		}
	}
}

int SDLInputKeyboardPluginsPollEvent::getProperty(std::string prop) const
{
	return -1;
};

int SDLInputKeyboardPluginsPollEvent::getProperty(std::string prop, int index) const
{
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			return g_keyMapping[index];
		}
	}
 
	if (prop == "sdlkeyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			return g_sdlkeyMapping[index];
		}
	} 
	
	return -1; 
};
