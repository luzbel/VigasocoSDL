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
  && git checkout AbadIA-ng \
  && mkdir -p VigasocoSDL/audio \
  && mkdir -p VigasocoSDL/video \
  && mkdir -p VigasocoSDL/input \
  && make clean \
  && make

WORKDIR /home/abadIA/VigasocoSDL/VigasocoSDL
ENTRYPOINT ["./abadIA", "abadia -audio:libVigasocoNULLAudioPlugin.so,NULLAudioPlugin"]
