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

#include "json.hpp"

enum ATENDER_MENSAJE_EN_EL_HTTPINPUTPLUGIN {
	ATENDER_MENSAJE_EN_EL_HTTPINPUTPLUGIN=0,
	ATENDIENDO_MENSAJE_EN_EL_HTTPINPUTPLUGIN=1,
	AVANZAR_UNA_INTERRUPCION_EN_EL_JUEGO=2,
	AVANZANDO_UNA_INTERRUPCION_EN_EL_JUEGO=3
};

enum ESTADOS_REPRODUCTOR {
	JUGANDO=0,
	GRABANDO=1,
	REPRODUCIENDO=2
};

class HTTPInputPlugin: public IInputPlugin
{
private:
	long contador=0; // cuantos comandos se han procesado
	std::mutex mtx;
	std::condition_variable condVar;
	int estado=ATENDER_MENSAJE_EN_EL_HTTPINPUTPLUGIN;
	std::string dump;
	nlohmann::json replayJSON;
	nlohmann::json acciones = nlohmann::json::array();
	int estadoReproductor = JUGANDO;
	
// fields
protected:
	static const std::string g_properties[];
	static const unsigned int g_paramTypes[];

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
	virtual const unsigned int *getPropertiesType() const;
	virtual void setStringProperty(std::string prop, std::string data);
	virtual void setProperty(std::string prop, int data);
	virtual void setProperty(std::string prop, int index, int data);
	virtual std::string getStringProperty(std::string prop) const;
	virtual int getProperty(std::string prop) const;
	virtual int getProperty(std::string prop, int index) const;

protected:
	void initRemapTable();
private:
	std::string atenderComando(const std::string& comando, const std::string& data="");
};

#endif	// _HTTP_INPUT_PLUGIN_H_
