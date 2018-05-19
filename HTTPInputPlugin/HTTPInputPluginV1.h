// HTTPInputPluginV1.h
//
//      Class that handles input using crow
//      This interface is deprecated, better use V2
// 
/////////////////////////////////////////////////////////////////////////////

#ifndef _HTTP_INPUT_PLUGIN_V1_H_
#define _HTTP_INPUT_PLUGIN_V1_H_

#include "IInputPlugin.h"
#include "SDL.h"

#include "Juego.h"
#include <condition_variable>
#include <mutex>

class HTTPInputPluginV1: public IInputPlugin, public INotificationSuscriber<Abadia::Juego>
{
// fields
protected:
	static const std::string g_properties[];
	static const int g_paramTypes[];

//	UINT8 _keys[256];							// keys state
	Uint8 keystate[SDLK_LAST];
	static SDLKey g_keyMapping[END_OF_INPUTS];	// VIGASOCO input to DirectInput mapping
	bool eventos[evEVENT_LAST];
#if defined _EE || defined _PS3
	SDL_Joystick *joy;
#endif
	std::string _errorMsg;						// error message
private:
	std::mutex eventMutex;
	std::condition_variable conditionVariable[evEVENT_LAST];
	Abadia::Juego *_juego;
// methods
public:
	// initialization and cleanup
	HTTPInputPluginV1();
	virtual ~HTTPInputPluginV1();
	virtual bool init(Abadia::Juego *juego);
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
	virtual void update(Abadia::Juego* subject, int data);
private:
	void cleanKeys();
	void sendActionAndWaitForEvent(SDLKey key, EventType event);
};

#endif	// _HTTP_INPUT_PLUGIN_V1_H_
