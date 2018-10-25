// HTTPInputPlugin.h
//
//	Class that handles input using crow
//	Third attempt, sync with game loop using TimingHandler
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _HTTP_INPUT_PLUGIN_H_
#define _HTTP_INPUT_PLUGIN_H_

#include "IInputPlugin.h"
#include "SDL.h"

#include <condition_variable>
#include <mutex>

//extern std::mutex mtx;

class HTTPInputPlugin: public IInputPlugin
{
private:
	std::mutex mtx;
	std::condition_variable condVar;
	bool nextGameInterrupt=false;
// fields
protected:
	static const std::string g_properties[];
	static const int g_paramTypes[];

//	UINT8 _keys[256];							// keys state
	volatile UINT8 keystate[SDLK_LAST];

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

	virtual void process(int *inputs);

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

#endif	// _HTTP_INPUT_PLUGIN_H_
