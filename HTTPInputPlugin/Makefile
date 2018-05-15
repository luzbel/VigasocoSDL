#CXXFLAGS=-std=c++11 -O3 -fPIC -I../core -I../VigasocoSDL/ `sdl-config --cflags`
CXXFLAGS=-D_CROW_V1_COMPATIBLE_MODE_ -std=c++11 -g -fPIC -I../core -I../core/abadia -I../VigasocoSDL/ `sdl-config --cflags`
VPATH=.:../core:../core/abadia:../core/util:../core/systems

all: ../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so 

OBJECTS = HTTPInputPluginV1.o HTTPInputPluginV2.o PluginMain.o

../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so: $(OBJECTS)
	$(CXX) -fPIC -shared $(OBJECTS) -o $@ -lboost_thread -lboost_system -pthread

# para comprobar que no le faltan dependencias por resolver a la libreria
test: test.o ../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so
	$(CXX) -g test.o -o test -L ../VigasocoSDL/input/ -l VigasocoHTTPInputPlugin `sdl-config --libs`
#	$(CXX) -g test.o -o test -L ../VigasocoSDL/input/ -l VigasocoHTTPInputPlugin 
clean:
	rm -f $(OBJECTS) ../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so test.o test
