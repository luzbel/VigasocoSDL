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
COPY --from=build /usr/bin/ldd /bin/
COPY --from=build /bin/bash /bin/
COPY --from=build /bin/dash /bin/
COPY --from=build /bin/ls /bin/
COPY --from=build /home/abadIA/VigasocoSDL/VigasocoSDL/VigasocoSDL /bin/
COPY --from=build /home/abadIA/VigasocoSDL/VigasocoSDL/video /bin/video
COPY --from=build /home/abadIA/VigasocoSDL/VigasocoSDL/audio /bin/audio
COPY --from=build /home/abadIA/VigasocoSDL/VigasocoSDL/input /bin/input
COPY --from=build /home/abadIA/VigasocoSDL/VigasocoSDL/roms /bin/roms
COPY --from=build /etc/passwd /etc/passwd
#esto es lo que quiero quitar
#COPY --from=build /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
#sin esta no va, me falta copiar algo de /lib/x*
COPY --from=build /lib/x86_64-linux-gnu /lib/x86_64-linux-gnu
#COPY --from=build /lib64 /lib64
#COPY --from=build /home/abadIA/rootfs /
COPY --from=build /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libSDL-1.2.so.0 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.58.0 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libboost_system.so.1.58.0 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libgcc_s.so.1 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libasound.so.2 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libdl.so.2 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libpulse-simple.so.0 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libpulse.so.0 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libX11.so.6 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libXext.so.6 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libcaca.so.0 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/librt.so.1 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/pulseaudio/libpulsecommon-8.0.so /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libjson-c.so.2 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libdbus-1.so.3 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libxcb.so.1 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libslang.so.2 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libncursesw.so.5 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libtinfo.so.5 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libsystemd.so.0 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libwrap.so.0 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libsndfile.so.1 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libasyncns.so.0 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libXau.so.6 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libXdmcp.so.6 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libselinux.so.1 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/liblzma.so.5 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libgcrypt.so.20 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libnsl.so.1 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libFLAC.so.8 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libvorbisenc.so.2 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libresolv.so.2 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libpcre.so.3 /lib/x86_64-linux-gnu/
COPY --from=build /lib/x86_64-linux-gnu/libgpg-error.so.0 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libogg.so.0 /lib/x86_64-linux-gnu/
COPY --from=build /usr/lib/x86_64-linux-gnu/libvorbis.so.0 /lib/x86_64-linux-gnu/
COPY --from=build /etc/passwd /etc/passwd 
#COPY --from=build /lib64/ld-linux-x86-64.so.2 /lib64
COPY --from=build /lib64 /lib64
COPY busybox /bin/busybox
#USER abadIA
EXPOSE 4477
WORKDIR /bin
#ENTRYPOINT ["VigasocoSDL","abadia -audio:libVigasocoSDLAudioPlugin.so,NULLAudioPlugin"]
#ENTRYPOINT ["ls"]
#ENTRYPOINT ["dash"]
#ENTRYPOINT ["ldd"]
#ENTRYPOINT ["/bin/busybox"]
