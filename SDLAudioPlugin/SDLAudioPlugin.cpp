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
	mute = false;
	_isInitialized = false;
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
#ifdef __EMSCRIPTEN__
	// En Emscripten usamos SDL_mixer
	// TODO: estos valores van bien para los sonidos de La abadía pero no son genéricos
	// debería ser más parametrizable
	if (Mix_OpenAudio(22050, AUDIO_U8, 1, 512) < 0)
	{
		std::cerr << "Mix_OpenAudio failed: " << Mix_GetError() << std::endl;
		return false;
	}
	
	// Asignar canales suficientes para mezclar múltiples sonidos
	// TODO: son suficientes para la abadía pero no son genéricos
	// Debería ser parametrizable
	Mix_AllocateChannels(16);
	
	std::cout << "SDL_mixer initialized for Emscripten" << std::endl;
#else
	// Código original para plataformas nativas

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
#endif

	_isInitialized = true;

	return true;
}

void SDLAudioPlugin::end()
{
	// TODO: faltan los shutdowns necesarios ....
#ifdef __EMSCRIPTEN__
	// Detener todos los sonidos
	Mix_HaltChannel(-1);
	
	// Liberar chunks
	for (size_t i = 0; i < mix_chunks.size(); i++)
	{
		if (mix_chunks[i] != NULL)
		{
			Mix_FreeChunk(mix_chunks[i]);
		}
	}
	mix_chunks.clear();
	
	Mix_CloseAudio();
#else
	SDL_CloseAudio();
	for (tIteratorSounds it=sounds.begin();it!=sounds.end();it++)
	{
		free(it->data);
	}
#endif

	_isInitialized = false;
}

void SDLAudioPlugin::Pause(int sample)
{
#ifdef __EMSCRIPTEN__
	if (sample >= mix_chunks.size()) return;
	if (mix_chunks[sample] != NULL && sound_channels[sample] >= 0)
	{
		Mix_Pause(sound_channels[sample]);
	}
#else
	if (sample>=sounds.size() ) return;
	sounds[sample].active=false;
#endif
}

void SDLAudioPlugin::Stop(int sample)
{
#ifdef __EMSCRIPTEN__
	if (sample >= mix_chunks.size()) return;
	if (mix_chunks[sample] != NULL && sound_channels[sample] >= 0)
	{
		Mix_HaltChannel(sound_channels[sample]);
		sound_channels[sample] = -1;
	}
#else
	if (sample>=sounds.size() ) return;
	sounds[sample].active=false;
	sounds[sample].dpos=0;
#endif
}

void SDLAudioPlugin::Play(int sample,bool loop)
{
#ifdef __EMSCRIPTEN__
	if (sample >= mix_chunks.size()) return;
	if (mix_chunks[sample] == NULL) return;
	
	try
	{
		// Si ya está sonando (no pausado), no hacer nada
		if (sound_channels[sample] >= 0 && Mix_Playing(sound_channels[sample]))
		{
			// Ya está reproduciéndose, no reiniciar
			return;
		}
		
		// Si está pausado, reanudar
		if (sound_channels[sample] >= 0 && Mix_Paused(sound_channels[sample]))
		{
			Mix_Resume(sound_channels[sample]);
			return;
		}
		
		// Si no está sonando ni pausado, reproducir desde el principio
		//int channel = Mix_PlayChannel(-1, mix_chunks[sample], loop ? -1 : 0);
		int channel = Mix_PlayChannel(sample, mix_chunks[sample], loop ? -1 : 0);
		if (channel!=sample) printf("play channel!=sample\n");
		sound_channels[sample] = channel;

		// SIEMPRE aplicar el volumen correcto según estado de mute
		if (channel >= 0)
		{
			Mix_Volume(channel, mute ? 0 : MIX_MAX_VOLUME);
		}		
	}
	catch (std::out_of_range o)
	{
		std::cerr << "Play " << sample << " " << loop << " " << o.what() << std::endl;
	}
#else
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
#endif
}

bool SDLAudioPlugin::LoadWAV(const char* file)
{
#ifdef __EMSCRIPTEN__
	Mix_Chunk *chunk = Mix_LoadWAV(file);
	if (chunk == NULL)
	{
		std::cerr << "Mix_LoadWAV failed for " << file << ": " << Mix_GetError() << std::endl;
		return false;
	}
	
	mix_chunks.push_back(chunk);
	sound_channels.push_back(-1);
	
	std::cout << "Loaded WAV: " << file << " (index=" << (mix_chunks.size()-1) << ")" << std::endl;
	return true;
#else
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
#endif
}

bool SDLAudioPlugin::LoadWAV(const UINT8 *data, const UINT32 len)
{
#ifdef __EMSCRIPTEN__
	SDL_RWops *rw = SDL_RWFromMem((void*)data, len);
	if (rw == NULL)
	{
		std::cerr << "SDL_RWFromMem failed" << std::endl;
		return false;
	}
	
	Mix_Chunk *chunk = Mix_LoadWAV_RW(rw, 1); // 1 = free RW automatically
	if (chunk == NULL)
	{
		std::cerr << "Mix_LoadWAV_RW failed: " << Mix_GetError() << std::endl;
		return false;
	}
	
	mix_chunks.push_back(chunk);
	sound_channels.push_back(-1);
	
	std::cout << "Loaded WAV from memory (index=" << (mix_chunks.size()-1) << ")" << std::endl;
	return true;
#else
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
#endif
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
#ifdef __EMSCRIPTEN__
		//TODO: Revisar, igual no hace falta
		// Aplicar mute a todos los canales activos
		for (size_t i = 0; i < sound_channels.size(); i++)
		{
			if (sound_channels[i] >= 0)
			{
				Mix_Volume(sound_channels[i], mute ? 0 : MIX_MAX_VOLUME);
			}
		}
#endif
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
