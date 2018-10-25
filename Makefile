all:
	cd HTTPInputPlugin && make
	cd SDLInputKeyboardPlugin && make
	cd SDLVideoPlugins && make
	cd SDLAudioPlugin && make
	cd NULLAudioPlugin && make
	cd VigasocoSDL && make

clean:
	cd HTTPInputPlugin && make clean
	cd SDLInputKeyboardPlugin && make clean
	cd SDLVideoPlugins && make clean
	cd SDLAudioPlugin && make clean
	cd NULLAudioPlugin && make clean
	cd VigasocoSDL && make clean
	
