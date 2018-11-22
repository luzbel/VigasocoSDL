# ejecutar con -Dinterfaz=websocket o -Dinterfaz=http segun la interfaz a probar

Feature: Resolver abadIA
# es un escenario simple en el que se acaba la partida al pasar a la segunda pantalla 

# TODO: Scenario resolver abadIA con todos los pasos seguidos
# sin ir grabando y cargando checkpoints
#  Scenario: Resolver abadIA

  Scenario: Llegar a la celda
	Given una partida recien iniciada
	When giro a la izquierda
# TODO: revisar por que si añado aqui un "grabo la partida"
# este escenario falla ya que al final la lista de frases
# no tiene 4 elementos
# ¿grabar altera la lista de frases?
# ¿es por las frases de "grabar s:n"?
	And avanzo "19" pasos
	And espero "101" iteraciones 
	And avanzo "10" pasos
	And no hago nada
	And giro a la derecha
	And avanzo "27" pasos
	And no hago nada
	And giro a la izquierda
	And avanzo "66" pasos
	And no hago nada
	And giro a la derecha
	And avanzo "30" pasos
	And no hago nada
	And giro a la izquierda
	And avanzo "17" pasos
	And espero "10" iteraciones 
	And avanzo "10" pasos
	And no hago nada
	And giro a la derecha
	And avanzo "4" pasos
	And no hago nada
	And giro a la izquierda
	And avanzo "7" pasos
	And no hago nada
	And giro a la izquierda
	And avanzo "5" pasos
	And no hago nada
	And giro a la derecha
	And avanzo "2" pasos
	And no hago nada
	And giro a la izquierda
	And avanzo "25" pasos
	And no hago nada
	And giro a la derecha
	And avanzo "10" pasos
	And no hago nada
	And giro a la izquierda
	And espero "2" iteraciones
# checkpoint: llegar a la celda
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
	And espero "3" iteraciones
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la derecha
	And avanzo "9" pasos
# TODO: añadir tests probando los sonidos de la puerta
# TODO: uhm, ver por que se queda con un paso a medias
# y hay que hacer este NOP para que pueda girar 
	And no hago nada
	And giro a la izquierda
	And avanzo "16" pasos
	And giro a la derecha
	And avanzo "12" pasos
	And giro a la izquierda
#	And avanzo "18" pasos
	And avanzo "17" pasos
	And giro a la derecha
# TODO: quedarse en mala posición y comprobar 
# que nos sueltan la frase para ocupar nuestro sitio
# y nos quitan obsequium
	#And avanzo "8" pasos
	And avanzo "9" pasos
	And giro a la derecha
	And espero "70" iteraciones
# fuerzo un dump para que se limpie la lista de sonidos
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     34      |        0     |     31    |    0   |      0     |
	And no hago nada
# cambia el momento del dia y avanza el porcentaje
# TODO: reaprovechar estos pasos para probar estas cosas
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      5     |     34      |        0     |     31    |    0   |      5     |
	And la lista de "sonidos" tiene "12" elementos
# debe estar activo el 2, campanas
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
# la frase de Adso de "Debemos ir a misa"
        And la lista de "frases" tiene "1" elementos
        And los elementos de la lista de "frases" son:
         | id |
         | 11 |
# probar que la camara se va a otro monje por estar parados
# esto segun @eduriol deberia ser otro test separado 
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
	# Suena la música de fondo (sonido número 8)
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
	# Esperar a que Malaquias llegue a la cocina
	# y la camara vuelva a Guillermo
	# TODO: Escribir otro test donde al 
	# moverse durante la espera la camara vuelva
	# a enfocar a Guillermo
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
	# OREMOS
        And los elementos de la lista de "frases" son:
         | id |
         | 23 |
	And la lista de "sonidos" tiene "12" elementos
	# debe estar activo el 2, campanas
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
	And espero "18" iteraciones
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "22" pasos
	And giro a la izquierda
	And avanzo "15" pasos
	And giro a la derecha
	And avanzo "8" pasos
#TODO: Otra opertunidad de probar
# que salen las puertas en el dump
# y de probar si puede entrar o salir
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And espero "92" iteraciones
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  2  |   False     |         False         |      0     |     62      |        0     |     31    |    0   |      7     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |    2   |  0 | Guillermo |    32            |      1      |  169 |   27 |
         |    2   |  1 |  Adso     |     0            |      3      |  169 |   25 |
# Adso nos pregunta si dormimos
	And digo que NO 
# esperamos muchos para comprobar que Adso se espera
	And espero "500" iteraciones
# salimos y volvemos a entrar a la celda
	And giro a la izquierda
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la izquierda
	And giro a la izquierda
	And avanzo "9" pasos
	And espero "33" iteraciones
# Adso nos pregunta si dormimos
	And digo que SI
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
# TODO: Falta comprobar que Guillermo ya no tiene las gafas
	And giro a la izquierda
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la derecha
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "15" pasos
	And giro a la derecha
	And avanzo "15" pasos
	And giro a la izquierda
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la derecha
# espero a que acabe la misa y me suelten que no se puede entrar en la biblioteca
	And espero "337" iteraciones 
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "63" pasos
	And giro a la derecha
	And avanzo "24" pasos
	And giro a la derecha
	And avanzo "17" pasos
	And giro a la izquierda
	And avanzo "33" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "26" pasos
	And giro a la derecha
	And avanzo "19" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "25" pasos
	And giro a la derecha
	And avanzo "11" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la izquierda
	And avanzo "45" pasos
	And giro a la derecha
	And avanzo "12" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "4" pasos
# espero mientras me dicen que no puedo entrar en la biblioteca
	And espero "140" iteraciones 
# voy a que me enseñen el scriptorium
	And doy media vuelta
# TODO: revisar, tengo que mandar un UP suelto porque Adso está delante
# y se quedaría con un número impar de pasos y con el avance a medias
# y no podría girar
	And mando el comando "UP"
	And avanzo "15" pasos
	And giro a la izquierda
	And avanzo "41" pasos
	And giro a la izquierda
	And avanzo "14" pasos
	And espero "65" iteraciones 
	And grabo la partida

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
	And giro a la derecha
	And avanzo "2" pasos
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  2  |   False     |         False         |      2     |     64      |        0     |     31    |    1   |      9     |
        And la lista de "Personajes" tiene "3" elementos
# Guillermo tiene el libro
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre     |     objetos      | orientacion | posX | posY |
         |   15   |  0 | Guillermo  |       128        |      3      |   52 |   92 |
         |   15   |  1 |  Adso      |        0         |      0      |   52 |   89 |
	 |   15   |  4 | Berengario | __DO_NOT_CHECK__ |      2      |   61 |   92 |  
# el pergamino
# aunque Guillermo tiene ya el libro, en el dump sigue??
# TODO: verificar posicion
        And la lista de "Objetos" tiene "2" elementos
	And no hago nada
# despues de esperar un ciclo el libro ya no aparece en Objetos
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  2  |   False     |         False         |      2     |     64      |        0     |     31    |    1   |      9     |
        And la lista de "Personajes" tiene "3" elementos
# Adso se ha girado
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre     |     objetos      | orientacion | posX | posY |
         |   15   |  0 | Guillermo  |       128        |      3      |   52 |   92 |
         |   15   |  1 |  Adso      |        0         |      3      |   52 |   89 |
	 |   15   |  4 | Berengario | __DO_NOT_CHECK__ |      2      |   61 |   92 |  
# el pergamino solo
# TODO: verificar posicion
        And la lista de "Objetos" tiene "1" elementos
	And espero "270" iteraciones 
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  2  |    True     |         False         |      2     |     64      |        0     |     31    |    1   |      9     |
	And espero "58" iteraciones 
# TODO: pensar que hacer
# aqui si pulsa espacio se va a iniciar una nueva partida
# pero si ejecuta un DUMP acto seguido sigue el haFracasado
# igual es mejor salir una vez que le han matado ???

#TODO: tambien seria interesante que en la interfaz REST
#se indicasen solo las acciones posibles
#en esta situacion, por ejemplo, solo pulsar espacio
#igual con un setProperty al HTTPInputPlugin
#el plugin deberia validar que llegan acciones validas
# para el motor y evitar , por ejemplo, que aquí alguien
# le de a cargar y le devuelva que OK pero no cargue

#actualmente funciona como cuando juega con un humano
#al terminar la partida empieza otra
	And pulso espacio
	And espero "1" iteraciones 
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
	And giro a la derecha
	And giro a la derecha
# esto es por estar Adso tapando
# ver si con avanzo se resuelve
	And mando el comando "UP"
	And mando el comando "UP"
	And mando el comando "UP"
	And mando el comando "UP"
	And avanzo "15" pasos
	And giro a la izquierda
	And avanzo "11" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "11" pasos
	And giro a la izquierda
	And avanzo "24" pasos
	And giro a la izquierda
	And avanzo "15" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "36" pasos
	And giro a la derecha
	And avanzo "19" pasos
	And giro a la izquierda
	And espero "1810" iteraciones
	And grabo la partida 
# en el siguiente nop se pasa ya a NONA

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
	And giro a la izquierda
	And mando el comando "UP"
	And avanzo "19" pasos
	And giro a la izquierda
	And avanzo "44" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "24" pasos
	And giro a la derecha
	And avanzo "11" pasos
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la izquierda
	And avanzo "45" pasos
	And giro a la derecha
	And avanzo "13" pasos
# a partir de aqui intentar robar la llave
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And giro a la derecha
	And Adso avanza "19" pasos
	And giro a la izquierda
	And giro a la izquierda
	And Adso avanza "21" pasos
	And giro a la derecha
	And Adso avanza "22" pasos
	And giro a la derecha
	And Adso avanza "19" pasos
	And giro a la derecha
	And Adso avanza "8" pasos
	And giro a la derecha
	And Adso avanza "3" pasos
# tenemos la llave
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  2  |   False     |         False         |      4     |     71      |        0     |     31    |    1   |     11     |
        And la lista de "Personajes" tiene "3" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |   13   |  0 | Guillermo |     0            |      1      |   51 |   61 |
         |   15   |  1 |  Adso     |     2            |      1      |   53 |   55 |
	 |   15   |  2 | Malaquias | __DO_NOT_CHECK__ |      3      |   55 |   55 |  
# aun sigue apareciendo la llave en pantalla
        And la lista de "Objetos" tiene "1" elementos
	And grabo la partida 

# despues de robar la llave usamos el pasadizo de la cocina
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
	And giro a la izquierda
	And avanzo "8" pasos
	And giro a la derecha
	And avanzo "24" pasos
	And giro a la izquierda
	And avanzo "14" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "13" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "8" pasos
	And giro a la derecha
	And avanzo "19" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And giro a la izquierda
	And avanzo "19" pasos
	And giro a la derecha
	And avanzo "25" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "1" pasos
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "2" pasos
	And giro a la derecha
	And avanzo "20" pasos
	And giro a la derecha
	And avanzo "13" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la derecha
	And Adso avanza "14" pasos
	And giro a la izquierda
	And Adso avanza "12" pasos
	And giro a la derecha
	And mando el comando "UP"
	And avanzo "34" pasos
	And giro a la derecha
	And avanzo "17" pasos
	And giro a la derecha
#	And grabo la partida 

#14adso 



#	And giro a la izquierda
#	And avanzo "10" pasos












