// SDLAudioPlugin.h
//
//	Class that handles audio using SDL
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _SDL_AUDIO_PLUGIN_H_
#define _SDL_AUDIO_PLUGIN_H_

#include "IAudioPlugin.h"
#include "SDL.h"

#include <vector>

typedef struct sample {
	UINT8 *data;
	UINT32 dpos;
	UINT32 dlen;
	bool active;
	bool loop;
} sound;

typedef std::vector<sound> tSounds;
typedef tSounds::iterator tIteratorSounds;

class SDLAudioPlugin: public IAudioPlugin
{
// fields
	private:
		bool mute;
		tSounds sounds;
		bool _isInitialized;
		SDL_AudioSpec fmt_real; //Formato de audio obtenido del hardware
#ifdef __abadIA__
		bool sonidos[12]; //TODO: eliminar constante
#endif

protected:
	static const std::string g_properties[];
	static const unsigned int g_paramTypes[];

	std::string _errorMsg;				// error message

// methods
public:
	// initialization and cleanup
	SDLAudioPlugin();
	virtual ~SDLAudioPlugin();
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
	virtual const unsigned int *getPropertiesType() const;
	virtual void setProperty(std::string prop, int data);
	virtual void setProperty(std::string prop, int index, int data);
	virtual int getProperty(std::string prop) const;
	virtual int getProperty(std::string prop, int index) const;

protected:
	void initRemapTable();
private:
	static void wrapper_mix(void *unused,Uint8 *stream,int len);
	void mix(Uint8 *stream,int len);
	bool LoadWAV_internal(const SDL_AudioSpec &wave,Uint8 *audio_buf,const Uint32 dlen);
};


#endif	// _SDL_AUDIO__PLUGIN_H_
