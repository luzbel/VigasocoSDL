# REST verbs for the new abadia-gym (v2)

## Create/Reset a game

```
curl -X POST localhost:4477/abadIA/game

```

## Dump a game (AbadIA format)

```
curl -X GET   http://localhost:4477/abadIA/game/current \
-H 'accept: text/x.abadIA+plain'
```


## Dump a game (json format)

```
curl -X GET   http://localhost:4477/abadIA/game/current \
 -H 'accept: application/json'
```


## Dump a game (AbadIA format enclosed into a json wrapper) 

```
curl -X GET http://localhost:4477/abadIA/game/current \
 -H 'accept: text/x.abadIA+json
```


## Load a saved game

```
curl -X PUT http://localhost:4477/abadIA/game/current \
		-d '1// dia
4// momentoDia
0// duracionMomentoDia
...
-1// numPersonaje'
```


## End of game

```
curl -X DELETE  http://localhost:4477/abadIA/game/current
```

## Actions
```
curl -X POST http://localhost:4477/abadIA/game/current/actions/NOP
```

NOP
QR
RIGHT
LEFT
UP
DOWN
SPACE
DUMP
RESET
SAVEJSON
SAVE
LOADJSON
LOAD
FIN
END
GAME OVER
GAMEOVER
SI
NO