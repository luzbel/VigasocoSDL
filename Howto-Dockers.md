# Instrucciones para desarrollar con Dockers (Verano del 2018)

*Este texto proviene de un hilo de Slack y deberíamos actualizarlo

el dockerfile antiguo está en https://github.com/luzbel/VigasocoSDL/blob/pruebasAbadIA/extra/Docker/dev/Dockerfile  . Abro hilo para contarte como genero el docker ahora , si puedes crear el extra/Docker/dev/Dockerfile  para la nueva rama genial
GitHub
luzbel/VigasocoSDL
Temporal workspace for newest version of VigasocoSDL while the full history is recovered - luzbel/VigasocoSDL
 


34 respuestas
VigasocoSDL [hace 2 meses]
Parto de lanzar un contenedor basado en ubuntu:xenial


VigasocoSDL [hace 2 meses]
docker run -ti -p 5900:5900 -p 4477:4477 -p 8182:8182 ubuntu bash


VigasocoSDL [hace 2 meses]
los puertos son los que usan VNC y la interfaz web

VigasocoSDL [hace 2 meses]
dentro de ese bash hago


VigasocoSDL [hace 2 meses]
# apt-get update


VigasocoSDL [hace 2 meses]
# apt-get install -y git vim xvfb make g++ libsdl1.2-dev x11vnc libboost-all-dev virtualenv


VigasocoSDL [hace 2 meses]
# virtualenv -p python3 python3


VigasocoSDL [hace 2 meses]
# source python3/bin/activate


VigasocoSDL [hace 2 meses]
# pip install behave websocket-client requests (editado)


VigasocoSDL [hace 2 meses]
# git clone https://github.com/luzbel/VigasocoSDL.git
GitHub
luzbel/VigasocoSDL
Temporal workspace for newest version of VigasocoSDL while the full history is recovered - luzbel/VigasocoSDL
 


VigasocoSDL [hace 2 meses]
# cd VigasocoSDL/


VigasocoSDL [hace 2 meses]
# git checkout abadIA-timing-by-webserver


VigasocoSDL [hace 2 meses]
# export DISPLAY=:0


VigasocoSDL [hace 2 meses]
# Xvfb -screen 0 800x600x16 &


VigasocoSDL [hace 2 meses]
# x11vnc &


VigasocoSDL [hace 2 meses]
# cat > ~/.vimrc


VigasocoSDL [hace 2 meses]
set fileencodings=utf-8


VigasocoSDL [hace 2 meses]
set encoding=utf-8


VigasocoSDL [hace 2 meses]
[CTRL-D]

VigasocoSDL [hace 2 meses]
Luego salgo del contenedor y hago commit ID-CONTENEDOR abadIA


VigasocoSDL [hace 2 meses]
cuando quiero trabajar pues docker run -ti -p 5900:5900 -p 4477:4477 -p 8182:8182 abadIA bash


VigasocoSDL [hace 2 meses]
y dentro export DISPLAY y arrancar Xvfb y x11vnc

VigasocoSDL [hace 2 meses]
Si compilo VigasocoSDL y lo arranco (no hay que pasar argumentos porque en esa rama ya usa por defecto el NULLAudioPlugin y el HTTPInputPlugin ) lo puedo ver desde cualquier cliente VNC conectando a localhost:5900 (el puerto está mapeado del contenedor al host)

VigasocoSDL [hace 2 meses]
Yo uso https://chrome.google.com/webstore/detail/vnc%C2%AE-viewer-for-google-ch/iabmpiboiopbgfabjmgeedhcmjenhbla?utm_source=chrome-app-launcher-info-dialog
chrome.google.com
VNC® Viewer for Google Chrome™
Connects to your computers anywhere in the world and lets you take control.
 


VigasocoSDL [hace 2 meses]
suelo lanzar VigasocoSDL desde el contenedor y abrir otro bash con docker exec -ti ID-CONTENEDOR bash


VigasocoSDL [hace 2 meses]
los cambios que hago en código suelo hacer push a github


VigasocoSDL [hace 2 meses]
para el resto de cambios, pues como no tengo Dockerfile, hago commit de vez en cuando (si, sé que es mala practica)

VigasocoSDL [hace 2 meses]
ah, y el docker de windows con hyper-v cuando arranca va muy bien (combinado con el ubuntu bash para win es una delicia)

VigasocoSDL [hace 2 meses]
pero cuando le da por no arrancar :triunfo:

cmartinez [hace 2 meses]
No entiendo muy bien lo que dices de "suelo lanzar VigasocoSDL desde el contenedor y abrir otro bash con docker exec -ti ID-CONTENEDOR bash". ¿Abres dos contenedores? ¿Para qué? ¿o no lo estoy entendiendo bien?


cmartinez [hace 2 meses]
Tampoco entiendo muy bien ese funcionamiento con docker, seguro que porque todavía soy muy novato con docker. El dockerfile tiene la ejecución de Vigasoco como último comando. Luego, interactivamente instalas otras cosas y preparas lo que necesitas y haces commit para guardar el estado como nueva imagen, pero entonces cualquier cambio que haces se pierde con cada arranque (imagino que por esos vas haciendo commits). Se me hace muy raro, tal vez por estar acostumbrado a VirtualBox que si mantiene los cambios entre ejecuciones.


cmartinez [hace 2 meses]
Voy a ver si sigo las instrucciones y entiendo un poco como funciona, aunque ya será mañana a primera hora.


cmartinez [hace 2 meses]
Por cierto, ¿y como depuras? No he visto ningún programa auxiliar. ¿Lo haces con gdb?


También se ha enviado al canal
VigasocoSDL [hace 7 horas]
@Juantomas  este es el hilo para que puedas trabajar con docker, al inicio viene el dockerfile antiguo por si quieres adaptarlo
pero es más un contenedor de trabajo, para hacerlo bien , el de compilación, ejecución y el de los tests deberían ser distintos