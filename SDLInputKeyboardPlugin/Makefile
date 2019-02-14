CXXFLAGS=-O3 -fPIC -I../core -I../VigasocoSDL/ `sdl-config --cflags`
VPATH=.:../core:../core/abadia:../core/util:../core/systems

all: ../VigasocoSDL/input/libVigasocoSDLInputPlugin.so 

OBJECTS = SDLInputKeyboardPlugin.o PluginMain.o

../VigasocoSDL/input/libVigasocoSDLInputPlugin.so: $(OBJECTS)
	$(CXX) -fPIC -shared $(OBJECTS) -o $@

clean:
	rm -f $(OBJECTS) ../VigasocoSDL/input/libVigasocoSDLInputPlugin.so 
