// IAudioPlugin.h
//
//	Abstract class that defines the interface to handle audio output.
//
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _IAUDIO_PLUGIN_H_
#define _IAUDIO_PLUGIN_H_

#include <string>
#include "Types.h"

class IAudioPlugin
{
// methods
public:
	// initialization and cleanup
	IAudioPlugin(){}
	virtual ~IAudioPlugin(){}
	virtual bool init() = 0;
	virtual void end() = 0;

	// getters
	virtual bool isInitialized(void) const = 0;

	virtual void Play(int sample,bool loop=false) = 0;
	virtual void Pause(int sample) = 0;
	virtual void Stop(int sample) = 0;
	virtual bool LoadWAV(const char *nombre_y_ruta_fichero) = 0;
	virtual bool LoadWAV(const UINT8 *data, const UINT32 len) = 0;

	virtual void acquire() = 0; // ?? sirve para algo
	virtual void unAcquire() = 0; // ?? sirve para algo

	virtual void process(int *inputs) = 0; // ?? sirve para algo

	// access to custom plugin properties
	virtual const std::string *getProperties(int *num) const = 0;
	virtual const unsigned int *getPropertiesType() const = 0;
	virtual void setProperty(std::string prop, int data) = 0;
	virtual void setProperty(std::string prop, int index, int data) = 0;
	virtual int getProperty(std::string prop) const = 0;
	virtual int getProperty(std::string prop, int index) const = 0;
};


#endif // _IAUDIO_PLUGIN_H_
