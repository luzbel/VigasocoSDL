// SDLInputKeyboardPluginsPollEvent.h
//
//	Class that handles keyboard input using SDLPollEvent
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _SDL_INPUT_KEYBOARD_PLUGINS_POLLEVENT_H_
#define _SDL_INPUT_KEYBOARD_PLUGINS_POLLEVENT_H_

#include "IInputPlugin.h"
#include "SDL.h"

class SDLInputKeyboardPluginsPollEvent: public IInputPlugin
{
// fields
protected:
	static const std::string g_properties[];
	static const int g_paramTypes[];

	UINT8 _keys[256];							// keys state

	static SDLKey g_keyMapping[END_OF_INPUTS];	// VIGASOCO input to DirectInput mapping
	static Inputs g_sdlkeyMapping[END_OF_INPUTS];	// VIGASOCO input to DirectInput mapping
	std::string _errorMsg;						// error message

// methods
public:
	// initialization and cleanup
	SDLInputKeyboardPluginsPollEvent();
	virtual ~SDLInputKeyboardPluginsPollEvent();
	virtual bool init();
	virtual void end();

	virtual void acquire();
	virtual void unAcquire();

	virtual bool process(int *inputs);

	// custom properties
	virtual const std::string *getProperties(int *num) const;
	virtual const int *getPropertiesType() const;
	virtual void setProperty(std::string prop, int data);
	virtual void setProperty(std::string prop, int index, int data);
	virtual int getProperty(std::string prop) const;
	virtual int getProperty(std::string prop, int index) const;

protected:
	void initRemapTable();
};

#endif // _SDL_INPUT_KEYBOARD_PLUGINS_POLLEVENT_H_
