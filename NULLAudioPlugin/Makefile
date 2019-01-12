<<<<<<< HEAD
CXXFLAGS=-O3 -D__abadIA__  -fPIC -I../core -I../VigasocoSDL/ 
#CXXFLAGS=-g -D__abadIA__ -fPIC -I../core -I../VigasocoSDL/ 
=======
CXXFLAGS=-O3 -fPIC -I../core -I../VigasocoSDL/ -D__abadIA__
#CXXFLAGS=-g -fPIC -I../core -I../VigasocoSDL/ 
>>>>>>> luzbel/abadIA-timing-by-webserver
VPATH=.:../core:../core/abadia:../core/util:../core/systems

OBJECTS = NULLAudioPlugin.o PluginMain.o

../VigasocoSDL/audio/libVigasocoNULLAudioPlugin.so: $(OBJECTS) 
	$(CXX) -fPIC -shared $(OBJECTS) -o $@
#	$(CXX) -g -fPIC -shared $(OBJECTS) -o $@

# para comprobar que no le faltan dependencias por resolver a la libreria
test: test.o
	$(CXX) -g test.o -o test -L ../VigasocoSDL/audio/ -l VigasocoNULLAudioPlugin 

clean:
	rm -f $(OBJECTS) ../VigasocoSDL/audio/libVigasocoNULLAudioPlugin.so test test.o
