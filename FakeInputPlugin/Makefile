CXXFLAGS=-O3 -fPIC -std=c++14 -Wc++11-extensions -I../core -I../VigasocoSDL/ `sdl-config --cflags` 
VPATH=.:../core:../core/abadia:../core/util:../core/systems

all: ../VigasocoSDL/input/libVigasocoFakeInputPlugin.so 

OBJECTS = FakeInputKeyboardPlugin.o PluginMain.o

../VigasocoSDL/input/libVigasocoFakeInputPlugin.so: $(OBJECTS)
	$(CXX) -fPIC `sdl-config --libs` -shared -Wc++11-extensions  -pthread  $(OBJECTS) -o $@

clean:
	rm -f $(OBJECTS) ../VigasocoSDL/input/libVigasocoFakeInputPlugin.so 
