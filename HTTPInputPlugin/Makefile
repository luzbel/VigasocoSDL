CXXFLAGS=-O3 -fPIC -I../core -I../VigasocoSDL/ `sdl-config --cflags` -std=c++11 -D__abadIA__ 
VPATH=.:../core:../core/abadia:../core/util:../core/systems

all: ../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so 

OBJECTS = HTTPInputPlugin.o PluginMain.o

OBJECTS_replay=$(OBJECTS:.o=.replay.o)

%.replay.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJECTS_replay): CXXFLAGS+=-D__abadIA_REPLAY__

../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so: $(OBJECTS)
	$(CXX) -fPIC -shared $(OBJECTS) -lboost_thread -lboost_system -o $@

../VigasocoSDL/input/libVigasocoReplayInputPlugin.so: $(OBJECTS_replay)
	$(CXX) -fPIC -shared $(OBJECTS_replay) -lboost_thread -lboost_system -o $@

all: ../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so ../VigasocoSDL/input/libVigasocoReplayInputPlugin.so

clean:
	rm -f	$(OBJECTS) \
		$(OBJECTS_replay) \
		../VigasocoSDL/input/libVigasocoHTTPInputPlugin.so   \
		../VigasocoSDL/input/libVigasocoReplayInputPlugin.so
