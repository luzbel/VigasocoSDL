#CXXFLAGS=-O3 -D__abadIA__  -fPIC -I../core -I../VigasocoSDL/ 
#CXXFLAGS=-march=native -Ofast -fopenmp -D_GLIBCXX_PARALLEL -D__abadIA__  -fPIC -I../core -I../VigasocoSDL/ 
CXXFLAGS=-march=x86-64 -mtune=generic -frecord-gcc-switches -Ofast -fopenmp -D_GLIBCXX_PARALLEL -fPIC -std=c++11 -I../core -I../VigasocoSDL/ -D__abadIA__
LDFLAGS=-frecord-gcc-switches
#CXXFLAGS=-g -D__abadIA__ -fPIC -I../core -I../VigasocoSDL/ 
VPATH=.:../core:../core/abadia:../core/util:../core/systems

OBJECTS = NULLVideoPlugin.o PluginMain.o

../VigasocoSDL/video/libVigasocoNULLVideoPlugin.so: $(OBJECTS) 
	$(CXX) -fPIC -shared $(OBJECTS) -o $@
#	$(CXX) -g -fPIC -shared $(OBJECTS) -o $@

# para comprobar que no le faltan dependencias por resolver a la libreria
test: test.o
	$(CXX) -g test.o -o test -L ../VigasocoSDL/video/ -l VigasocoNULLVideoPlugin 

clean:
	rm -f $(OBJECTS) ../VigasocoSDL/video/libVigasocoNULLVideoPlugin.so test test.o
