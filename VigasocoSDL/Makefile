<<<<<<< HEAD
CXXFLAGS=-O3 -std=c++11 -D __abadIA__ -I../core `sdl-config --cflags` 
#CXXFLAGS=-g -std=c++11 -D __abadIA__ -I../core `sdl-config --cflags` 
=======
#CXXFLAGS=-O3 -I../core `sdl-config --cflags` 
CXXFLAGS=-g -std=c++11 -I../core `sdl-config --cflags` -D__abadIA__
>>>>>>> luzbel/abadIA-timing-by-webserver
VPATH=.:../core:../core/abadia:../core/util:../core/systems

# en OBJECTS_CORE falta Operations.o ??
OBJECTS_CORE = AbadiaDriver.o FontManager.o GameDriver.o ICriticalSection.o InputPort.o IThread.o TimingHandler.o Vigasoco.o FileLoader.o GameDataEntity.o GfxData.o InputHandler.o IPalette.o NormalLoadHandler.o UncompressedLoader.o cpc6128.o DskReader.o

OBJECTS_ABADIA = Abad.o AccionesDia.o Adso.o Berengario.o Bernardo.o BuscadorRutas.o Comandos.o Controles.o EntidadJuego.o FijarOrientacion.o GeneradorPantallas.o GestorFrases.o Guillermo.o InfoJuego.o Jorge.o Juego.o Logica.o Malaquias.o Marcador.o MezcladorSprites.o Monje.o MotorGrafico.o Objeto.o Paleta.o Pergamino.o PergaminoTextos.o PersonajeConIA.o Personaje.o Puerta.o RejillaPantalla.o Severino.o Sprite.o SpriteLuz.o SpriteMonje.o TransformacionesCamara.o Serializar.o

OBJECTS_SDL = PluginHandler.o SDLTimer.o SDLCriticalSection.o SDLPalette.o SDLThread.o VigasocoSDL.o SDLMain.o

OBJECTS = $(OBJECTS_CORE) $(OBJECTS_ABADIA) $(OBJECTS_SDL)

OBJECTS_headless=$(OBJECTS:.o=.headless.o)

%.headless.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJECTS_headless): CXXFLAGS+=-D __abadIA_HEADLESS__

OBJECTS_STATIC_PLUGINS = video/libVigasocoSDLDrawPlugin.a input/libVigasocoSDLInputPlugin.a audio/libVigasocoSDLAudioPlugin.a

OBJECTS_static=$(OBJECTS:.o=.static.o)

%.static.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJECTS_static): CXXFLAGS+=-D__VIGASOCO_SDL_STATIC__

OBJECTS_replay=$(OBJECTS:.o=.replay.o)

%.replay.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJECTS_replay): CXXFLAGS+=-D__abadIA_REPLAY__

OBJECTS_megaReplay=$(OBJECTS:.o=.megaReplay.o)

%.megaReplay.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJECTS_megaReplay): CXXFLAGS+=-D__abadIA_MEGAREPLAY__

VigasocoSDL: $(OBJECTS)
	$(CXX) $^ `sdl-config --libs` -o $@
	strip $@

VigasocoSDL.headless: $(OBJECTS_headless)
	$(CXX) $^ `sdl-config --libs` -o $@
	strip $@

VigasocoSDL.static: $(OBJECTS_static) $(OBJECTS_STATIC_PLUGINS)
	$(CXX) -static $^ `sdl-config --static-libs` -ldl -o $@
	strip $@

VigasocoSDL.replay: $(OBJECTS_replay)
	$(CXX) $^ `sdl-config --libs` -o $@
	strip $@

VigasocoSDL.megaReplay: $(OBJECTS_megaReplay)
	$(CXX) $^ `sdl-config --libs` -o $@
	strip $@


all: VigasocoSDL VigasocoSDL.headless VigasocoSDL.static VigasocoSDL.replay VigasocoSDL.megaReplay

clean:
	rm -f	$(OBJECTS) $(OBJECTS_headless) $(OBJECTS_replay) $(OBJECTS_megaReplay) \
		core VigasocoSDL VigasocoSDL.headless VigasocoSDL.static VigasocoSDL.replay VigasocoSDL.megaReplay
