// NULLVideoPlugin.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "NULLVideoPlugin.h"

#include <stdexcept>

// para cerr
#include <iostream>

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

NULLVideoPlugin::NULLVideoPlugin()
{
}

NULLVideoPlugin::~NULLVideoPlugin()
{
}



bool NULLVideoPlugin::init(const VideoInfo *vi, IPalette *pal)
{
	_isInitialized = true;

	return true;
}

void NULLVideoPlugin::end()
{
	_isInitialized = false;
}


/////////////////////////////////////////////////////////////////////////////
// helper methods
/////////////////////////////////////////////////////////////////////////////

void NULLVideoPlugin::render(bool)
{
}

void NULLVideoPlugin::setPixel(int, int, int) 
{
}

/////////////////////////////////////////////////////////////////////////////
// Custom plugin properties
/////////////////////////////////////////////////////////////////////////////

const int * NULLVideoPlugin::getPropertiesType() const
{
}

const std::string * NULLVideoPlugin::getProperties(int *num) const 
{
}

void NULLVideoPlugin::setProperty(std::string prop, int data)
{
}

void NULLVideoPlugin::setProperty(std::string prop, int index, int data)
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

int NULLVideoPlugin::getProperty(std::string prop) const
{
	return -1;
};

int NULLVideoPlugin::getProperty(std::string prop, int index) const
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
