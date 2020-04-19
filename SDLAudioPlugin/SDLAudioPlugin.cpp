// SDLAudioPlugin.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "SDLAudioPlugin.h"

#include <stdexcept>

// para cerr
#include <iostream>

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

SDLAudioPlugin::SDLAudioPlugin()
{
}

SDLAudioPlugin::~SDLAudioPlugin()
{
}



bool SDLAudioPlugin::init()
{
	if ( SDL_InitSubSystem(SDL_INIT_AUDIO) != -1 )
	{
		//		printf("\n!!! SDL_AUDIO !!!\n\n");
	}

	SDL_AudioSpec fmt; // Formato de audio deseado

	fmt.freq=22050;
#ifdef __native_client__
	fmt.format=AUDIO_S8;
#else
//no usar temporalmente S8, por un bug en SDL
//http://bugzilla.libsdl.org/show_bug.cgi?id=1283
        fmt.format=AUDIO_U8;
#endif

	fmt.channels=1;
	fmt.samples=512;
	fmt.callback=wrapper_mix;
	fmt.userdata=this;

	if (SDL_OpenAudio(&fmt,&fmt_real)<0)
	{
		// printf("SDL_OpenAudio XXX\n");
		return false;
	}
	//printf("fmt_real %d %d %d %d\n",fmt.format,fmt.channels,fmt.samples,fmt.freq);


	SDL_PauseAudio(0);

	_isInitialized = true;

	return true;
}

void SDLAudioPlugin::end()
{
	// TODO: faltan los shutdowns necesarios ....
	SDL_CloseAudio();
	for (tIteratorSounds it=sounds.begin();it!=sounds.end();it++)
	{
		free(it->data);
	}

	_isInitialized = false;
}

void SDLAudioPlugin::Pause(int sample)
{
	if (sample>=sounds.size() ) return;

	sounds[sample].active=false;
}

void SDLAudioPlugin::Stop(int sample)
{
	if (sample>=sounds.size() ) return;

	sounds[sample].active=false;
	sounds[sample].dpos=0;
}

void SDLAudioPlugin::Play(int sample,bool loop)
{
	if (sample>=sounds.size() ) return;
	try
	{
		sounds.at(sample).active=true;
		// sounds.at(sample).dpos=0;
		sounds.at(sample).loop=loop;
	}
	catch (std::out_of_range o)
	{
		std::cerr << "Play " << sample << " " << loop << " " << o.what() << std::endl;
	}
	/*
	catch (std::range_error e)
	{
		std::cerr << "Play " << sample << " " << loop << " " << e.what() << std::endl;
	}*/
}

bool SDLAudioPlugin::LoadWAV(const char* file)
{
	SDL_AudioSpec wave;
	Uint8 *audio_buf;
	Uint32 dlen;
	SDL_AudioCVT cvt;
	sound s;

	// TODO: sin usar el FileLoader de Vigasoco, 
	// no tenemos la ruta completa hasta el archivo wav :-(
	// y pasarle a fuego el roms/abadia es muy cutre
	if (SDL_LoadWAV(file,&wave,&audio_buf,&dlen)==NULL) {
		// printf("\aSDL_LoadWAV file XXX\n");
		return false;
	}

	return LoadWAV_internal(wave,audio_buf,dlen);
}

bool SDLAudioPlugin::LoadWAV(const UINT8 *data, const UINT32 len)
{
	SDL_AudioSpec wave;
	Uint8 *audio_buf;
	Uint32 dlen;
	SDL_AudioCVT cvt;
	sound s;

	if (SDL_LoadWAV_RW(
			SDL_RWFromMem((UINT8 *)data,len),0,
			&wave,&audio_buf,&dlen)==NULL) {
		//printf("\aSDL_LoadWAV rom\n");
		return false;
	}

	return LoadWAV_internal(wave,audio_buf,dlen);
}

bool SDLAudioPlugin::LoadWAV_internal(const SDL_AudioSpec &wave,Uint8 *audio_buf,const Uint32 dlen)
{
	SDL_AudioCVT cvt;
	sound s;

	SDL_LockAudio();

	if (SDL_BuildAudioCVT(&cvt,wave.format,wave.channels,wave.freq,
				fmt_real.format,fmt_real.channels,fmt_real.freq) == -1 )
	{
		// printf("\aSDL_BuildAudioCVT failed\n");
		SDL_FreeWAV(audio_buf);
		SDL_UnlockAudio();
		return false;
	}
			
	// TODO: esto de AUDIO_S8,1,22050 deberían ser diferente según el tipo
	// de plugin ...
	// asi se podrían tener distintos plugins para distintos hardwares...
	
	cvt.buf = NULL;
	cvt.buf=(Uint8*) malloc(dlen*cvt.len_mult);
	if ( cvt.buf==NULL ) 
	{
		//printf("\amalloc audio\n");
		SDL_FreeWAV(audio_buf);
		SDL_UnlockAudio();
		return false;
	}
	memcpy(cvt.buf,audio_buf,dlen);
	cvt.len = dlen;
	if (SDL_ConvertAudio(&cvt) == -1 )
	{
		// printf("\aSDL_ConvertAudio\n");
		free(cvt.buf);
		SDL_FreeWAV(audio_buf);
		SDL_UnlockAudio();
		return false;
	}
	SDL_FreeWAV(audio_buf);

	s.data=cvt.buf;
	s.dpos=0;
	s.dlen=cvt.len_cvt;
	s.active=false;
	s.loop=false;
	sounds.push_back(s);
	SDL_UnlockAudio();

	return true;
}

void SDLAudioPlugin::acquire()
{
//	SDL_WM_GrabInput(SDL_GRAB_ON);
}

void SDLAudioPlugin::unAcquire()
{
//	SDL_WM_GrabInput(SDL_GRAB_OFF);
}

/////////////////////////////////////////////////////////////////////////////
// audio processing
/////////////////////////////////////////////////////////////////////////////

void SDLAudioPlugin::process(int *inputs)
{
// xxx
}

void SDLAudioPlugin::mix(UINT8 *stream,int len)
{
	UINT32 amount;
	for (tIteratorSounds it=sounds.begin();it!=sounds.end();it++)
	{
		if (it->active)
		{
			amount = (it->dlen-it->dpos);
			if (amount > len) amount=len;
			SDL_MixAudio(stream,&it->data[it->dpos],amount,mute?0:SDL_MIX_MAXVOLUME);
			it->dpos+=amount;
			if (it->dpos==it->dlen)
			{
				if (!it->loop) it->active=false;
				it->dpos=0;
			}
		}
	}
}

// static wrapper-function to be able to callback the member function mix()
void SDLAudioPlugin::wrapper_mix(void *userdata,Uint8 *stream,int len)
{
	// explicitly cast to a pointer to SDLAudioPlugin
	SDLAudioPlugin *mySelf = (SDLAudioPlugin*)userdata;

	// call member
	mySelf->mix(stream,len);
}

/////////////////////////////////////////////////////////////////////////////
// helper methods
/////////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////////
// Custom plugin properties
/////////////////////////////////////////////////////////////////////////////

const std::string SDLAudioPlugin::g_properties[] = {
	"mute"
		// TODO: quizas se pueda poner aqui el numero de bits
		// y la frecuencia de muestreo en alguna propiedad ...
};

const unsigned int SDLAudioPlugin::g_paramTypes[] = {
	PARAM_ARRAY | PARAM_INPUT
};

const unsigned int * SDLAudioPlugin::getPropertiesType() const
{
	return SDLAudioPlugin::g_paramTypes;
}

const std::string * SDLAudioPlugin::getProperties(int *num) const 
{
	*num = sizeof(g_paramTypes)/sizeof(g_paramTypes[0]);
	return SDLAudioPlugin::g_properties;
}

void SDLAudioPlugin::setProperty(std::string prop, int data)
{
	if (prop == "mute") {
		mute=data;
	} 
}

void SDLAudioPlugin::setProperty(std::string prop, int index, int data)
{
//TODO: usar propiedades interesantes para este plugin
/*
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
//			g_keyMapping[index] = (SDLKey)data;
		}
	}
*/
}

int SDLAudioPlugin::getProperty(std::string prop) const
{
	return -1;
};

int SDLAudioPlugin::getProperty(std::string prop, int index) const
{
//TODO: usar propiedades interesantes para este plugin
/*
	if (prop == "keyConfig"){
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
//			return g_keyMapping[index];
		}
	}
*/ 
	return -1; 
};
