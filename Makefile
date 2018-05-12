all: folders build

folders:
	mkdir -p VigasocoSDL/audio
	mkdir -p VigasocoSDL/video
	mkdir -p VigasocoSDL/input

build:
	cd SDLInputKeyboardPlugin && make
	cd HTTPInputPlugin && make
	cd SDLVideoPlugins && make
	cd SDLAudioPlugin && make
	cd NULLAudioPlugin && make
	cd VigasocoSDL && make

clean:
	cd SDLInputKeyboardPlugin && make clean
	cd HTTPInputPlugin && make clean
	cd SDLVideoPlugins && make clean
	cd SDLAudioPlugin && make clean
	cd NULLAudioPlugin && make clean
	cd VigasocoSDL && make clean
	
