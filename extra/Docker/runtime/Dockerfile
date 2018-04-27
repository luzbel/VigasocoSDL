FROM ubuntu AS build

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
 
# TODO: el rootfs lo podría montar el Makefile y no el Dockerfile
# TODO: compilar y copiar en rootfs solo los plugins que se van a usar
# TODO: meter en roms solo la version que se va a usar
# TODO: compilar en estatico sin boost y crow lo permiten

FROM scratch
ENV SDL_VIDEODRIVER dummy
#COPY --from=build /bin/rm /bin/
#COPY --from=build /bin/mv /bin/
#COPY --from=build /bin/bash /bin/
#COPY --from=build /bin/ls /bin/
COPY --from=build /home/abadIA/VigasocoSDL/VigasocoSDL/VigasocoSDL /bin/
COPY --from=build /home/abadIA/VigasocoSDL/VigasocoSDL/video /bin/video
COPY --from=build /home/abadIA/VigasocoSDL/VigasocoSDL/audio /bin/audio
COPY --from=build /home/abadIA/VigasocoSDL/VigasocoSDL/input /bin/input
COPY --from=build /home/abadIA/VigasocoSDL/VigasocoSDL/roms /bin/roms
COPY --from=build /etc/passwd /etc/passwd
COPY --from=build /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
COPY --from=build /lib/x86_64-linux-gnu /lib/x86_64-linux-gnu
COPY --from=build /lib64 /lib64
USER abadIA
EXPOSE 4477
WORKDIR /bin
ENTRYPOINT ["./VigasocoSDL","abadia -audio:libVigasocoSDLAudioPlugin.so,NULLAudioPlugin"]
#ENTRYPOINT ["bash"]
