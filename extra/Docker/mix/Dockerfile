FROM ubuntu:18.04 AS build

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
 apt-get install -y \
 git \
 vim \
 xvfb \
 make \
 g++ \
 libsdl1.2-dev \
 x11vnc \
 libboost-all-dev \
 python3-pip \
 && groupadd -r VigasocoSDL \
 && useradd --no-log-init -r -m -g VigasocoSDL abadIA

ENV DISPLAY=:0

USER abadIA

WORKDIR /home/abadIA

ENV LC_ALL=C.UTF-8

RUN cd /home/abadIA \
  && git clone https://github.com/LaAbadIAdelCrimen/VigasocoSDL-AI.git \
  && cd VigasocoSDL-AI \
  && git checkout AbadIA-ng \
  && make clean \
  && make \
  && cd .. \
  && git clone https://github.com/LaAbadIAdelCrimen/abadia-gym.git \
  && cd abadia-gym \
  && pip3 install  behave websocket-client setuptools -r requirements.txt \
#  && pip3 install  -r requirements.txt \
  && mkdir -p snapshoots \
  && mkdir -p models 

ADD --chown=abadIA:VigasocoSDL https://storage.googleapis.com/abadia-data/models/last_model_v6.model /home/abadIA/abadia-gym/models
ADD --chown=abadIA:VigasocoSDL https://storage.googleapis.com/abadia-data/models/last_value_v1.model /home/abadIA/abadia-gym/models

#  && cd models \
#  && wget https://storage.googleapis.com/abadia-data/models/last_model_v6.model \
#  && wget https://storage.googleapis.com/abadia-data/models/last_value_v1.model 

COPY mix.sh /home/abadIA/mix.sh

WORKDIR /home/abadIA/
ENTRYPOINT ["./mix.sh", ""]
