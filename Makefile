input-plugins-dir := VigasocoSDL/input 
audio-plugins-dir := VigasocoSDL/audio
video-plugins-dir := VigasocoSDL/video

all: | $(input-plugins-dir) $(audio-plugins-dir) $(video-plugins-dir)
	cd SDLInputKeyboardPlugin && $(MAKE)
	cd SDLVideoPlugins && $(MAKE)
	cd SDLAudioPlugin && $(MAKE)
	cd NULLAudioPlugin && $(MAKE)
	cd VigasocoSDL && $(MAKE)

$(input-plugins-dir):
	mkdir $(input-plugins-dir)

$(audio-plugins-dir):
	mkdir $(audio-plugins-dir)

$(video-plugins-dir):
	mkdir $(video-plugins-dir)

clean:
	cd SDLInputKeyboardPlugin && $(MAKE) clean
	cd SDLVideoPlugins && $(MAKE) clean
	cd SDLAudioPlugin && $(MAKE) clean
	cd NULLAudioPlugin && $(MAKE) clean
	cd VigasocoSDL && $(MAKE) clean	
