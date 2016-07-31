#CXXFLAGS=-O3 -fPIC -I../core -I../VigasocoSDL/ `sdl2-config --cflags`
CXXFLAGS=-g -fPIC -I../core -I../VigasocoSDL/ `sdl2-config --cflags`
VPATH=.:../core:../core/abadia:../core/util:../core/systems

all: ../VigasocoSDL/input/libVigasocoSDLInputPlugin.so 

OBJECTS = SDLInputKeyboardPlugin.o PluginMain.o

../VigasocoSDL/input/libVigasocoSDLInputPlugin.so: $(OBJECTS)
#	$(CXX) -fPIC -shared $(OBJECTS) -o $@
	$(CXX) -g -fPIC -shared $(OBJECTS) -o $@

clean:
	rm -f $(OBJECTS) ../VigasocoSDL/input/libVigasocoSDLInputPlugin.so 
