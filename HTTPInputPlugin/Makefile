#CXXFLAGS=-O3 -fPIC -I../core -I../VigasocoSDL/ `sdl-config --cflags` -std=c++11 -D__abadIA__ 
#CXXFLAGS=-march=native -Ofast -fopenmp -fPIC -I../core -I../core/util  -I../VigasocoSDL/ `sdl-config --cflags` -std=c++11 -D__abadIA__ 
#TODO: falta ver si se puede hacer profiling en ejecución de una librería dinámica y recompilar optimizando
CXXFLAGS=-march=x86-64 -mtune=generic -frecord-gcc-switches -Ofast -fopenmp -std=c++11 -D__abadIA__ -fPIC -I../core -I../core/util -I../VigasocoSDL  `sdl-config --cflags` 
LDFLAGS=-frecord-gcc-switches
VPATH=.:../core:../core/abadia:../core/util:../core/systems

all: ../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so 

OBJECTS = HTTPInputPlugin.o PluginMain.o

../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so: $(OBJECTS)
	$(CXX) -fPIC -shared $(OBJECTS) -lboost_thread -lboost_system -o $@

clean:
	rm -f $(OBJECTS) ../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so 
