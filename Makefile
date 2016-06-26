all:
	cd SDLInputKeyboardPlugin && make
	cd SDLVideoPlugins && make
	cd SDLAudioPlugin && make
	cd VigasocoSDL && make

clean:
	cd SDLInputKeyboardPlugin && make clean
	cd SDLVideoPlugins && make clean
	cd SDLAudioPlugin && make clean
	cd VigasocoSDL && make clean
	
