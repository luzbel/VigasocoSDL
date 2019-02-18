CXXFLAGS=-O3 -fPIC -I../core -I../core/util -I../VigasocoSDL/ `sdl-config --cflags` -std=c++11 -D__abadIA__ 
VPATH=.:../core:../core/abadia:../core/util:../core/systems

all: ../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so 

OBJECTS = HTTPInputPlugin.o PluginMain.o

../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so: $(OBJECTS)
	$(CXX) -fPIC -shared $(OBJECTS) -lboost_thread -lboost_system -o $@

all: ../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so 

clean:
	rm -f	$(OBJECTS) \
		../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so  
