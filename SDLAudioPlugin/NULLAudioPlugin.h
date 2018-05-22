// NULLAudioPlugin.h
//
//	Class that handles audio using SDL
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _NULL_AUDIO_PLUGIN_H_
#define _NULL_AUDIO_PLUGIN_H_

#include "IAudioPlugin.h"

#include <vector>

class NULLAudioPlugin: public IAudioPlugin
{
// fields
	private:
		bool mute;
		bool _isInitialized;
#ifdef __abadIA__
		bool sonidos[12]; //TODO: eliminar constante
#endif

protected:
	static const std::string g_properties[];
	static const int g_paramTypes[];

	std::string _errorMsg;				// error message

// methods
public:
	// initialization and cleanup
	NULLAudioPlugin();
	virtual ~NULLAudioPlugin();
	virtual bool init();
	virtual void end();

	// getters
	virtual bool isInitialized(void) const { return _isInitialized; };

	virtual void Play(int sample,bool loop=false);
	virtual void Pause(int sample);
	virtual void Stop(int sample);
	virtual bool LoadWAV(const char *file);
	virtual bool LoadWAV(const UINT8 *data,const UINT32 len);

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
private:
};


#endif	// _SDL_AUDIO__PLUGIN_H_
