# Instrucciones para desarrollar con Dockers (Verano del 2018)

**Este texto proviene de un hilo de Slack y deberíamos actualizarlo**

El dockerfile antiguo estaba en:

https://github.com/luzbel/VigasocoSDL/blob/pruebasAbadIA/extra/Docker/dev/Dockerfile 

Ahora está en la rama oficial VigasocoSDL-ng



## Pasos ##
 
Parto de lanzar un contenedor basado en ubuntu:xenial

```
docker run -ti -p 5900:5900 -p 4477:4477 -p 8182:8182 ubuntu bash
```


Los puertos exportados son los que usan VNC y la interfaz web.

Dentro de ese bash hago:

```
apt-get update
apt-get install -y git vim xvfb make g++ libsdl1.2-dev x11vnc libboost-all-dev virtualenv

virtualenv -p python3 python3
source python3/bin/activate


pip install behave websocket-client requests

git clone https://github.com/LaAbadIAdelCrimen/VigasocoSDL-AI.git
cd VigasocoSDL/

git checkout AbadIA
export DISPLAY=:0
Xvfb -screen 0 800x600x16 &
x11vnc &
cat > ~/.vimrc
set fileencodings=utf-8
set encoding=utf-8
[CTRL-D]
```

/* revisar a que se refiere */ 

Luego salgo del contenedor y hago commit ID-CONTENEDOR abadIA


## Cuando queremos trabajar con la imagen 

```
docker run -ti -p 5900:5900 -p 4477:4477 -p 8182:8182 abadIA bash
```

y dentro export DISPLAY y arrancar Xvfb y x11vnc

Si compilo VigasocoSDL y lo arranco (no hay que pasar argumentos porque en esa rama ya usa por defecto el NULLAudioPlugin y el HTTPInputPlugin ) lo puedo ver desde cualquier cliente VNC conectando a localhost:5900 (el puerto está mapeado del contenedor al host)

Yo uso https://chrome.google.com/webstore/detail/vnc%C2%AE-viewer-for-google-ch/iabmpiboiopbgfabjmgeedhcmjenhbla?utm_source=chrome-app-launcher-info-dialog
 
##  Notas

Suelo lanzar VigasocoSDL desde el contenedor y abrir otro bash con docker exec -ti ID-CONTENEDOR bash

Los cambios que hago en código suelo hacer push a github

Para el resto de cambios, pues como no tengo Dockerfile, hago commit de vez en cuando (si, sé que es mala practica)

Ah, y el docker de windows con hyper-v cuando arranca va muy bien (combinado con el ubuntu bash para win es una delicia)
