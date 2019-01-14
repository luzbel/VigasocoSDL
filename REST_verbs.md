# REST verbs for the new engine

##

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