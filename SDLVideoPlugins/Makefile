CXXFLAGS=-O3 -fPIC -I../core -I../VigasocoSDL/ `sdl2-config --cflags`
#CXXFLAGS=-g -fPIC -I../core -I../VigasocoSDL/ `sdl2-config --cflags`
VPATH=.:../core:../core/abadia:../core/util:../core/systems

OBJECTS = SDLDrawPlugin.o SDLVideoPlugins.o SDLDrawPlugin8bpp.o SDLDrawPlugin24bpp.o SDLDrawPluginPaletaGrises8bpp.o PluginMain.o

../VigasocoSDL/video/libVigasocoSDLDrawPlugin.so: $(OBJECTS) 
	$(CXX) -fPIC -shared $(OBJECTS) -o $@
#	$(CXX) -g -fPIC -shared $(OBJECTS) -o $@

# para comprobar que no le faltan dependencias por resolver a la libreria
test: test.o
	$(CXX) -g test.o -o test -L ../VigasocoSDL/video/ -l VigasocoSDLDrawPlugin `sdl2-config --libs`

clean:
	rm -f $(OBJECTS) ../VigasocoSDL/video/libVigasocoSDLDrawPlugin.so test test.o
