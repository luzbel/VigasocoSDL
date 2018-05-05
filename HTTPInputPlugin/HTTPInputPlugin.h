// HTTPInputPlugin.h
//
//	Class that handles input using crow
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _HTTP_INPUT_PLUGIN_H_
#define _HTTP_INPUT_PLUGIN_H_

#include "IInputPlugin.h"
// Por usar las definiciones de teclas de SDL
#include "SDL.h"

#include <vector>

class HTTPInputPlugin: public IInputPlugin
{
// fields
protected:
	static const std::string g_properties[];
	static const int g_paramTypes[];

	UINT8 keystate[256];							// keys state

	static SDLKey g_keyMapping[END_OF_INPUTS];	// VIGASOCO input to DirectInput mapping
	std::string _errorMsg;						// error message

// methods
public:
	// initialization and cleanup
	HTTPInputPlugin();
	virtual ~HTTPInputPlugin();
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
	void simulateKeys(int repeat, int interval, std::vector<char *> keys);
};

#endif	// _HTTP_INPUT_PLUGIN_H_
