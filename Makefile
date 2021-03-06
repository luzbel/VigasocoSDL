input-plugins-dir := VigasocoSDL/input 
audio-plugins-dir := VigasocoSDL/audio
video-plugins-dir := VigasocoSDL/video

all: | $(input-plugins-dir) $(audio-plugins-dir) $(video-plugins-dir)
	cd SDLInputKeyboardPlugin && make
	cd SDLVideoPlugins && make
	cd SDLAudioPlugin && make
	cd NULLAudioPlugin && make
	cd VigasocoSDL && make

$(input-plugins-dir):
	mkdir $(input-plugins-dir)

$(audio-plugins-dir):
	mkdir $(audio-plugins-dir)

$(video-plugins-dir):
	mkdir $(video-plugins-dir)

clean:
	cd SDLInputKeyboardPlugin && make clean
	cd SDLVideoPlugins && make clean
	cd SDLAudioPlugin && make clean
	cd NULLAudioPlugin && make clean
	cd VigasocoSDL && make clean
