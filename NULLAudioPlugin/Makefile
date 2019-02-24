#CXXFLAGS=-O3 -fPIC -I../core -I../VigasocoSDL/ -D__abadIA__
#CXXFLAGS=-march=native -Ofast -fopenmp -D_GLIBCXX_PARALLEL -fPIC -I../core -I../VigasocoSDL/ -D__abadIA__
CXXFLAGS=-march=x86-64 -mtune=generic -frecord-gcc-switches -Ofast -fopenmp -D_GLIBCXX_PARALLEL -fPIC -std=c++11 -I../core -I../VigasocoSDL/ -D__abadIA__
LDFLAGS=-frecord-gcc-switches
#CXXFLAGS=-g -fPIC -I../core -I../VigasocoSDL/ 
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
