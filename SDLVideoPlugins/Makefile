CXXFLAGS=-O3 -fPIC -I../core -I../VigasocoSDL/ -Ilibxbr-standalone `sdl-config --cflags`
#CXXFLAGS=-g -fPIC -I../core -I../VigasocoSDL/ `sdl-config --cflags`
VPATH=.:../core:../core/abadia:../core/util:../core/systems:libxbr-standalone

OBJECTS = xbr.o SDLDrawPluginXBR.o hq4x.o SDLDrawPluginHQX.o SDLDrawPlugin.o SDLVideoPlugins.o SDLDrawPlugin8bpp.o SDLDrawPlugin24bpp.o SDLDrawPluginPaletaGrises8bpp.o PluginMain.o

../VigasocoSDL/video/libVigasocoSDLDrawPlugin.so: $(OBJECTS) 
	$(CXX) -fPIC -shared $(OBJECTS) -o $@
#	$(CXX) -g -fPIC -shared $(OBJECTS) -o $@

# para comprobar que no le faltan dependencias por resolver a la libreria
test: test.o
	$(CXX) -g test.o -o test -L ../VigasocoSDL/video/ -l VigasocoSDLDrawPlugin `sdl-config --libs`

clean:
	rm -f $(OBJECTS) ../VigasocoSDL/video/libVigasocoSDLDrawPlugin.so test test.o
