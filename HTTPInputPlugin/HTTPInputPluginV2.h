// HTTPInputPluginV2.h
//
//	Class that handles keyboard input using SDLPollEvent
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _SDL_INPUT_KEYBOARD_PLUGINS_POLLEVENT_H_
#define _SDL_INPUT_KEYBOARD_PLUGINS_POLLEVENT_H_

#include "IInputPlugin.h"
#include "SDL.h"

#include "Juego.h"
#include <vector>
#include <condition_variable>
#include <mutex>

class HTTPInputPluginV2: public IInputPlugin , public INotificationSuscriber<Abadia::Juego>
{
// fields
protected:
	static const std::string g_properties[];
	static const int g_paramTypes[];
	bool eventos[evEVENT_LAST];
private:
	std::mutex eventMutex;
	std::condition_variable conditionVariable[evEVENT_LAST];
	Abadia::Juego *_juego;
// methods
public:
	// initialization and cleanup
	HTTPInputPluginV2();
	virtual ~HTTPInputPluginV2();
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
	virtual void update(Abadia::Juego* subject, int data);
private:
        void simulateKeys(int repeat, int interval, std::vector<char *> keys);
};

#endif // _SDL_INPUT_KEYBOARD_PLUGINS_POLLEVENT_H_
