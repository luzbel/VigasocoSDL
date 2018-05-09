.PHONY: all folders build run clean

MAKEOPTIONS = CXX=clang LD=clang

all: folders build

folders:
	mkdir -p VigasocoSDL/audio
	mkdir -p VigasocoSDL/video
	mkdir -p VigasocoSDL/input

build:
	cd SDLInputKeyboardPlugin && $(MAKEOPTIONS) make
	cd FakeInputPlugin && $(MAKEOPTIONS) make
	cd SDLVideoPlugins && make && $(MAKEOPTIONS) make
	cd SDLAudioPlugin && $(MAKEOPTIONS) make
	cd NULLAudioPlugin && $(MAKEOPTIONS) make
	cd VigasocoSDL && $(MAKEOPTIONS) make


run:
	cd VigasocoSDL && ./VigasocoSDL abadia -audio:libVigasocoNULLAudioPlugin.so,NULLAudioPlugin -input:libVigasocoFakeInputPlugin.so,FakeInputPlugin -input:libVigasocoSDLInputPlugin.so,SDLInputPlugin

clean:
	cd SDLInputKeyboardPlugin && make clean
	cd FakeInputPlugin && make clean
	cd SDLVideoPlugins && make clean
	cd SDLAudioPlugin && make clean
	cd NULLAudioPlugin && make clean
	cd VigasocoSDL && make clean
	
