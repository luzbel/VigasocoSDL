#CXXFLAGS=-O3 -fPIC -I../core -I../VigasocoSDL/ `sdl-config --cflags`
CXXFLAGS=-march=x86-64 -mtune=generic -frecord-gcc-switches -Ofast -fopenmp -D_GLIBCXX_PARALLEL -fPIC -std=c++11 -I../core -I../VigasocoSDL/ `sdl-config --cflags` -D__abadIA__
LDFLAGS=-frecord-gcc-switches
#CXXFLAGS=-g -fPIC -I../core -I../VigasocoSDL/ `sdl-config --cflags`
VPATH=.:../core:../core/abadia:../core/util:../core/systems

OBJECTS = SDLDrawPlugin.o SDLVideoPlugins.o SDLDrawPlugin8bpp.o SDLDrawPlugin24bpp.o SDLDrawPluginPaletaGrises8bpp.o PluginMain.o

../VigasocoSDL/video/libVigasocoSDLDrawPlugin.so: $(OBJECTS) 
	$(CXX) -g -fPIC -shared $(OBJECTS) -o $@

# para comprobar que no le faltan dependencias por resolver a la libreria
test: test.o
	$(CXX) -g test.o -o test -L ../VigasocoSDL/video/ -l VigasocoSDLDrawPlugin `sdl-config --libs`

clean:
	rm -f $(OBJECTS) ../VigasocoSDL/video/libVigasocoSDLDrawPlugin.so test test.o
