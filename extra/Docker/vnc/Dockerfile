FROM ubuntu:16.04 AS build

RUN apt-get update && apt-get install -y \
 git \
 vim \
 xvfb \
 make \
 g++ \
 libsdl1.2-dev \
 x11vnc \
 libboost-all-dev \
 virtualenv \
 && groupadd -r VigasocoSDL \
 && useradd --no-log-init -r -m -g VigasocoSDL abadIA

ENV DISPLAY=:0

USER abadIA

WORKDIR /home/abadIA

ENV LC_ALL=C.UTF-8

RUN cd /home/abadIA \
#  && virtualenv -p python3 python3 \
#  && source python3/bin/activate \
#  && pip install behave websocket-client requests \\
  && git clone https://github.com/LaAbadIAdelCrimen/VigasocoSDL-AI.git \
  && cd VigasocoSDL-AI \
  && git checkout AbadIA-ng \
  && make clean \
  && make 


WORKDIR /home/abadIA/VigasocoSDL-AI/VigasocoSDL
ENTRYPOINT ["./loop-abadIA.sh", ""]
