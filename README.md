# VigasocoSDL-AI branch merge-replay-ng

Intento de juntar la rama AbadIA-ng con abadIA-REPLAY 
y que en vez de que el modo REPLAY sea un plugin de entrada
que sea parte del API REST que expone el webserver de HTTPInputPlugin

Así, se podría hacer (en un juego recién iniciado)

curl -X POST http://localhost:4477/abadIA/game/current/actions/LEFT
Este giro no se grabaría

curl -X POST http://localhost:4477/abadIA/game/current/recording/
y esto activaría el modo grabación

curl -X POST http://localhost:4477/abadIA/game/current/actions/UP
curl -X POST http://localhost:4477/abadIA/game/current/actions/UP
curl -X POST http://localhost:4477/abadIA/game/current/actions/UP
curl -X POST http://localhost:4477/abadIA/game/current/actions/UP
curl -X POST http://localhost:4477/abadIA/game/current/actions/UP
curl -X POST http://localhost:4477/abadIA/game/current/actions/UP

Estos 3 pasos (6 UP) se grabarían

 curl -X GET http://localhost:4477/abadIA/game/current/recording/current
Esto recuperaría la grabación actual y nos devolvería
{"acciones":[{"comando":"UP","data":""},{"comando":"UP","data":""},{"comando":"UP","data":""},{"comando":"UP","data":""},{"comando":"UP","data":""},{"comando":"UP","data":""}]}


Para reproducir de nuevo los pasos
 curl -H "Content-Type: application/json" -X POST http://localhost:4477/abadIA/game -d '{"acciones":[{"comando":"UP","data":""},{"comando":"UP","data":""},{"comando":"UP","data":""},{"comando":"UP","data":""},{"comando":"UP","data":""},{"comando":"UP","data":""}]}'

Quedaría pendiente exponer una mayor interfaz de control para la reproducción y poder rebobinar y retroceder pasos



pero el modo REPLAY en el juego cada vez tiene menos sentido. 
Si el agente externo va guardando los comandos que envía y además va guardando un SAVE de la partida, si quiere reproducir no tiene más que enviar de nuevo los comandos y si quiere volver atrás, pues simplemente hace LOAD del paso que quiera. 
