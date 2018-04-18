CXXFLAGS=-O3 -fPIC -I../core -I../VigasocoSDL/ 
#CXXFLAGS=-g -fPIC -I../core -I../VigasocoSDL/ 
VPATH=.:../core:../core/abadia:../core/util:../core/systems

OBJECTS = NULLAudioPlugin.o PluginMain.o

../VigasocoSDL/audio/libVigasocoNULLAudioPlugin.so: $(OBJECTS) 
	$(CXX) -fPIC `sdl-config --libs` -shared $(OBJECTS) -o $@
#	$(CXX) -g -fPIC -shared $(OBJECTS) -o $@

# para comprobar que no le faltan dependencias por resolver a la libreria
test: test.o
	$(CXX) -g test.o -o test `sdl-config --libs` -L ../VigasocoSDL/audio/ -l VigasocoNULLAudioPlugin 

clean:
	rm -f $(OBJECTS) ../VigasocoSDL/audio/libVigasocoNULLAudioPlugin.so test test.o
