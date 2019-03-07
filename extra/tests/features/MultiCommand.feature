#TODO: Estos tests aun no se completan

#TODO: falta multiplicar por DOS los repeat de los UP

Feature: Resolver abadIA






  Scenario: Llegar a la celda
	Given una partida recien iniciada
	When mando los comandos:
"""
[
{ "command":"LEFT" },





{ "command":"UP" , "repeat":38},
{ "command":"NOP" , "repeat":101},
{ "command":"UP" , "repeat":20},
{"command":"NOP"},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":54},
{"command":"NOP"},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":132},
{"command":"NOP"},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":60},
{"command":"NOP"},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":34},
{ "command":"NOP" , "repeat":10},
{ "command":"UP" , "repeat":20},
{"command":"NOP"},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":8},
{"command":"NOP"},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":14},
{"command":"NOP"},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},
{"command":"NOP"},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":4},
{"command":"NOP"},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":50},
{"command":"NOP"},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":20},
{"command":"NOP"},
{ "command":"LEFT" },
{ "command":"NOP" , "repeat":2} 
]
"""

	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     55      |        0     |     31    |    0   |      0     |
        And la lista de "Personajes" tiene "3" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |    2   |  0 | Guillermo |    32            |      2      |  169 |   33 |
         |    2   |  1 |  Adso     |     0            |      1      |  169 |   35 |
	 |    2   |  3 |  Abad     | __DO_NOT_CHECK__ |      0      |  165 |   33 |  
        And la lista de "Objetos" tiene "0" elementos
        And la lista de "frases" tiene "4" elementos
        And los elementos de la lista de "frases" son:
         | id |
         |  7 |
         |  3 |
         |  2 |
         |  1 |
	And grabo la partida


  Scenario: Primera misa
	Given una conexion a la interfaz
	When cargo una partida:
"""
1// dia
4// momentoDia
0// duracionMomentoDia
4// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
0// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
1// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
1// hayMovimiento
2// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
1// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
1// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
2// orientacion
169// posX
33// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
32// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
169// posX
35// posY
2// altura
0// estado
1// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
0// objetos
3// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
-1// aDondeVa
-1// aDondeHaLlegado
0// oldEstado
0// movimientosFrustados
0// cntParaDormir
// MALAQUIAS
1// orientacion
55// posX
56// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// estaMuerto
0// estado2
0// contadorEnScriptorium
// ABAD
0// orientacion
165// posX
33// posY
2// altura
4// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
5// aDondeHaLlegado
0// contador
0// numFrase
0// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
2// orientacion
61// posX
92// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// encapuchado
0// estado2
1// estaVivo
0// contadorPergamino
// SEVERINO
3// orientacion
109// posX
118// posY
0// altura
0// estado
1// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
3// aDondeVa
2// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
1// orientacion
52// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 7
0// orientacion
8// posX
8// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""	
	And mando los comandos:
"""
[
{ "command":"NOP" , "repeat":3},
{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":18},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":18},



{"command":"NOP"},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":32},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":24},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },



{ "command":"UP" , "repeat":18},
{ "command":"RIGHT" },
{ "command":"NOP" , "repeat":70}
]
"""
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     34      |        0     |     31    |    0   |      0     |
	And no hago nada


       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      5     |     34      |        0     |     31    |    0   |      5     |
	And la lista de "sonidos" tiene "12" elementos

        And los elementos de la lista de "sonidos" son:
	| sonando |
	|     0   |
	|     0   |
	|     1   |
	|     0   |
	|     0   |
	|     0   |
	|     0   |
	|     0   |
	|     0   |
	|     0   |
	|     0   |
	|     0   |

        And la lista de "frases" tiene "1" elementos
        And los elementos de la lista de "frases" son:
         | id |
         | 11 |

	# no entiendo este NOP, en ResolverAbadIA son 48 NOPs
	#And no hago nada # 
	And espero "48" iteraciones
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      5     |     34      |        0     |     31    |    0   |      5     |
        And la lista de "Personajes" tiene "3" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |    2   |  0 | Guillermo |    32            |      1      |  132 |   75 |
         |    2   |  1 |  Adso     |     0            |      1      |  132 |   78 |
	 |    2   |  5 | Severino  | __DO_NOT_CHECK__ |      3      |  140 |   75 |  
	And la lista de "Objetos" tiene "0" elementos
	And la lista de "frases" tiene "0" elementos
	And la lista de "sonidos" tiene "12" elementos
        And los elementos de la lista de "sonidos" son:
	 | sonando |
	 |     0   |
	 |     0   |
	 |     0   |
	 |     0   |
	 |     0   |
	 |     0   |
	 |     0   |
	 |     0   |
	 |     0   |
	 |     0   |
	 |     0   |
	 |     0   |
	And no hago nada
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      5     |     71      |        0     |     31    |    1   |      5     |
	And la lista de "Personajes" tiene "1" elementos
	And los valores de los "Personajes" son correctos:
		| altura | id | nombre    | objetos          | orientacion | posX | posY |
		|   15   |  2 | Malaquias | __DO_NOT_CHECK__ |      2      |  49  |   50 |
	And la lista de "Objetos" tiene "0" elementos
	And la lista de "frases" tiene "0" elementos
	And la lista de "sonidos" tiene "12" elementos

	And los elementos de la lista de "sonidos" son:
		| sonando |
		|     0   |
		|     0   |
		|     0   |
		|     0   |
		|     0   |
		|     0   |
		|     0   |
		|     0   |
		|     1   |
		|     0   |
		|     0   |
		|     0   |





	And espero "886" iteraciones
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      5     |      8      |        0     |     31    |    0   |      5     |
	And no hago nada
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      5     |     34      |        0     |     31    |    0   |      5     |
        And la lista de "Personajes" tiene "5" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre     | objetos          | orientacion | posX | posY |
         |    2   |  0 |  Guillermo |    32            |      1      |  132 |   75 |
         |    2   |  1 |    Adso    |     0            |      1      |  132 |   78 |
	 |    4   |  3 |    Abad    | __DO_NOT_CHECK__ |      3      |  136 |   60 |  
	 |    2   |  4 | Berengario | __DO_NOT_CHECK__ |      1      |  140 |   72 |  
	 |    2   |  5 | Severino   | __DO_NOT_CHECK__ |      1      |  140 |   75 |  
	And espero "357" iteraciones
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      5     |     34      |        0     |     31    |    0   |      5     |
        And la lista de "Personajes" tiene "6" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre     | objetos          | orientacion | posX | posY |
         |    2   |  0 |  Guillermo |    32            |      1      |  132 |   75 |
         |    2   |  1 |    Adso    |     0            |      1      |  132 |   78 |
	 |    2   |  2 |  Malaquias | __DO_NOT_CHECK__ |      1      |  132 |   72 |  
	 |    4   |  3 |    Abad    | __DO_NOT_CHECK__ |      3      |  136 |   60 |  
	 |    2   |  4 | Berengario | __DO_NOT_CHECK__ |      1      |  140 |   72 |  
	 |    2   |  5 | Severino   | __DO_NOT_CHECK__ |      1      |  140 |   75 |  
        And la lista de "frases" tiene "1" elementos

        And los elementos de la lista de "frases" son:
         | id |
         | 23 |
	And la lista de "sonidos" tiene "12" elementos

        And los elementos de la lista de "sonidos" son:
	| sonando |
	|     0   |
	|     0   |
	|     0   |
	|     0   |
	|     0   |
	|     0   |
	|     0   |
	|     0   |
	|     1   |
	|     0   |
	|     0   |
	|     0   |
	And grabo la partida

  Scenario: Dormir primera noche
	Given una conexion a la interfaz
	When cargo una partida:
"""
1// dia
5// momentoDia
0// duracionMomentoDia
5// oldMomentoDia
1// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
0// bonus
223// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
1// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
108// numeroAleatorio
1// hayMovimiento
357// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
1// esVisible
// SPRITE 3
1// esVisible
// SPRITE 4
1// esVisible
// SPRITE 5
1// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
1// orientacion
132// posX
75// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
32// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
132// posX
78// posY
2// altura
1// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
0// objetos
3// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
0// cntParaDormir
// MALAQUIAS
1// orientacion
132// posX
72// posY
2// altura
7// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
2// objetos
2// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// estaMuerto
0// estado2
0// contadorEnScriptorium
// ABAD
3// orientacion
136// posX
60// posY
4// altura
5// estado
2// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// contador
23// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
1// orientacion
140// posX
72// posY
2// altura
1// estado
2// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// encapuchado
0// estado2
1// estaVivo
0// contadorPergamino
// SEVERINO
1// orientacion
140// posX
75// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
3// orientacion
96// posX
118// posY
0// altura
0// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 6
1// orientacion
96// posX
123// posY
0// altura
0// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// OBJETO 0
1// orientacion
52// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
2// numPersonaje
// OBJETO 7
0// orientacion
8// posX
8// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""
	And mando los comandos:
"""
[
{ "command":"NOP" , "repeat":18},
{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":44},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":30},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":16},



{ "command":"LEFT" },
{ "command":"UP" , "repeat":12},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":18},
{ "command":"NOP" , "repeat":92} 
]
"""
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  2  |   False     |         False         |      0     |     62      |        0     |     31    |    0   |      7     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |    2   |  0 | Guillermo |    32            |      1      |  169 |   27 |
         |    2   |  1 |  Adso     |     0            |      3      |  169 |   25 |
	And mando los comandos:
"""
[
{"command":"NOP"},

{"command":"NO"},

{ "command":"NOP" , "repeat":500},

{ "command":"LEFT" },
{ "command":"LEFT" },
{ "command":"UP" , "repeat":18},
{ "command":"LEFT" },
{ "command":"LEFT" },
{ "command":"UP" , "repeat":18},
{ "command":"NOP" , "repeat":34},

{"command":"SI"}
]
"""
	And grabo la partida

  Scenario: Comienzo segundo dia
	Given una conexion a la interfaz
	When cargo una partida:
"""
2// dia
0// momentoDia
0// duracionMomentoDia
0// oldMomentoDia
1// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
0// bonus
215// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
1// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
1// hayMovimiento
34// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
0// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
1// orientacion
169// posX
28// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
32// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
169// posX
26// posY
2// altura
4// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
0// objetos
3// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
-1// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
0// orientacion
188// posX
24// posY
2// altura
8// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
2// objetos
2// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
7// aDondeVa
7// aDondeHaLlegado
0// estaMuerto
0// estado2
0// contadorEnScriptorium
// ABAD
0// orientacion
84// posX
60// posY
2// altura
12// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
219// contador
23// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
0// orientacion
188// posX
21// posY
2// altura
1// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
3// aDondeVa
3// aDondeHaLlegado
0// encapuchado
0// estado2
1// estaVivo
0// contadorPergamino
// SEVERINO
0// orientacion
104// posX
85// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
3// orientacion
96// posX
118// posY
0// altura
0// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 6
1// orientacion
96// posX
123// posY
0// altura
0// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// OBJETO 0
1// orientacion
52// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
2// numPersonaje
// OBJETO 7
0// orientacion
8// posX
8// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""
	And espero "16" iteraciones
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  2  |   False     |         False         |      1     |     62      |        0     |     31    |    0   |      8     |

	And mando los comandos:
"""
[
{ "command":"LEFT" },
{ "command":"LEFT" },
{ "command":"UP" , "repeat":18},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":14},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":30},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":30},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":16},
{ "command":"RIGHT" },

{ "command":"NOP" , "repeat":337},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":8},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":126},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":48},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":34},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":66},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":52},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":38},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":14},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":50},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":22},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":8},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":16},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":90},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":24},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":12},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":8},

{ "command":"NOP" , "repeat":140},

{ "command":"RIGHT" },
{ "command":"RIGHT" },
{ "command":"UP" },
{ "command":"UP" , "repeat":30},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":82},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":28},
{ "command":"NOP" , "repeat":65}
]
"""
	And grabo la partida

Scenario: XXX
	Given una conexion a la interfaz
	When cargo una partida:
"""
2// dia
2// momentoDia
94// duracionMomentoDia
2// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
0// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
1// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
1// hayMovimiento
65// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
0// esVisible
// SPRITE 4
1// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
1// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
1// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
0// orientacion
52// posX
90// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
0// orientacion
50// posX
89// posY
15// altura
1// estado
2// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
0// objetos
3// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
-1// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
55// posX
56// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
0// orientacion
176// posX
55// posY
2// altura
16// estado
3// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
4// aDondeVa
2// aDondeHaLlegado
0// contador
22// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
2// orientacion
61// posX
92// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// encapuchado
24// estado2
1// estaVivo
0// contadorPergamino
// SEVERINO
1// orientacion
132// posX
77// posY
2// altura
6// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
3// aDondeVa
2// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
1// orientacion
52// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 7
0// orientacion
8// posX
8// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""

Scenario: Morir al coger el libro sin guantes en el scriptorium
	Given una conexion a la interfaz
	When cargo una partida:
"""
2// dia
2// momentoDia
94// duracionMomentoDia
2// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
0// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
1// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
1// hayMovimiento
65// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
0// esVisible
// SPRITE 4
1// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
1// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
1// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
0// orientacion
52// posX
90// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
0// orientacion
50// posX
89// posY
15// altura
1// estado
2// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
0// objetos
3// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
-1// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
55// posX
56// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
0// orientacion
176// posX
55// posY
2// altura
16// estado
3// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
4// aDondeVa
2// aDondeHaLlegado
0// contador
22// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
2// orientacion
61// posX
92// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// encapuchado
24// estado2
1// estaVivo
0// contadorPergamino
// SEVERINO
1// orientacion
132// posX
77// posY
2// altura
6// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
3// aDondeVa
2// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
1// orientacion
52// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 7
0// orientacion
8// posX
8// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""
	# fix: ponía repeat 2, pero es 4 ya que son 2 pasos en ResolverAbadia
	And mando los comandos:
"""
[
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":4}
]
"""
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  2  |   False     |         False         |      2     |     64      |        0     |     31    |    1   |      9     |
        And la lista de "Personajes" tiene "3" elementos

        And los valores de los "Personajes" son correctos:
         | altura | id | nombre     |     objetos      | orientacion | posX | posY |
         |   15   |  0 | Guillermo  |       128        |      3      |   52 |   92 |
         |   15   |  1 |  Adso      |        0         |      0      |   52 |   89 |
	 |   15   |  4 | Berengario | __DO_NOT_CHECK__ |      2      |   61 |   92 |  



#        And la lista de "Objetos" tiene "2" elementos	
#	En la nueva versión la lista de objetos en pantalla se actualiza antes
#	y ya hay solo uno porque lo ha cogido Guillermo
        And la lista de "Objetos" tiene "1" elementos
	And no hago nada

	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  2  |   False     |         False         |      2     |     64      |        0     |     31    |    1   |      9     |
        And la lista de "Personajes" tiene "3" elementos

        And los valores de los "Personajes" son correctos:
         | altura | id | nombre     |     objetos      | orientacion | posX | posY |
         |   15   |  0 | Guillermo  |       128        |      3      |   52 |   92 |
         |   15   |  1 |  Adso      |        0         |      3      |   52 |   89 |
	 |   15   |  4 | Berengario | __DO_NOT_CHECK__ |      2      |   61 |   92 |  


        And la lista de "Objetos" tiene "1" elementos
	And espero "270" iteraciones
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  2  |    True     |         False         |      2     |     64      |        0     |     31    |    1   |      9     |
	And mando los comandos:
"""
[
{ "command":"NOP" , "repeat":58},
{ "command":"SPACE" },
{ "command":"NOP" , "repeat":1}
]
"""
	Then los valores iniciales son correctos:
	| bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
	|   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
	And la lista de "Personajes" tiene "2" elementos
	And los valores de los "Personajes" son correctos:
	| altura | id | nombre    | orientacion | posX | posY |
	|    0   |  0 | Guillermo |       0     |  136 |  168 |
	|    0   |  1 |  Adso     |       1     |  134 |  170 |
	And la lista de "frases" tiene "0" elementos
	And la lista de "Objetos" tiene "0" elementos



Scenario: Ir a comer DIA II
	Given una conexion a la interfaz
	When cargo una partida:
"""
2// dia
2// momentoDia
94// duracionMomentoDia
2// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
0// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
1// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
1// hayMovimiento
65// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
0// esVisible
// SPRITE 4
1// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
1// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
1// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
0// orientacion
52// posX
90// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
0// orientacion
50// posX
89// posY
15// altura
1// estado
2// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
0// objetos
3// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
-1// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
55// posX
56// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
0// orientacion
176// posX
55// posY
2// altura
16// estado
3// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
4// aDondeVa
2// aDondeHaLlegado
0// contador
22// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
2// orientacion
61// posX
92// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// encapuchado
24// estado2
1// estaVivo
0// contadorPergamino
// SEVERINO
1// orientacion
132// posX
77// posY
2// altura
6// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
3// aDondeVa
2// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
1// orientacion
52// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 7
0// orientacion
8// posX
8// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""
	And mando los comandos:
"""
[
{ "command":"RIGHT" },
{ "command":"RIGHT" },


{"command":"UP"},
{"command":"UP"},
{"command":"UP"},
{"command":"UP"},
{ "command":"UP" , "repeat":30},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":22},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":16},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":8},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":14},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":6},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":22},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":48},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":30},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":14},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":72},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":38},
{ "command":"LEFT" },
{ "command":"NOP" , "repeat":1810}
]
"""
	And grabo la partida 


  Scenario: DIA II NONA Conseguir llave
	Given una conexion a la interfaz
	When cargo una partida:
"""
2// dia
3// momentoDia
0// duracionMomentoDia
3// oldMomentoDia
1// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
0// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
1// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
66// numeroAleatorio
1// hayMovimiento
185// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
1// esVisible
// SPRITE 4
1// esVisible
// SPRITE 5
1// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
1// orientacion
56// posX
57// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
52// posX
57// posY
2// altura
7// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
0// objetos
3// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
1// aDondeVa
1// aDondeHaLlegado
7// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
55// posX
56// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
2// orientacion
61// posX
55// posY
2// altura
16// estado
0// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
1// aDondeVa
1// aDondeHaLlegado
0// contador
25// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
3// orientacion
50// posX
53// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
1// aDondeVa
1// aDondeHaLlegado
0// encapuchado
24// estado2
1// estaVivo
0// contadorPergamino
// SEVERINO
3// orientacion
54// posX
53// posY
2// altura
6// estado
2// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
1// aDondeVa
1// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
1// orientacion
52// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 7
0// orientacion
8// posX
8// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""
	And mando los comandos:
"""
[
{ "command":"LEFT" },
{"command":"UP"},
{ "command":"UP" , "repeat":38},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":88},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":12},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":14},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":48},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":22},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":8},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":8},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":16},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":90},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":26},

{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":4},
{ "command":"RIGHT" },
{ "command":"DOWN" , "repeat":19},
{ "command":"LEFT" },
{ "command":"LEFT" },
{ "command":"DOWN" , "repeat":21},
{ "command":"RIGHT" },
{ "command":"DOWN" , "repeat":22},
{ "command":"RIGHT" },
{ "command":"DOWN" , "repeat":19},
{ "command":"RIGHT" },
{ "command":"DOWN" , "repeat":8},
{ "command":"RIGHT" },
{ "command":"DOWN" , "repeat":3}
]
"""

	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  2  |   False     |         False         |      4     |     71      |        0     |     31    |    1   |     11     |
        And la lista de "Personajes" tiene "3" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |   13   |  0 | Guillermo |     0            |      1      |   51 |   61 |
         |   15   |  1 |  Adso     |     2            |      1      |   53 |   55 |
	 |   15   |  2 | Malaquias | __DO_NOT_CHECK__ |      3      |   55 |   55 |  

	# En esta versión la llave ya no aparece en pantalla al recogerla Adso
        #And la lista de "Objetos" tiene "1" elementos
        And la lista de "Objetos" tiene "0" elementos
	And grabo la partida 




  Scenario: DIA II NONA Usar pasadizo
	Given una conexion a la interfaz
	When cargo una partida:
"""
2// dia
4// momentoDia
762// duracionMomentoDia
4// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
0// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
1// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
1// hayMovimiento
3// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
1// esVisible
// SPRITE 3
0// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
1// orientacion
51// posX
61// posY
13// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
53// posX
55// posY
15// altura
7// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
2// objetos
3// mascaraObjetos
16// contadorObjetos
24// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
-1// aDondeVa
1// aDondeHaLlegado
7// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
3// orientacion
55// posX
55// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
1// orientacion
136// posX
102// posY
2// altura
16// estado
3// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
3// aDondeHaLlegado
0// contador
22// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
2// orientacion
61// posX
92// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// encapuchado
24// estado2
1// estaVivo
0// contadorPergamino
// SEVERINO
3// orientacion
104// posX
97// posY
2// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
3// aDondeVa
2// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
1// orientacion
102// posX
95// posY
2// altura
4// identificador
1// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
1// orientacion
52// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
// OBJETO 7
0// orientacion
8// posX
8// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""
#fix: elimino la pausa de 1810 iteraciones que se había quedado de alguna prueba
	And mando los comandos:
"""
[
{ "command":"LEFT" },
{ "command":"UP" , "repeat":16},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":48},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":28},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":6},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":8},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":8},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":4},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":18},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":26},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":18},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":16},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":38},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":4},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":38},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":50},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":6},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":2},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":8},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":18},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":12},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":4},
{ "command":"RIGHT" },

{ "command":"UP" , "repeat":40},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":26},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":8},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":14},
{ "command":"RIGHT" },
{ "command":"DOWN" , "repeat":14},
{ "command":"LEFT" },
{ "command":"DOWN" , "repeat":12},
{ "command":"RIGHT" },
{"command":"UP"},
{ "command":"UP" , "repeat":68},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":26},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":16},
{ "command":"RIGHT" },
{ "command":"NOP" , "repeat":1795},

{ "command":"RIGHT" },
{ "command":"UP" , "repeat":16},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":30},

{ "command":"NOP" , "repeat":3},
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":30},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":30},

{ "command":"NOP" , "repeat":3},
{ "command":"UP" , "repeat":4},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":14},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":14},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":16},
{ "command":"LEFT" },
{ "command":"LEFT" },
{ "command":"NOP" , "repeat":93},
{"command":"NO"}
]
"""
	And grabo la partida 


  Scenario: DIA III NOCHE COGER MANUSCRITO
	Given una conexion a la interfaz
	When cargo una partida:
"""
3// dia
0// momentoDia
0// duracionMomentoDia
0// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
2// bonus
215// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
1// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
81// numeroAleatorio
1// hayMovimiento
39// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
0// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
3// orientacion
169// posX
27// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
3// orientacion
169// posX
25// posY
2// altura
5// estado
2// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
2// objetos
3// mascaraObjetos
0// contadorObjetos
24// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
-1// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
0// orientacion
188// posX
24// posY
2// altura
8// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
2// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
7// aDondeVa
7// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
2// orientacion
151// posX
55// posY
2// altura
10// estado
1// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
6// aDondeHaLlegado
0// contador
23// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
3// orientacion
182// posX
31// posY
2// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
128// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
4// aDondeVa
3// aDondeHaLlegado
1// encapuchado
24// estado2
1// estaVivo
0// contadorPergamino
// SEVERINO
1// orientacion
109// posX
101// posY
0// altura
6// estado
3// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
1// orientacion
183// posX
30// posY
2// altura
2// identificador
1// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
3// orientacion
96// posX
118// posY
0// altura
0// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 6
1// orientacion
96// posX
123// posY
0// altura
0// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// OBJETO 0
1// orientacion
52// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
// OBJETO 7
0// orientacion
8// posX
8// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""
	And mando los comandos:
#fix 9 pasos son 18 UP
"""
[
{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":18}
]
"""


	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   2   |  3  |   False     |         False         |      0     |     56      |        0     |     31    |    0   |     18     |





        And la lista de "Personajes" tiene "4" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre      |      objetos     | orientacion | posX | posY |
         |    2   |  0 |  Guillermo  |         0        |      0      |  178 |   33 |
         |    2   |  1 |    Adso     |         2        |      0      |  173 |   33 |
	 |    2   |  2 |  Malaquias  | __DO_NOT_CHECK__ |      0      |  188 |   24 |  
	 |    0   |  4 | Encapuchado | __DO_NOT_CHECK__ |      0      |  189 |   37 |  
	And mando los comandos:
#fix: 24 pasos son 48 UP
"""
[
{ "command":"UP" , "repeat":14},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":28},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":32},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":90},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":32},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":60},


{"command":"UP"},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":14},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":16},
{ "command":"RIGHT" },


{ "command":"UP" , "repeat":26},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":32},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":4},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":12},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":18},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },

{ "command":"UP" , "repeat":10},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":8},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":2},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":6},

{ "command":"LEFT" },
{ "command":"UP" , "repeat":40},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":14},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":108},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":2},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":6},
{ "command":"LEFT" },


{ "command":"UP" , "repeat":40},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":6},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},

{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":24},
{ "command":"RIGHT" },




{ "command":"NOP" , "repeat":2},
{ "command":"UP" , "repeat":28},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":48}
]
"""

	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   3   |  3  |   False     |         False         |      0     |     64      |        0     |     31    |    1   |     22     |
        And la lista de "Objetos" tiene "2" elementos
	And los valores de los "Objetos" son correctos:
	 | altura | id | orientacion | posX | posY |
	 |   19   |  0 |      1      |   52 |   52 |
	 |   19   |  3 |      1      |   54 |   54 |
	And mando los comandos:
"""
[
{ "command":"LEFT" },
{ "command":"UP" , "repeat":2},
{ "command":"LEFT" }
]
"""
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |  4099 |  3  |   False     |         False         |      0     |     64      |        0     |     31    |    1   |     26     |
        And la lista de "Objetos" tiene "0" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre      | objetos          | orientacion | posX | posY |
         |   15   |  0 | Guillermo   |    16            |      0      |   54 |   92 |
         |   15   |  1 |  Adso       |     2            |      3      |   58 |   92 |
	 |   15   |  4 | Encapuchado | __DO_NOT_CHECK__ |      3      |   52 |   92 |  
	And grabo la partida 
	And mando los comandos:
"""
[


{ "command":"UP" , "repeat":48},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":28},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":24},
{ "command":"LEFT" }
]
"""
	

  Scenario: DIA III NOCHE SALIR DEL PASADIZO Y ESPERAR A QUE AMANEZCA
	Given una conexion a la interfaz
	When cargo una partida:
"""
3// dia
0// momentoDia
0// duracionMomentoDia
0// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4099// bonus
215// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
1// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
113// numeroAleatorio
1// hayMovimiento
0// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
0// esVisible
// SPRITE 4
1// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
0// orientacion
54// posX
92// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
16// objetos
252// mascaraObjetos
15// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
3// orientacion
58// posX
92// posY
15// altura
6// estado
1// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
2// objetos
3// mascaraObjetos
0// contadorObjetos
24// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
-1// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
0// orientacion
188// posX
24// posY
2// altura
8// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
2// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
7// aDondeVa
7// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
0// orientacion
84// posX
60// posY
2// altura
12// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
50// contador
23// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
3// orientacion
52// posX
92// posY
15// altura
6// estado
2// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
128// mascaraObjetos
15// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
5// aDondeVa
4// aDondeHaLlegado
1// encapuchado
24// estado2
1// estaVivo
0// contadorPergamino
// SEVERINO
0// orientacion
104// posX
85// posY
2// altura
6// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
3// orientacion
96// posX
118// posY
0// altura
0// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 6
1// orientacion
96// posX
123// posY
0// altura
0// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// OBJETO 0
1// orientacion
52// posX
94// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
4// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
// OBJETO 7
0// orientacion
8// posX
8// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""	
	And no hago nada
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |  4099 |  3  |   False     |         False         |      0     |     64      |        0     |     31    |    1   |     26     |
        And la lista de "Objetos" tiene "0" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre      | objetos          | orientacion | posX | posY |
         |   15   |  0 | Guillermo   |    16            |      0      |   54 |   92 |
         |   15   |  1 |  Adso       |     2            |      2      |   58 |   92 |
	 |   15   |  4 | Encapuchado | __DO_NOT_CHECK__ |      3      |   52 |   92 |  
	And mando los comandos:
"""
[
{ "command":"LEFT" },
{ "command":"UP" , "repeat":2},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":48},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":28},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":24},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },

{ "command":"UP" , "repeat":40},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":2},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":108},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":14},
{ "command":"RIGHT" },

{ "command":"UP" , "repeat":40},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":6},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":2},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":8},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":18},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":12},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":4},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":32},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":26},
{ "command":"LEFT" },




{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":14},
{ "command":"RIGHT" },
{ "command":"NOP" , "repeat":98},










{ "command":"UP" , "repeat":16},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":20},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":4},
{ "command":"NOP" , "repeat":424},
{ "command":"RIGHT" },
{ "command":"RIGHT" },
{ "command":"NOP" , "repeat":1},
{ "command":"UP" , "repeat":4},
{ "command":"RIGHT" },

{ "command":"UP" , "repeat":22},
{ "command":"LEFT" },
{ "command":"NOP" , "repeat":2},
{ "command":"UP" , "repeat":42},
{ "command":"RIGHT" },
{ "command":"NOP" , "repeat":3},
{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},

{ "command":"NOP" , "repeat":6},
{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },

{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":16},
{ "command":"RIGHT" },

{ "command":"NOP" , "repeat":126},

{ "command":"NOP" , "repeat":91},

{ "command":"NOP" , "repeat":9},
{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },


{ "command":"NOP" , "repeat":88}
]
"""
	And grabo la partida 


Scenario: DIA III TERCIA CONOCER A JORGE
	Given una conexion a la interfaz
	When cargo una partida:
"""
3// dia
2// momentoDia
1149// duracionMomentoDia
2// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4099// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
0// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
1// hayMovimiento
88// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
1// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
0// orientacion
132// posX
57// posY
4// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
16// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
132// posX
59// posY
4// altura
1// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
2// objetos
3// mascaraObjetos
0// contadorObjetos
24// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
-1// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
3// orientacion
135// posX
130// posY
2// altura
10// estado
1// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
2// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
0// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
0// orientacion
136// posX
57// posY
4// altura
16// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
7// aDondeVa
0// aDondeHaLlegado
0// contador
48// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
3// orientacion
0// posX
0// posY
0// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
128// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
5// aDondeVa
5// aDondeHaLlegado
1// encapuchado
24// estado2
0// estaVivo
0// contadorPergamino
// SEVERINO
3// orientacion
137// posX
132// posY
2// altura
6// estado
2// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
2// aDondeVa
0// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
200// posX
36// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
0// orientacion
15// posX
46// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
// OBJETO 7
0// orientacion
90// posX
42// posY
4// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""
	And mando los comandos:
"""
[
{ "command":"NOP" , "repeat":6},
{ "command":"UP" , "repeat":40},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":26},
{ "command":"NOP" , "repeat":4},
{ "command":"UP" , "repeat":4},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":20},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":14},

{ "command":"NOP" , "repeat":2},
{ "command":"UP" , "repeat":4},




{ "command":"RIGHT" },
{ "command":"UP" , "repeat":38},
{ "command":"NOP" , "repeat":4},
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":30},



{ "command":"NOP" , "repeat":268}
]


"""
	And grabo la partida 


Scenario: DIA III SEXTA IR AL REFECTORIO
	Given una conexion a la interfaz
	When cargo una partida:
"""
3// dia
3// momentoDia
0// duracionMomentoDia
3// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4099// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
0// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
1// hayMovimiento
1// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
1// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
1// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
0// orientacion
200// posX
40// posY
0// altura
0// estado
2// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
0// orientacion
198// posX
39// posY
0// altura
7// estado
2// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
2// objetos
3// mascaraObjetos
0// contadorObjetos
24// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
1// aDondeVa
0// aDondeHaLlegado
7// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
76// posX
75// posY
15// altura
10// estado
3// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
2// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
0// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
3// orientacion
201// posX
38// posY
0// altura
16// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
16// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
1// aDondeVa
0// aDondeHaLlegado
0// contador
25// numFrase
0// guillermoBienColocado
1// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
3// orientacion
0// posX
0// posY
0// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
128// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
5// aDondeVa
5// aDondeHaLlegado
1// encapuchado
24// estado2
0// estaVivo
0// contadorPergamino
// SEVERINO
1// orientacion
135// posX
83// posY
2// altura
6// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
1// aDondeVa
2// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
200// posX
36// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
0// orientacion
15// posX
46// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
3// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
// OBJETO 7
0// orientacion
90// posX
42// posY
4// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""
	And mando los comandos:
"""
[
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":54},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":70},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":138},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":106},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":32},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":68},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":2},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":48},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":38},


{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":18},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":18},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":64},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":12},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },
{ "command":"NOP" , "repeat":132}
]
"""
	And grabo la partida 
	

Scenario: DIA III NONA COGER LAMPARA COCINA
	Given una conexion a la interfaz
	When cargo una partida:
"""
3// dia
4// momentoDia
1280// duracionMomentoDia
4// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4099// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
0// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
81// numeroAleatorio
1// hayMovimiento
1// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
1// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
1// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
1// orientacion
56// posX
57// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
0// orientacion
52// posX
57// posY
2// altura
7// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
2// objetos
3// mascaraObjetos
0// contadorObjetos
24// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
-1// aDondeVa
1// aDondeHaLlegado
7// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
55// posX
56// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
2// orientacion
61// posX
55// posY
2// altura
16// estado
0// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
16// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
1// aDondeHaLlegado
0// contador
48// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
3// orientacion
0// posX
0// posY
0// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
128// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
5// aDondeVa
5// aDondeHaLlegado
1// encapuchado
24// estado2
0// estaVivo
0// contadorPergamino
// SEVERINO
3// orientacion
54// posX
53// posY
2// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
2// aDondeVa
1// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
0// orientacion
15// posX
46// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
3// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
// OBJETO 7
0// orientacion
90// posX
42// posY
4// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""
	And mando los comandos:
"""
[
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },

{ "command":"NOP" , "repeat":6},
{ "command":"UP" , "repeat":18},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":8},

{ "command":"NOP" , "repeat":10},
{ "command":"UP" , "repeat":44},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":40},
{ "command":"RIGHT" },
{ "command":"DOWN" , "repeat":16},
{ "command":"LEFT" },
{ "command":"DOWN" , "repeat":8}
]
"""
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |  4099 |  3  |   False     |         False         |      4     |      8      |        0     |     31    |    0   |     30     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       0          |      0      |   89 |   36 |
         |    0   |  1 |  Adso     |       3          |      0      |   88 |   42 |

        And la lista de "Objetos" tiene "0" elementos
	And no hago nada
	And grabo la partida 

Scenario: DIA III NONA DESPUES DE COGER LAMPARA COCINA
	Given una conexion a la interfaz
	When cargo una partida:
"""
3// dia
4// momentoDia
1106// duracionMomentoDia
4// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4099// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
0// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
113// numeroAleatorio
1// hayMovimiento
9// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
0// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
0// orientacion
89// posX
36// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
88// posX
42// posY
0// altura
7// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
3// objetos
3// mascaraObjetos
15// contadorObjetos
24// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
-1// aDondeVa
1// aDondeHaLlegado
7// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
55// posX
56// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
2// orientacion
60// posX
109// posY
2// altura
16// estado
2// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
16// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
1// aDondeHaLlegado
0// contador
48// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
3// orientacion
0// posX
0// posY
0// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
128// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
5// aDondeVa
5// aDondeHaLlegado
1// encapuchado
24// estado2
0// estaVivo
0// contadorPergamino
// SEVERINO
3// orientacion
69// posX
100// posY
2// altura
6// estado
1// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
2// aDondeVa
1// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
0// orientacion
15// posX
46// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
3// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
// OBJETO 7
0// orientacion
90// posX
42// posY
4// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
"""
	And mando los comandos:
"""
[
{"command":"NOP"},
{ "command":"UP" , "repeat":8},




{ "command":"RIGHT" },
{ "command":"UP" , "repeat":6},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":2},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":8},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":18},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":12},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":4},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":32},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":26},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":14},
{ "command":"RIGHT" },



{ "command":"DOWN" , "repeat":15},
{ "command":"LEFT" },
{ "command":"DOWN" , "repeat":7},
{ "command":"RIGHT" },

{ "command":"UP" , "repeat":34},
{ "command":"UP" , "repeat":30},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },

{ "command":"UP" , "repeat":24},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":18},
{ "command":"RIGHT" },





{ "command":"NOP" , "repeat":2206}
]
"""
	And grabo la partida
	
  Scenario: DIA III COMPLETAS
	Given una conexion a la interfaz
	When cargo una partida:
"""
3// dia
6// momentoDia
0// duracionMomentoDia
6// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4099// bonus
223// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
0// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
1// pergaminoGuardado
108// numeroAleatorio
1// hayMovimiento
1// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
1// esVisible
// SPRITE 3
1// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
1// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
1// orientacion
132// posX
75// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
132// posX
78// posY
2// altura
6// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
3// objetos
3// mascaraObjetos
0// contadorObjetos
24// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
2// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
132// posX
72// posY
2// altura
8// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
2// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
7// aDondeVa
0// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
3// orientacion
136// posX
60// posY
4// altura
6// estado
2// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// contador
23// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
3// orientacion
0// posX
0// posY
0// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
128// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
5// aDondeVa
5// aDondeHaLlegado
1// encapuchado
24// estado2
0// estaVivo
0// contadorPergamino
// SEVERINO
1// orientacion
140// posX
75// posY
2// altura
6// estado
2// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
3// orientacion
96// posX
118// posY
0// altura
0// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 6
1// orientacion
96// posX
123// posY
0// altura
0// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// OBJETO 0
0// orientacion
15// posX
46// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
84// posX
60// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
// OBJETO 7
0// orientacion
90// posX
42// posY
4// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
"""
	And mando los comandos:
"""
[

{ "command":"NOP" , "repeat":18},
{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":44},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":30},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":16},



{ "command":"LEFT" },
{ "command":"UP" , "repeat":12},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":18},
{ "command":"NOP" , "repeat":92},
{ "command":"NOP" , "repeat":75},









{"command":"SI"},
{"command":"NOP"}
]
"""
	And grabo la partida

  Scenario: DIA IV PRIMA
	Given una conexion a la interfaz
	When cargo una partida:
"""
4// dia
1// momentoDia
0// duracionMomentoDia
1// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4099// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
0// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
1// pergaminoGuardado
81// numeroAleatorio
1// hayMovimiento
1// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
0// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
1// orientacion
169// posX
27// posY
2// altura
0// estado
2// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
3// orientacion
169// posX
25// posY
2// altura
1// estado
2// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
3// objetos
3// mascaraObjetos
0// contadorObjetos
24// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
0// orientacion
188// posX
24// posY
2// altura
9// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
2// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
7// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
2// orientacion
151// posX
55// posY
2// altura
14// estado
2// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
6// aDondeHaLlegado
0// contador
26// numFrase
0// guillermoBienColocado
7// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
3// orientacion
0// posX
0// posY
0// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
128// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
5// aDondeVa
5// aDondeHaLlegado
1// encapuchado
24// estado2
0// estaVivo
0// contadorPergamino
// SEVERINO
1// orientacion
109// posX
107// posY
0// altura
6// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
0// aDondeVa
2// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
0// orientacion
15// posX
46// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
84// posX
60// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
// OBJETO 7
0// orientacion
90// posX
42// posY
4// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
"""
	And mando los comandos:
"""
[
{ "command":"RIGHT" },
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":12},
{ "command":"RIGHT" },


{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":18},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":18},




{ "command":"LEFT" },



{ "command":"UP" , "repeat":30},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":24},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":18},
{ "command":"RIGHT" },



{ "command":"NOP" , "repeat":111}
]
"""
	And grabo la partida





  Scenario: DIA IV TERCIA
	Given una conexion a la interfaz
	When cargo una partida:
"""
4// dia
1// momentoDia
0// duracionMomentoDia
1// oldMomentoDia
1// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4099// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
0// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
1// pergaminoGuardado
108// numeroAleatorio
1// hayMovimiento
111// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
1// esVisible
// SPRITE 3
1// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
1// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
1// orientacion
132// posX
75// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
132// posX
78// posY
2// altura
1// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
3// objetos
3// mascaraObjetos
0// contadorObjetos
24// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
132// posX
72// posY
2// altura
9// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
2// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
3// orientacion
136// posX
60// posY
4// altura
14// estado
2// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// contador
26// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
3// orientacion
0// posX
0// posY
0// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
128// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
5// aDondeVa
5// aDondeHaLlegado
1// encapuchado
24// estado2
0// estaVivo
0// contadorPergamino
// SEVERINO
1// orientacion
140// posX
75// posY
2// altura
6// estado
2// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
0// orientacion
15// posX
46// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
84// posX
60// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
// OBJETO 7
0// orientacion
90// posX
42// posY
4// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
"""
	And mando los comandos:
"""
[




{ "command":"NOP" , "repeat":114},



{ "command":"RIGHT" },
{ "command":"UP" , "repeat":8},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":128},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":54},
{ "command":"RIGHT" },


{ "command":"UP" , "repeat":34},
{ "command":"LEFT" },


{ "command":"UP" , "repeat":68},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":2},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":48},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":38},


{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":18},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":18},




{ "command":"UP" , "repeat":20},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":64},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":12},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },













{ "command":"NOP" , "repeat":978}
]
"""
	And grabo la partida 

  Scenario: DIA IV NONA
	Given una conexion a la interfaz
	When cargo una partida:
"""
4// dia
3// momentoDia
0// duracionMomentoDia
3// oldMomentoDia
1// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4099// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
0// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
1// pergaminoGuardado
119// numeroAleatorio
1// hayMovimiento
38// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
1// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
1// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
1// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
1// orientacion
56// posX
57// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
52// posX
57// posY
2// altura
7// estado
2// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
3// objetos
3// mascaraObjetos
0// contadorObjetos
24// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
1// aDondeVa
1// aDondeHaLlegado
7// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
55// posX
56// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
2// orientacion
61// posX
55// posY
2// altura
16// estado
0// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
1// aDondeVa
1// aDondeHaLlegado
0// contador
25// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
3// orientacion
0// posX
0// posY
0// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
128// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
5// aDondeVa
5// aDondeHaLlegado
1// encapuchado
24// estado2
0// estaVivo
0// contadorPergamino
// SEVERINO
3// orientacion
54// posX
53// posY
2// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
1// aDondeVa
1// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
50// posX
53// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
1// aDondeVa
1// aDondeHaLlegado
1// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
0// orientacion
15// posX
46// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
84// posX
60// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
// OBJETO 7
0// orientacion
90// posX
42// posY
4// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
"""
	And mando los comandos:
"""
[




{ "command":"LEFT" },
{"command":"UP"},
{ "command":"UP" , "repeat":38},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":88},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":20},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":36},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":90},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":2},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":22},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":32},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":60},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":126},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":6},
{ "command":"RIGHT" },



{ "command":"NOP" , "repeat":2062}
]
"""
	And grabo la partida


  Scenario: DIA IV VISPERAS
	Given una conexion a la interfaz
	When cargo una partida:
"""
4// dia
6// momentoDia
0// duracionMomentoDia
6// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4099// bonus
223// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
0// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
1// pergaminoGuardado
108// numeroAleatorio
1// hayMovimiento
1// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
1// esVisible
// SPRITE 3
1// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
1// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
1// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
1// orientacion
132// posX
75// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
132// posX
78// posY
2// altura
6// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
3// objetos
3// mascaraObjetos
0// contadorObjetos
24// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
2// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
132// posX
72// posY
2// altura
8// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
2// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
7// aDondeVa
0// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
3// orientacion
136// posX
60// posY
4// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// contador
23// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
3// orientacion
0// posX
0// posY
0// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
128// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
5// aDondeVa
5// aDondeHaLlegado
1// encapuchado
24// estado2
0// estaVivo
0// contadorPergamino
// SEVERINO
1// orientacion
140// posX
75// posY
2// altura
6// estado
2// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
1// orientacion
140// posX
72// posY
2// altura
20// estado
2// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
3// aDondeVa
0// aDondeHaLlegado
1// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
3// orientacion
96// posX
118// posY
0// altura
0// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 6
1// orientacion
96// posX
123// posY
0// altura
0// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// OBJETO 0
0// orientacion
15// posX
46// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
84// posX
60// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
// OBJETO 7
0// orientacion
90// posX
42// posY
4// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
"""
	And mando los comandos:
"""
[

{ "command":"NOP" , "repeat":8},
{ "command":"UP" , "repeat":34},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":46},
{ "command":"LEFT" },



{ "command":"UP" , "repeat":30},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":8},
{ "command":"UP" , "repeat":10},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":12},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":12},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":18},
{ "command":"LEFT" },
{ "command":"LEFT" },
{ "command":"NOP" , "repeat":82},
{"command":"NO"}
]
"""
	And grabo la partida

  Scenario: DIA V NOCHE CONSEGUIR LLAVE ABAD
	Given una conexion a la interfaz
	When cargo una partida:
"""

5// dia
0// momentoDia
3802// duracionMomentoDia
0// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4099// bonus
215// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
0// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
1// pergaminoGuardado
81// numeroAleatorio
1// hayMovimiento
39// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
1// esVisible
// SPRITE 3
0// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
3// orientacion
169// posX
27// posY
2// altura
0// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
3// orientacion
169// posX
25// posY
2// altura
5// estado
2// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
3// objetos
3// mascaraObjetos
0// contadorObjetos
24// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
-1// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
0// orientacion
184// posX
25// posY
2// altura
8// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
2// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
7// aDondeVa
0// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
2// orientacion
151// posX
55// posY
2// altura
10// estado
1// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
6// aDondeHaLlegado
41// contador
23// numFrase
1// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
3// orientacion
0// posX
0// posY
0// altura
6// estado
0// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
128// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
5// aDondeVa
5// aDondeHaLlegado
1// encapuchado
24// estado2
0// estaVivo
0// contadorPergamino
// SEVERINO
1// orientacion
109// posX
110// posY
0// altura
6// estado
2// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
188// posX
21// posY
2// altura
20// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
3// aDondeVa
3// aDondeHaLlegado
1// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
3// orientacion
96// posX
118// posY
0// altura
0// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 6
1// orientacion
96// posX
123// posY
0// altura
0// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// OBJETO 0
0// orientacion
15// posX
46// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
27// posX
35// posY
24// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 3
1// orientacion
84// posX
60// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
137// posX
62// posY
8// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
// OBJETO 7
0// orientacion
90// posX
42// posY
4// altura
0// seEstaCogiendo
1// seHaCogido
1// numPersonaje
"""
	And mando los comandos:
"""
[















{ "command":"UP" , "repeat":30},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":60},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":24},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":122},



{ "command":"DOWN" , "repeat":39},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":8},

{ "command":"LEFT" },
{ "command":"LEFT" },
{ "command":"UP" , "repeat":8},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":122},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":24},
{ "command":"LEFT" },
{ "command":"UP" , "repeat":60},
{ "command":"RIGHT" },
{ "command":"UP" , "repeat":30},
{ "command":"RIGHT" },
{ "command":"RIGHT" },
{ "command":"NOP" , "repeat":29},
{"command":"SI"}
]
"""
	And grabo la partida


