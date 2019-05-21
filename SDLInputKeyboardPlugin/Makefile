#CXXFLAGS=-O3 -fPIC -I../core -I../VigasocoSDL/ `sdl-config --cflags`
CXXFLAGS=-march=x86-64 -mtune=generic -frecord-gcc-switches -Ofast -fopenmp -D_GLIBCXX_PARALLEL -fPIC -std=c++11 -I../core -I../VigasocoSDL/ `sdl-config --cflags` -D__abadIA__
LDFLAGS=-frecord-gcc-switches
VPATH=.:../core:../core/abadia:../core/util:../core/systems

all: ../VigasocoSDL/input/libVigasocoSDLInputPlugin.so 

OBJECTS = SDLInputKeyboardPlugin.o PluginMain.o

../VigasocoSDL/input/libVigasocoSDLInputPlugin.so: $(OBJECTS)
	$(CXX) -fPIC -shared $(OBJECTS) -o $@

clean:
	rm -f $(OBJECTS) ../VigasocoSDL/input/libVigasocoSDLInputPlugin.so 
