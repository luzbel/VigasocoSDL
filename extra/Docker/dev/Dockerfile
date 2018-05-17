FROM ubuntu:16.04 AS build

RUN apt-get update && apt-get install -y \
 git \
 libsdl1.2-dev \
 clang \
 libboost-all-dev \
 && groupadd -r VigasocoSDL \
 && useradd --no-log-init -r -m -g VigasocoSDL abadIA

USER abadIA

WORKDIR /home/abadIA

ENV CXX clang
ENV LD clang

RUN cd /home/abadIA && git clone https://github.com/luzbel/VigasocoSDL.git \
  && cd VigasocoSDL \
  && git checkout pruebasAbadIA \
  && mkdir VigasocoSDL/audio \
  && mkdir VigasocoSDL/video \
  && mkdir VigasocoSDL/input \
  && make clean \
  && make

WORKDIR /home/abadIA/VigasocoSDL/VigasocoSDL
ENTRYPOINT ["./VigasocoSDL", "abadia -audio:libVigasocoNULLAudioPlugin.so,NULLAudioPlugin"]
