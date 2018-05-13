// HTTPInputPluginV1.h
//
//	Class that handles input using crow
//      This interface is deprecated, better use V2
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _HTTP_INPUT_PLUGIN_V1_H_
#define _HTTP_INPUT_PLUGIN_V1_H_

#include "IInputPlugin.h"
// Por usar las definiciones de teclas de SDL
#include "SDL.h"

#include <vector>

class HTTPInputPluginV1: public IInputPlugin
{
// fields
protected:
	static const std::string g_properties[];
	static const int g_paramTypes[];

	Uint8 keystate[SDLK_LAST];                                                    // keys state
	static SDLKey g_keyMapping[END_OF_INPUTS];	// VIGASOCO input to DirectInput mapping

// methods
public:
	// initialization and cleanup
	HTTPInputPluginV1();
	virtual ~HTTPInputPluginV1();
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
private:
	void cleanKeys();
};

#endif	// _HTTP_INPUT_PLUGIN_V1_H_
