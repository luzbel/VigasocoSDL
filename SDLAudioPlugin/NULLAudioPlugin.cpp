// NULLAudioPlugin.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "NULLAudioPlugin.h"

#include <stdexcept>

// para cerr
#include <iostream>

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

NULLAudioPlugin::NULLAudioPlugin()
{
}

NULLAudioPlugin::~NULLAudioPlugin()
{
}



bool NULLAudioPlugin::init()
{
	_isInitialized = true;

	return true;
}

void NULLAudioPlugin::end()
{
	_isInitialized = false;
}

void NULLAudioPlugin::Pause(int sample)
{
}

void NULLAudioPlugin::Stop(int sample)
{
}

void NULLAudioPlugin::Play(int sample,bool loop)
{
}

bool NULLAudioPlugin::LoadWAV(const char* file)
{
	return true;
}

bool NULLAudioPlugin::LoadWAV(const UINT8 *data, const UINT32 len)
{
	return true;
}

void NULLAudioPlugin::acquire()
{
//	SDL_WM_GrabInput(SDL_GRAB_ON);
}

void NULLAudioPlugin::unAcquire()
{
//	SDL_WM_GrabInput(SDL_GRAB_OFF);
}

/////////////////////////////////////////////////////////////////////////////
// audio processing
/////////////////////////////////////////////////////////////////////////////

void NULLAudioPlugin::process(int *inputs)
{
// xxx
}


/////////////////////////////////////////////////////////////////////////////
// helper methods
/////////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////////
// Custom plugin properties
/////////////////////////////////////////////////////////////////////////////

const std::string NULLAudioPlugin::g_properties[] = {
	"mute"
		// TODO: quizas se pueda poner aqui el numero de bits
		// y la frecuencia de muestreo en alguna propiedad ...
};

const unsigned int NULLAudioPlugin::g_paramTypes[] = {
	PARAM_ARRAY | PARAM_INPUT
};

const unsigned int * NULLAudioPlugin::getPropertiesType() const
{
	return NULLAudioPlugin::g_paramTypes;
}

const std::string * NULLAudioPlugin::getProperties(int *num) const 
{
	*num = sizeof(g_paramTypes)/sizeof(g_paramTypes[0]);
	return NULLAudioPlugin::g_properties;
}

void NULLAudioPlugin::setProperty(std::string prop, int data)
{
	if (prop == "mute") {
		mute=data;
	} 
}

void NULLAudioPlugin::setProperty(std::string prop, int index, int data)
{
//TODO: usar propiedades interesantes para este plugin
/*
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
//			g_keyMapping[index] = (SDLKey)data;
		}
	}
*/
}

int NULLAudioPlugin::getProperty(std::string prop) const
{
	return -1;
};

int NULLAudioPlugin::getProperty(std::string prop, int index) const
{
//TODO: usar propiedades interesantes para este plugin
/*
	if (prop == "keyConfig"){
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
//			return g_keyMapping[index];
		}
	}
*/ 
	return -1; 
};
