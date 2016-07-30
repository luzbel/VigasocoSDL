CXXFLAGS=-O3 -fPIC -I../core -I../VigasocoSDL/ `sdl2-config --cflags`
#CXXFLAGS=-g -fPIC -I../core -I../VigasocoSDL/ `sdl-config --cflags`
VPATH=.:../core:../core/abadia:../core/util:../core/systems

OBJECTS = SDLAudioPlugin.o NULLAudioPlugin.o PluginMain.o

../VigasocoSDL/audio/libVigasocoSDLAudioPlugin.so: $(OBJECTS) 
	$(CXX) -fPIC -shared $(OBJECTS) -o $@
#	$(CXX) -g -fPIC -shared $(OBJECTS) -o $@

# para comprobar que no le faltan dependencias por resolver a la libreria
test: test.o
	$(CXX) -g test.o -o test -L ../VigasocoSDL/audio/ -l VigasocoSDLAudioPlugin `sdl2-config --libs`

clean:
	rm -f $(OBJECTS) ../VigasocoSDL/audio/libVigasocoSDLAudioPlugin.so test test.o
