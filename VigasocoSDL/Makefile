#CXXFLAGS=-march=native -frecord-gcc-switches -Ofast -fopenmp -std=c++11 -I../core `sdl-config --cflags` 
CXXFLAGS=-march=x86-64 -mtune=generic -frecord-gcc-switches -Ofast -fopenmp -std=c++11 -I../core `sdl-config --cflags` 
LDFLAGS=-frecord-gcc-switches
VPATH=.:../core:../core/abadia:../core/util:../core/systems

# en OBJECTS_CORE falta Operations.o ??
OBJECTS_CORE = AbadiaDriver.o FontManager.o GameDriver.o ICriticalSection.o InputPort.o IThread.o TimingHandler.o Vigasoco.o FileLoader.o GameDataEntity.o GfxData.o InputHandler.o IPalette.o NormalLoadHandler.o UncompressedLoader.o cpc6128.o DskReader.o

OBJECTS_ABADIA = Abad.o AccionesDia.o Adso.o Berengario.o Bernardo.o BuscadorRutas.o Comandos.o Controles.o EntidadJuego.o FijarOrientacion.o GeneradorPantallas.o GestorFrases.o Guillermo.o InfoJuego.o Jorge.o Juego.o Logica.o Malaquias.o Marcador.o MezcladorSprites.o Monje.o MotorGrafico.o Objeto.o Paleta.o Pergamino.o PergaminoTextos.o PersonajeConIA.o Personaje.o Puerta.o RejillaPantalla.o Severino.o Sprite.o SpriteLuz.o SpriteMonje.o TransformacionesCamara.o Serializar.o

OBJECTS_SDL = PluginHandler.o SDLTimer.o SDLCriticalSection.o SDLPalette.o SDLThread.o VigasocoSDL.o SDLMain.o

OBJECTS = $(OBJECTS_CORE) $(OBJECTS_ABADIA) $(OBJECTS_SDL) 

OBJECTS_abadIA=$(OBJECTS:.o=.abadIA.o)
OBJECTS_abadIA-HEADLESS=$(OBJECTS:.o=.abadIA-HEADLESS.o)
OBJECTS_profile=$(OBJECTS_abadIA-HEADLESS:.abadIA-HEADLESS.o=.abadIA-HEADLESS.profile.o)
OBJECTS_abadIA-HEADLESS-gcda=$(OBJECTS_abadIA-HEADLESS:.abadIA-HEADLESS.o=.abadIA-HEADLESS.gcda)

$(OBJECTS_abadIA): CXXFLAGS+=-D__abadIA__ 
$(OBJECTS_abadIA-HEADLESS): CXXFLAGS+=-D__abadIA__ -D__abadIA_FAST__ -D__abadIA_HEADLESS__ -fprofile-use -fprofile-correction
$(OBJECTS_profile): CXXFLAGS+=-D__abadIA__ -D__abadIA_PROFILE__  -D__abadIA_FAST__ -D__abadIA_HEADLESS__ -fprofile-generate 

%.abadIA.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

%.abadIA-HEADLESS.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

%.abadIA-HEADLESS.profile.o: %.cpp	
	$(CXX) $(CXXFLAGS) -c $< -o $@

%.abadIA-HEADLESS.gcda: abadIA-profile
	@echo  $(@:.gcda=.profile.gcda) debería estar generado al ejecutarse abadIA-profile	
	@cp $(@:.gcda=.profile.gcda) $@ 

TARGETS=VigasocoSDL abadIA-profile abadIA-HEADLESS abadIA

VigasocoSDL: $(OBJECTS)
	$(CXX) $^ `sdl-config --libs` -o $@

abadIA-profile: LDFLAGS+=-fprofile-generate 

abadIA-profile: $(OBJECTS_profile)
	$(CXX) $(LDFLAGS) $^ `sdl-config --libs` -o $@
	./abadIA-profile
	touch PergaminoTextos.abadIA-HEADLESS.profile.gcda

abadIA-HEADLESS: LDFLAGS+=-fprofile-use -fprofile-correction

abadIA-HEADLESS: $(OBJECTS_abadIA-HEADLESS-gcda) $(OBJECTS_abadIA-HEADLESS)
	$(CXX) $(LDFLAGS) $(OBJECTS_abadIA-HEADLESS) `sdl-config --libs` -o $@

abadIA: $(OBJECTS_abadIA)
	$(CXX) $(LDFLAGS) $(OBJECTS_abadIA) `sdl-config --libs` -o $@

all: $(TARGETS)

clean:
	rm -f $(OBJECTS) $(OBJECTS_abadIA) $(OBJECTS_abadIA-HEADLESS) $(OBJECTS_profile) $(TARGETS)

mrproper: clean
	rm -f core *.gcda gmon.out
