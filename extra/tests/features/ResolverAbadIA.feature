

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
# TODO: ESTO AHORA FALLA ????
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
###
	And espero "1810" iteraciones
###
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
	# aquí va a la escalera con recoveco
	And avanzo "16" pasos
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
	And avanzo "13" pasos
	And giro a la izquierda
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la derecha
	And espero "1795" iteraciones
# podeis ir a vuestras celdas
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la izquierda
	And avanzo "15" pasos
# hay un señor delante
	And espero "3" iteraciones
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "15" pasos
	And giro a la izquierda
	And avanzo "15" pasos
# hay un señor delante
	And espero "3" iteraciones
	And avanzo "2" pasos
	And giro a la derecha
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "8" pasos
	And giro a la izquierda
	And giro a la izquierda
	And espero "93" iteraciones
	And digo que NO 
	And grabo la partida 

# despues de probar la llave en el pasadizo de la cocina 
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
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	# Aprovecho para comprobar que vemos al encapuchado
	# y no sabemos que monje es
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   2   |  3  |   False     |         False         |      0     |     56      |        0     |     31    |    0   |     18     |
# TODO: Revisar por que es visible Malaquias
# Vale que está en la celda, pero el Sprite no es visible 
# ¿o es visible pero lo tapa la pared?
# TODO: el id 4 del encapuchado puede dar pistas sobre quien es
# aunque no creo que sirva de nada a la IA
        And la lista de "Personajes" tiene "4" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre      |      objetos     | orientacion | posX | posY |
         |    2   |  0 |  Guillermo  |         0        |      0      |  178 |   33 |
         |    2   |  1 |    Adso     |         2        |      0      |  173 |   33 |
	 |    2   |  2 |  Malaquias  | __DO_NOT_CHECK__ |      0      |  188 |   24 |  
	 |    0   |  4 | Encapuchado | __DO_NOT_CHECK__ |      0      |  189 |   37 |  
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "14" pasos
	And giro a la derecha
	And avanzo "16" pasos
	And giro a la derecha
	And avanzo "45" pasos
	And giro a la derecha
	And avanzo "16" pasos
	And giro a la izquierda
	And avanzo "30" pasos
	# para completar la animacion
	# ya que el encapuchado nos ha bloqueado
	And mando el comando "UP"
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la derecha
	# Comienza el recoveco raro 
	# de la escalera del pasadizo
	And avanzo "13" pasos
	And giro a la izquierda
	And avanzo "16" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	# aquí ya salimos a la cocina
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "1" pasos
	And giro a la derecha
	And avanzo "3" pasos
	# esto ya te saca de la cocina
	And giro a la izquierda
	And avanzo "20" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "54" pasos
	And giro a la derecha
	And avanzo "1" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la izquierda
	# el encapuchado me bloquea
	# algunos pasos no avanzan
	And avanzo "20" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	# ya estoy en la planta 1
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "12" pasos
	And giro a la derecha
	# espero para no tropezar con el lento
	# del encapuchado y no poder girar
	# al no dar un numero par de pasos
	# al avanzar
	And espero "2" iteraciones
	And avanzo "14" pasos
	And giro a la izquierda
	And avanzo "24" pasos
	# comprobar que está libro y manuscrito
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   3   |  3  |   False     |         False         |      0     |     64      |        0     |     31    |    1   |     22     |
        And la lista de "Objetos" tiene "2" elementos
	And los valores de los "Objetos" son correctos:
	 | altura | id | orientacion | posX | posY |
	 |   19   |  0 |      1      |   52 |   52 |
	 |   19   |  3 |      1      |   54 |   54 |
	And giro a la izquierda
	And avanzo "1" pasos
	And giro a la izquierda
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

# no puedo repetir los pasos anteriores al reves
# porque Adso se pone enmedio :-@
#	And avanzo "24" pasos
#	And giro a la derecha
##	And avanzo "14" pasos
#	And giro a la izquierda
#	And avanzo "12" pasos
#	And giro a la izquierda
	
# despues de coger el manuscrito
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
	And giro a la izquierda
	And avanzo "1" pasos
	And giro a la derecha
	And avanzo "24" pasos
	And giro a la derecha
	And avanzo "14" pasos
	And giro a la izquierda
	And avanzo "12" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la derecha
	# TODO: pueden ser menos de 20 pasos
	And avanzo "20" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "1" pasos
	And giro a la izquierda
	And avanzo "54" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "7" pasos
	And giro a la derecha
#ultimo paso comprobado , el de 20
	And avanzo "20" pasos
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
	And avanzo "16" pasos
	And giro a la derecha
	And avanzo "13" pasos
	And giro a la izquierda
# en el camino de ida eran 8
# pero prefiero esperar el encapuchado
# y que me abra la puerta en vez de 
# manejar a Adso
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la derecha
	And espero "98" iteraciones 
# muchos no avanzan, nos bloquea el encapuchado
# 	And avanzo "3" pasos
#podría ir a la celda, pero espero en la puerta a
#que sea hora de ir a misa
# uhmmm, no funciona, nos expulsa el abad
# ver vídeo de Manuel Pazos a ver como lo hace él

#	And Adso avanza "14" pasos
#	And giro a la izquierda
#	And Adso avanza "4" pasos
#	And giro a la derecha
# esto provoca un error en la busqueda de caminos
# TODO: aprovechar para depurar
#	And avanzo "4" pasos
# probemos saliendo un poco menos
# y lo que pasa es que el tonto de Adso
# se empeña en ir en esta dirección 
# y no dejarme avanzar
#	And avanzo "3" pasos

#14D , LEFT  , 4D , RIGHT , 8UP


#probemos de otra forma


#	And avanzo "1" pasos
	# en realidad no avanza, se da la vuelta y me deja espacio para avanzar
#	And Adso avanza "5" pasos
#	And avanzo "23" pasos
#	And giro a la derecha
#	And avanzo "14" pasos
#	And giro a la izquierda
#	And avanzo "12" pasos
#	And giro a la izquierda
	


# no consigo que funcione el truco de dejar la puerta del pasadizo abierta
# en vez de ir a la celda o seguir al encapuchado al herbolario
# que son muchos pasos
# voy a probar el truco de quedarse al norte de la iglesiz
# a la izquierda al salir del pasadizo
# que es uno de los trucos del juego
# si te quedas allí pegado a una pared el abad no te expulsa
	And avanzo "8" pasos
	And giro a la izquierda
	And avanzo "10" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And espero "424" iteraciones 
	And giro a la derecha
	And giro a la derecha
	And espero "1" iteraciones 
	And avanzo "2" pasos
	And giro a la derecha
	# en algunos me molesta Adso y no avanzo
	And avanzo "11" pasos
	And giro a la izquierda
	And espero "2" iteraciones 
	And avanzo "21" pasos
	And giro a la derecha
	And espero "3" iteraciones 
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "5" pasos
	#Adso parece un jueves
	And espero "6" iteraciones 
	And avanzo "6" pasos
	And giro a la izquierda
	# a ver si me coloco bien para misa
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la derecha
	# empieza a decir "HERMANOS, BERENGARIO HA DESAPARECIDO..."
	And espero "126" iteraciones 
	# el abad nos llama
	And espero "91" iteraciones
	# espero a que un monje nos deje hueco para pasar
	And espero "9" iteraciones
	And avanzo "17" pasos
	And giro a la derecha
	# espero mientras el abad me dice que
	# vamos a conocer a Jorge
	And espero "88" iteraciones
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
	And espero "6" iteraciones
	And avanzo "20" pasos
	And giro a la izquierda
	And avanzo "13" pasos
	And espero "4" iteraciones
	And avanzo "2" pasos
	And giro a la derecha
	And avanzo "10" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	# el abad me interrumpe
	And espero "2" iteraciones
	And avanzo "2" pasos
# aqui si insisto en avanzar y darme con la pared
# coredump por
# VigasocoSDL: ../core/abadia/BuscadorRutas.cpp:515: int Abadia::BuscadorRutas::compruebaFinCamino(Abadia::PersonajeConIA*, bool): Assertion `noHayError' failed.
#	And avanzo "9" pasos # descomentar para forzar el error y depurar TODO
	And giro a la derecha
	And avanzo "19" pasos
	And espero "4" iteraciones
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "15" pasos
	# ya ha empezado a soltar "VENERABLE JOR..."
# TODO: comprobar que justo aquí al pegarma al Abad
# este me quita el pergamino
	And espero "268" iteraciones
	# el siguiente paso ya cambia a SEXTA y
	# hay que ir al refectorio
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
	And giro a la derecha
	And avanzo "27" pasos
	And giro a la derecha
	And avanzo "35" pasos
	And giro a la izquierda
	And avanzo "69" pasos
	And giro a la derecha
	And avanzo "53" pasos
	And giro a la derecha
	And avanzo "16" pasos
	And giro a la izquierda
	And avanzo "34" pasos
	And giro a la izquierda
	And avanzo "1" pasos
	And giro a la derecha
	And avanzo "24" pasos
	And giro a la derecha
	And avanzo "19" pasos
	# aqui estoy en la intersección
	# que tiene 3 salidas
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "32" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And espero "132" iteraciones 
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
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	# el abad esta delante bloqueando el paso
	And espero "6" iteraciones 
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	# Monje molestando
	And espero "10" iteraciones 
	And avanzo "22" pasos
	And giro a la derecha
	And avanzo "20" pasos
	And giro a la derecha
	And Adso avanza "16" pasos
	And giro a la izquierda
	And Adso avanza "8" pasos
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |  4099 |  3  |   False     |         False         |      4     |      8      |        0     |     31    |    0   |     30     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       0          |      0      |   89 |   36 |
         |    0   |  1 |  Adso     |       3          |      0      |   88 |   42 |
	# la lampara aún no se ha eliminado de la lista de objetos en pantalla
        And la lista de "Objetos" tiene "1" elementos
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
	And no hago nada
	And avanzo "4" pasos
	# a partir de aquí los tipicos movimientos para
	# entrar al pasadizo
	# ver como la secuencia 3-1-4-5-3-9 
	# está en otros escenarios de la cocina
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
	And avanzo "16" pasos
	And giro a la derecha
	And avanzo "13" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la derecha
	# en el escenario anterior en que pasabamos
	# el pasadizo nos abría el encapuchado
	# aquí hay que usar a Adso
	And Adso avanza "15" pasos
	And giro a la izquierda
	And Adso avanza "7" pasos
	And giro a la derecha
# TODO: unificar estos pasos
	And avanzo "17" pasos
	And avanzo "15" pasos
	And giro a la derecha
	And avanzo "17" pasos
	And giro a la derecha
	# esto ya es copiado del escenario de la primera misa
	And avanzo "12" pasos
	And giro a la izquierda
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la derecha
	#And espero "2183" iteraciones
	# Aqui empieza a decir "OREMOS..."
	#And espero "23" iteraciones
	#pasa a completas
	#todo a la vez
	And espero "2206" iteraciones
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
	# estos pasos estan copiados 
	# del escenario "Dormir primera noche"
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
#	And espero "92" iteraciones
	And espero "75" iteraciones
#	And los valores iniciales son correctos:
#           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
#           |   0   |  2  |   False     |         False         |      0     |     62      |        0     |     31    |    0   |      7     |
#        And la lista de "Personajes" tiene "2" elementos
#        And los valores de los "Personajes" son correctos:
#         | altura | id | nombre    | objetos          | orientacion | posX | posY |
#         |    2   |  0 | Guillermo |    32            |      1      |  169 |   27 |
#         |    2   |  1 |  Adso     |     0            |      3      |  169 |   25 |
	# Adso nos pregunta si dormimos
	And digo que SI
	And no hago nada
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
	And giro a la derecha
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la derecha
	# a partir de aquí igual que
	# escenario "Primera misa"
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la derecha
	And avanzo "9" pasos
# TODO: añadir tests probando los sonidos de la puerta
# TODO: uhm, ver por que se queda con un paso a medias
# y hay que hacer este NOP para que pueda girar 
#	And no hago nada
	And giro a la izquierda
	# en primera misa eran 16 
	# con un nop previo porque
	# alguien estaría delante
	And avanzo "15" pasos
	And giro a la derecha
	And avanzo "12" pasos
	And giro a la izquierda
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la derecha
	# TODO: Esperar algo menos
	# y ver que sale bien la frase
	# correspondiente
	And espero "111" iteraciones
	And grabo la partida

# continuar con un nuevo escenario
# que puede copiarse de cuando conocemos a Jorge
# esperamos a que se quite el monje de enmedio
# y vamos hacia el altar
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
	# el abad dice venid aqui
	# despues de 10 iteraciones
	# pero si te quedas quieto en la posicion
	# de la iglesia te sigue hablando
	# y nos ahorramos pasos
	And espero "114" iteraciones
	# Severino viene a buscarnos
	# pero vamos avanzando hasta el refectorioa
	# y que nos cuente por el camino
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "64" pasos
	And giro a la derecha
	And avanzo "27" pasos
	And giro a la derecha
	# a partir de aquí copiado de 
	# DIA III SEXTA IR AL REFECTORIO
	And avanzo "17" pasos
	And giro a la izquierda
	# a partir de aquí copiado de 
	## DIA III SEXTA IR AL REFECTORIO
	And avanzo "34" pasos
	And giro a la izquierda
	And avanzo "1" pasos
	And giro a la derecha
	And avanzo "24" pasos
	And giro a la derecha
	And avanzo "19" pasos
	# aqui estoy en la intersección
	# que tiene 3 salidas
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la derecha
#	And avanzo "9" pasos
#TODO: Revisar esto ...
#en DIA III SEXTA, aquí giro 9 pasos
#pero aquí me doy con la columna
#y tienen que ser 10 pasos????
	And avanzo "10" pasos
	And giro a la izquierda
	And avanzo "32" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
# Aqui tras 67 iteraciones, Severino
# nos alcanza y nos cuenta lo de las 
# manchas de tinta
#	And espero "67" iteraciones 
# TODO: Probar que sale bien la frase
# 
# Seguimos esperando a la hora de comer
#	And espero "244" iteraciones
# la siguiente iteracion es 
# "debemos ir al refectorio"
# 
# Seguimos esperando a que llegue el abad
# y nos libere
	And espero "978" iteraciones
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
	# TODO:
	# comprobar aquí o al final del 
	# escenario anterior que está
	# el nuevo monje inquisidor
	# ¿bernardo?
	And giro a la izquierda
	And mando el comando "UP"
	And avanzo "19" pasos
	And giro a la izquierda
	And avanzo "44" pasos
	And giro a la izquierda
	And avanzo "10" pasos
	And giro a la derecha
	And avanzo "18" pasos
	And giro a la izquierda
	And avanzo "45" pasos
	And giro a la izquierda
	And avanzo "1" pasos
	And giro a la derecha
	And avanzo "11" pasos
	And giro a la derecha
	And avanzo "16" pasos
	And giro a la izquierda
	And avanzo "30" pasos
	And giro a la izquierda
	And avanzo "63" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	# 2040 empieza "OREMOS"
	# 2062 cambia a paleta noche
	# 2063 "PODEIS IR A VUESTRAS CELDAS"
	And espero "2062" iteraciones
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
	# estos pasos estan copiados 
	# del escenario "Dormir primera noche"
	And espero "8" iteraciones
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "23" pasos
	And giro a la izquierda
	# tenemos que cambiar cosas	
	# porque está Bernardo que es un monje
	# que no estaba en escenarios anteriores
	And avanzo "15" pasos
	And giro a la derecha
	And avanzo "4" pasos
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la izquierda
	And giro a la izquierda
	And espero "82" iteraciones
	And digo que NO
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
	# No puedo usar los mismos pasos
	# que cuando voy a misa por la mañana
	# porque la puerta al lado de las celdas
	# está cerrada

# TODO: probar con estos pasos
# y verificar que los ultimos 6 pasos
# no se avanza porque la puerta está cerrada
#	And avanzo "10" pasos
#	And giro a la derecha
#	And avanzo "7" pasos
#	And giro a la izquierda
#	And avanzo "5" pasos
#	And giro a la derecha
#	And avanzo "6" pasos

	And avanzo "15" pasos
	And giro a la izquierda
	And avanzo "30" pasos
	And giro a la derecha
	And avanzo "12" pasos
	And giro a la derecha
	And avanzo "61" pasos
	# Quitar a Adso de enmedio
	# para poder huir sin obstaculos
	# cuando llegue el Abad
	And Adso avanza "39" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	# TODO: comprobar que tenemos la llave
	And giro a la izquierda
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "61" pasos
	And giro a la izquierda
	And avanzo "12" pasos
	And giro a la izquierda
	And avanzo "30" pasos
	And giro a la derecha
	And avanzo "15" pasos
	And giro a la derecha
	And giro a la derecha
	And espero "29" iteraciones
	And digo que SI
	And grabo la partida


Scenario: DIA V PRIMA
	Given una conexion a la interfaz
	When cargo una partida:
"""
5// dia
0// momentoDia
3271// duracionMomentoDia
0// oldMomentoDia
1// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4107// bonus
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
136// numeroAleatorio
1// hayMovimiento
30// cntMovimiento
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
8// objetos
252// mascaraObjetos
0// contadorObjetos
9// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
169// posX
29// posY
2// altura
4// estado
2// contadorAnimacion
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
2// orientacion
176// posX
56// posY
2// altura
12// estado
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
2// aDondeVa
2// aDondeHaLlegado
50// contador
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
1// seHaCogido
0// numPersonaje
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
	# Adso tiene que darse la vuelta
#	And espero "9" iteraciones
	And espero "15" iteraciones
	And avanzo "9" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "14" pasos
	And giro a la derecha
	And avanzo "13" pasos
	And giro a la izquierda
	And avanzo "18" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la derecha	
	# a las 141 el herbolario
	# me dice "ESCUCHAD HERMANO, ..." 	
	# vamos, que tiene el libro en su celda
	# TODO: comprobar que sale la frase
	# 264 OREMOS
	# 264+23 VENID AQUI, FRAY GUILLERMO
	# no hace falta acercarse
	# 264+115 nos dice que Bernardo se va 
	# y nos libera
	And espero "379" iteraciones
	And grabo la partida



Scenario: DIA V TERCIA IR AL REFECTORIO
	Given una conexion a la interfaz
	When cargo una partida:
"""
5// dia
2// momentoDia
1188// duracionMomentoDia
2// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4107// bonus
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
136// numeroAleatorio
1// hayMovimiento
93// cntMovimiento
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
8// objetos
252// mascaraObjetos
0// contadorObjetos
9// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
132// posX
77// posY
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
3// orientacion
135// posX
111// posY
2// altura
9// estado
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
2// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
8// aDondeVa
0// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
3// orientacion
136// posX
60// posY
4// altura
15// estado
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
29// numFrase
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
140// posX
118// posY
2// altura
7// estado
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
142// posX
112// posY
2// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
4// aDondeVa
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
1// seHaCogido
0// numPersonaje
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
	# copiado de  DIA IV TERCIA	
	# aunque alli la charla del abad
	# esta incluida y aquí la 
	# pasamos en el escenario anterior
	# directamente vamos al refectorio
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "64" pasos
	And giro a la derecha
	And avanzo "27" pasos
	And giro a la derecha
	# a partir de aquí copiado de 
	# DIA III SEXTA IR AL REFECTORIO
	And avanzo "17" pasos
	And giro a la izquierda
	# a partir de aquí copiado de 
	## DIA III SEXTA IR AL REFECTORIO
	And avanzo "34" pasos
	And giro a la izquierda
	And avanzo "1" pasos
	And giro a la derecha
	And avanzo "24" pasos
	And giro a la derecha
	And avanzo "19" pasos
	# aqui estoy en la intersección
	# que tiene 3 salidas
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la derecha
#	And avanzo "9" pasos
#TODO: Revisar esto ...
#en DIA III SEXTA, aquí giro 9 pasos
#pero aquí me doy con la columna
#y tienen que ser 10 pasos????
	And avanzo "10" pasos
	And giro a la izquierda
	And avanzo "32" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And espero "1479" iteraciones
	And grabo la partida 


Scenario: DIA V NONA ENCONTRAR AL HERBOLARIO MUERTO
	Given una conexion a la interfaz
	When cargo una partida:
"""
5// dia
4// momentoDia
0// duracionMomentoDia
4// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4107// bonus
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
8// objetos
252// mascaraObjetos
0// contadorObjetos
9// permisosPuertas
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
3// objetos
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
0// objetos
0// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
8// aDondeVa
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
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
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
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
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And espero "5" iteraciones
	And avanzo "3" pasos
	And giro a la derecha
	And espero "4" iteraciones
	And avanzo "30" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la derecha
	And espero "1" iteraciones
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And espero "4" iteraciones
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "15" pasos
	And giro a la derecha
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "40" pasos
	And giro a la izquierda
	And avanzo "1" pasos
	And giro a la derecha
	And espero "4" iteraciones
	And avanzo "16" pasos
	And giro a la izquierda
	And avanzo "16" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "10" pasos
	And giro a la izquierda
	And giro a la izquierda
	# en la "30" ya aparece "DIOS SANTO..."
	And espero "103" iteraciones
	And grabo la partida 

Scenario: DIA V VISPERAS
	Given una conexion a la interfaz
	When cargo una partida:
"""
5// dia
5// momentoDia
0// duracionMomentoDia
5// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4107// bonus
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
136// numeroAleatorio
1// hayMovimiento
1// cntMovimiento
0// numPersonajeCamara
2// opcionPersonajeCamara
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
1// esVisible
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
110// posX
97// posY
0// altura
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
8// objetos
252// mascaraObjetos
0// contadorObjetos
9// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
109// posX
99// posY
0// altura
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
1// aDondeHaLlegado
1// oldEstado
4// movimientosFrustados
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
2// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
6// aDondeVa
2// aDondeHaLlegado
0// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
1// orientacion
104// posX
97// posY
2// altura
5// estado
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
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
8// aDondeHaLlegado
0// contador
23// numFrase
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
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
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
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
	# dejo hueco para que Adso no moleste
	And espero "20" iteraciones
	And avanzo "42" pasos
	And giro a la izquierda
	And avanzo "24" pasos
	# entrando en la iglesia
	And giro a la izquierda
	And avanzo "64" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	# a partir de 1004
	# "era verdad, tenía el poder de mil escorpiones"
	# TODO: al final de la frase el monje muere y se eleva
	# verificar que pasa con él en el DUMP
	# ¿deja de salir al final?
	# 98 más  y cambia a paleta noche y hay que ir a dormir
	And espero "1102" iteraciones
	And grabo la partida 

Scenario: DIA V COMPLETAS
	Given una conexion a la interfaz
	When cargo una partida:
"""
5// dia
6// momentoDia
0// duracionMomentoDia
6// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4107// bonus
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
66// numeroAleatorio
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
8// objetos
252// mascaraObjetos
0// contadorObjetos
9// permisosPuertas
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
4// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
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
32// numFrase
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
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
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
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
# continuar ...
	# copiado de dormir primera noche
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "22" pasos
	And giro a la izquierda
	And avanzo "15" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And espero "93" iteraciones
# Adso nos pregunta si dormimos
# la solución de Manuel Abadía indica que hay que ir
# esta noche a por las gafas al laberinto
# pero paso, lo dejo todo para el último día como
# los exámenes
# espero que funcione y no tenga que repetir
#	And digo que SI
# Noooo, nos falta conseguir la llave de Severino
	And digo que NO
	And grabo la partida


Scenario: DIA VI NOCHE
	Given una conexion a la interfaz
	When cargo una partida:
"""
6// dia
0// momentoDia
3784// duracionMomentoDia
0// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4107// bonus
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
57// cntMovimiento
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
8// objetos
252// mascaraObjetos
0// contadorObjetos
9// permisosPuertas
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
4// movimientosFrustados
21// cntParaDormir
// MALAQUIAS
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
2// orientacion
142// posX
55// posY
4// altura
10// estado
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
2// aDondeVa
6// aDondeHaLlegado
30// contador
32// numFrase
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
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
# hay que ir a la biblioteca a por la llave de Severino
	And giro a la derecha
	And giro a la derecha
	# copiado de   DIA III NOCHE COGER MANUSCRITO
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "14" pasos
	And giro a la derecha
	And avanzo "16" pasos
	And giro a la derecha
	And avanzo "45" pasos
	And giro a la derecha
	And avanzo "16" pasos
	And giro a la izquierda
	# aquí no tengo al encapuchado delante
	# abriendo la puerta como en DIA III
	# así que tengo que usar a Adso
#	And avanzo "30" pasos
	And avanzo "20" pasos
	And Adso avanza "38" pasos
	And giro a la izquierda
	And Adso avanza "11" pasos
	And giro a la derecha
	And Adso avanza "10" pasos
	And avanzo "10" pasos
	# aqui vuelvo a copiar del DIA III
#	And giro a la izquierda
#	And avanzo "7" pasos
#	And giro a la derecha


	# para completar la animacion
	# ya que el encapuchado nos ha bloqueado
#	And mando el comando "UP"
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la derecha
	# Comienza el recoveco raro 
	# de la escalera del pasadizo
	And avanzo "13" pasos
	And giro a la izquierda
	And avanzo "16" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	# aquí ya salimos a la cocina
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "1" pasos
	And giro a la derecha
	And avanzo "3" pasos
	# esto ya te saca de la cocina
	And giro a la izquierda
	And avanzo "20" pasos

# ¿me vale a partir de aqui?
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "54" pasos
	And giro a la derecha
	And avanzo "1" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la izquierda

# esto va a por el pergamino
# aqui vamos a otro lado
	# el encapuchado me bloquea
	# algunos pasos no avanzan
	And avanzo "20" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	# ya estoy en la planta 1
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la derecha
#	And avanzo "12" pasos
# lo cambio a 14 en el dia VI para ir directo
# sin tropezar en la mesa
	And avanzo "14" pasos
	And giro a la derecha
	# espero para no tropezar con el lento
	# del encapuchado y no poder girar
	# al no dar un numero par de pasos
	# al avanzar
#	And espero "2" iteraciones
	And avanzo "14" pasos
# aqui cambio porque voy a otra mesa
# distinta de la del dia IV
	And avanzo "31" pasos
	And giro a la izquierda
	And avanzo "25" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la derecha
# TODO: revisar porque hace falta
# ese UP extra para coger la llave
	And mando el comando "UP"
#12D R 8U 14U
# TODO: comprobar que tenemos la llave
	And giro a la derecha
	And Adso avanza "12" pasos
	And avanzo "8" pasos
	And giro a la izquierda
	# algunos son para empujar a Adso
	And avanzo "12" pasos
	And giro a la izquierda
	And avanzo "10" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "25" pasos
	And giro a la derecha
	And avanzo "31" pasos
	And avanzo "14" pasos
	And avanzo "1" pasos
	And giro a la izquierda
	And avanzo "14" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "20" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "1" pasos
	And giro a la izquierda
	And avanzo "54" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "20" pasos
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
	And avanzo "16" pasos
	And giro a la derecha
	And avanzo "13" pasos
	# que nos abra Adso la puerta
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la derecha
	And Adso avanza "17" pasos
	And giro a la izquierda
	And Adso avanza "4" pasos
	And giro a la derecha	
	#hago el truco de esperar pegado a la pared
	And avanzo "11" pasos
	And mando el comando "UP"
	And giro a la izquierda
	And avanzo "11" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And espero "2051" iteraciones
	And giro a la izquierda
	And giro a la izquierda
	And espero "2" iteraciones
	And avanzo "3" pasos
	And giro a la derecha	
	And grabo la partida


# esta parte no la aprovecho
# aquí va para la mesa donde estaba el libro
# y el pergamino
# y nosotros buscamos la llave
#	And giro a la izquierda
#	And avanzo "24" pasos
#	And giro a la izquierda
#	And avanzo "1" pasos
#	And giro a la izquierda

Scenario: DIA VI PRIMA
	Given una conexion a la interfaz
	When cargo una partida:
"""
6// dia
1// momentoDia
0// duracionMomentoDia
1// oldMomentoDia
0// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4111// bonus
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
124// numeroAleatorio
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
1// esVisible
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
131// posX
29// posY
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
12// objetos
252// mascaraObjetos
0// contadorObjetos
13// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
3// orientacion
131// posX
32// posY
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
5// movimientosFrustados
21// cntParaDormir
// MALAQUIAS
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
0// orientacion
101// posX
54// posY
2// altura
14// estado
2// contadorAnimacion
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
0// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
2// aDondeHaLlegado
0// contador
23// numFrase
0// guillermoBienColocado
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
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
#continuar
#	# en algunos me molesta Adso y no avanzo
	And espero "5" iteraciones
	And avanzo "11" pasos
	And giro a la izquierda
	And espero "2" iteraciones 
	And avanzo "21" pasos
	And giro a la derecha
	And espero "3" iteraciones 
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "5" pasos
	#Adso parece un jueves
	And espero "6" iteraciones 
	And avanzo "6" pasos
	And giro a la izquierda
	# a ver si me coloco bien para misa
	# juas, mientas me coloco
	# como no hay más monjes
	# me suelta
	# me dice "LLEGAIS TARDE..."
	# TODO: Intentar pasarse el juego
	# con el obsequium a 31
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la derecha
	# oremos 29
	# despues venid aqui
	# despues mañana abandonareis la abadia
	And espero "118" iteraciones
	And grabo la partida

Scenario: MAL, NO HEMOS COGIDO LA LLAVE DE SEVERINO ANTES D I A V I P R I M A
	Given una conexion a la interfaz
	When cargo una partida:
"""
6// dia
0// momentoDia
3784// duracionMomentoDia
0// oldMomentoDia
1// avanzarMomentoDia
31// obsequium
0// haFracasado
0// investigacionCompleta
4107// bonus
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
57// cntMovimiento
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
8// objetos
252// mascaraObjetos
0// contadorObjetos
9// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
3// orientacion
169// posX
25// posY
2// altura
4// estado
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
4// movimientosFrustados
21// cntParaDormir
// MALAQUIAS
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
2// orientacion
142// posX
55// posY
4// altura
10// estado
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
2// aDondeVa
6// aDondeHaLlegado
30// contador
32// numFrase
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
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
	And giro a la izquierda
	And giro a la izquierda
	# copiado de otro escenario
	And avanzo "9" pasos
	And giro a la derecha
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "6" pasos 
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "15" pasos
	And giro a la derecha
	And avanzo "15" pasos
	And giro a la izquierda
	# juas, mientas me coloco
	# como no hay más monjes
	# me suelta
	# me dice "LLEGAIS TARDE..."
	# TODO: Intentar pasarse el juego
	# con el obsequium a 31
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la derecha
	# oremos 29
	# despues venid aqui
	# despues mañana abandonareis la abadia
	And espero "118" iteraciones
	And grabo la partida

Scenario: DIA VI TERCIA COGER GUANTES CELDA SEVERINO
	Given una conexion a la interfaz
	When cargo una partida:
"""
6// dia
2// momentoDia
1192// duracionMomentoDia
2// oldMomentoDia
0// avanzarMomentoDia
29// obsequium
0// haFracasado
0// investigacionCompleta
4111// bonus
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
136// numeroAleatorio
1// hayMovimiento
89// cntMovimiento
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
12// objetos
252// mascaraObjetos
0// contadorObjetos
13// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
132// posX
77// posY
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
5// movimientosFrustados
21// cntParaDormir
// MALAQUIAS
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
192// estado2
0// contadorEnScriptorium
// ABAD
3// orientacion
136// posX
60// posY
4// altura
15// estado
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
30// numFrase
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
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
# es como DIA V VISPERAS
# pero en sentido contrario

# esto es dia V VISPERAS
# para copiar en sentido contrario
	# dejo hueco para que Adso no moleste
#	And espero "20" iteraciones
#	And avanzo "42" pasos
#	And giro a la izquierda
#	And avanzo "24" pasos
	# entrando en la iglesia
#	And giro a la izquierda
#	And avanzo "64" pasos
#	And giro a la izquierda
#	And avanzo "3" pasos
#	And giro a la derecha
	# a partir de 1004
	# "era verdad, tenía el poder de mil escorpiones"
	# TODO: al final de la frase el monje muere y se eleva
	# verificar que pasa con él en el DUMP
	# ¿deja de salir al final?
	# 98 más  y cambia a paleta noche y hay que ir a dormir
#	And espero "1102" iteraciones
#	And grabo la partida 

	And giro a la derecha
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "64" pasos
	And giro a la derecha
	And avanzo "24" pasos
	And giro a la derecha
	And avanzo "42" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "12" pasos
	And giro a la derecha
	And avanzo "1" pasos
	# TODO: comprobar que tengo el guante
	And giro a la derecha
	And giro a la derecha
	And avanzo "1" pasos
	And giro a la izquierda
#	And avanzo "11" pasos
# a la vuelta hay que empujar a Adso
# que se ha quedado fuera
	And avanzo "16" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "25" pasos
# a partir de aquí deberia poder aprovechar pasos
# para ir al refectorio
	And giro a la derecha
	And avanzo "34" pasos
	And giro a la izquierda
	And avanzo "1" pasos
	And giro a la derecha
	And avanzo "24" pasos
	And giro a la derecha
	And avanzo "19" pasos
	# aqui estoy en la intersección
	# que tiene 3 salidas
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la derecha
	# uhm, en el otro escenario es 9
	And avanzo "10" pasos
	And giro a la izquierda
	And avanzo "32" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And espero "1297" iteraciones
	And grabo la partida

Scenario: DIA VI SEXTA
	Given una conexion a la interfaz
	When cargo una partida:
"""
6// dia
3// momentoDia
0// duracionMomentoDia
3// oldMomentoDia
1// avanzarMomentoDia
29// obsequium
0// haFracasado
0// investigacionCompleta
4175// bonus
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
66// numeroAleatorio
1// hayMovimiento
37// cntMovimiento
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
76// objetos
252// mascaraObjetos
0// contadorObjetos
13// permisosPuertas
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
21// cntParaDormir
// MALAQUIAS
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
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
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
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
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And espero "5" iteraciones
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "26" pasos
	And giro a la derecha
	And avanzo "24" pasos
	And giro a la derecha
# copiado de DIA II NONA
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
	# aquí va a la escalera con recoveco
	And avanzo "16" pasos
	And giro a la derecha
	And avanzo "13" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la derecha
#esto difiere del otro escenario
#	And Adso avanza "14" pasos
	And Adso avanza "17" pasos
	And giro a la izquierda
#esto difiere del otro escenario
#	And Adso avanza "12" pasos
	And Adso avanza "4" pasos
	And giro a la derecha
	And mando el comando "UP"
	And avanzo "34" pasos
	And giro a la derecha
# a partir de aqui cambia,
# ya que queremos ir a la celda del abad
# y no a misa
	And avanzo "15" pasos
	And giro a la derecha
	And avanzo "53" pasos
	And giro a la derecha
	And avanzo "1" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la izquierda
	And no hago nada
	And giro a la izquierda
	And avanzo "8" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la derecha
# a la vuelta 10 y no 7
# porque Adso molesta
#	And avanzo "7" pasos
	And avanzo "10" pasos
	And giro a la derecha
	And avanzo "1" pasos
	And giro a la izquierda
	And avanzo "40" pasos
	And mando el comando "UP"
	And giro a la derecha
	And avanzo "19" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la derecha
	And espero "597" iteraciones
	And grabo la partida

Scenario: DIA VI COMPLETAS
	Given una conexion a la interfaz
	When cargo una partida:
"""
6// dia
6// momentoDia
0// duracionMomentoDia
6// oldMomentoDia
0// avanzarMomentoDia
29// obsequium
0// haFracasado
0// investigacionCompleta
12367// bonus
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
0// pergaminoGuardado
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
92// objetos
252// mascaraObjetos
0// contadorObjetos
13// permisosPuertas
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
21// cntParaDormir
// MALAQUIAS
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
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
1// seHaCogido
0// numPersonaje
// OBJETO 4
0// orientacion
137// posX
62// posY
8// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
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
	And giro a la izquierda
	And giro a la izquierda
	And espero "73" iteraciones
# Adso nos pregunta si dormimos
	And digo que NO
	And grabo la partida

Scenario: DIA VII NOCHE LLEGAR A LABERINTO
	Given una conexion a la interfaz
	When cargo una partida:
"""
7// dia
0// momentoDia
3802// duracionMomentoDia
0// oldMomentoDia
0// avanzarMomentoDia
29// obsequium
0// haFracasado
0// investigacionCompleta
12367// bonus
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
92// objetos
252// mascaraObjetos
0// contadorObjetos
13// permisosPuertas
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
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
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
30// contador
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
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
1// seHaCogido
0// numPersonaje
// OBJETO 4
0// orientacion
137// posX
62// posY
8// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
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
# completar
# copiado de DIA VI NOCHE cuando también voy a la entrada
# de la biblioteca
#	And giro a la derecha
#	And giro a la derecha
	# copiado de   DIA III NOCHE COGER MANUSCRITO
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "14" pasos
	And giro a la derecha
	And avanzo "16" pasos
	And giro a la derecha
	And avanzo "45" pasos
	And giro a la derecha
	And avanzo "16" pasos
	And giro a la izquierda
	# aquí no tengo al encapuchado delante
	# abriendo la puerta como en DIA III
	# así que tengo que usar a Adso
#	And avanzo "30" pasos
	And avanzo "20" pasos
	And Adso avanza "38" pasos
	And giro a la izquierda
	And Adso avanza "11" pasos
	And giro a la derecha
	And Adso avanza "10" pasos
	And avanzo "10" pasos
	# aqui vuelvo a copiar del DIA III
#	And giro a la izquierda
#	And avanzo "7" pasos
#	And giro a la derecha


	# para completar la animacion
	# ya que el encapuchado nos ha bloqueado
#	And mando el comando "UP"
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la derecha
	# Comienza el recoveco raro 
	# de la escalera del pasadizo
	And avanzo "13" pasos
	And giro a la izquierda
	And avanzo "16" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	# aquí ya salimos a la cocina
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "1" pasos
	And giro a la derecha
	And avanzo "3" pasos
	# esto ya te saca de la cocina
	And giro a la izquierda
	And avanzo "20" pasos

# ¿me vale a partir de aqui?
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "54" pasos
	And giro a la derecha
	And avanzo "1" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la izquierda

# esto va a por el pergamino
# aqui vamos a otro lado
	# el encapuchado me bloquea
	# algunos pasos no avanzan
	And avanzo "20" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	# ya estoy en la planta 1
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la derecha
#	And avanzo "12" pasos
# lo cambio a 14 en el dia VI para ir directo
# sin tropezar en la mesa
	And avanzo "14" pasos
	And giro a la derecha
	# espero para no tropezar con el lento
	# del encapuchado y no poder girar
	# al no dar un numero par de pasos
	# al avanzar
#	And espero "2" iteraciones
	And avanzo "14" pasos
# aqui cambio porque voy a otra mesa
# distinta de la del dia IV
	And avanzo "31" pasos
	And giro a la izquierda
	And avanzo "25" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la derecha
	And avanzo "8" pasos
	# a partir de aquí es distinto
	# no voy a la mesa a por la llave
	# entro a la biblioteca
	And giro a la derecha
	And avanzo "1" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "17" pasos
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "11" pasos
	And giro a la derecha
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "10" pasos
	And giro a la izquierda
	# en la entrada del laberinto
	And grabo la partida

Scenario: DIA VII NOCHE LABERINTO
	Given una conexion a la interfaz
	When cargo una partida:
"""
7// dia
0// momentoDia
2699// duracionMomentoDia
0// oldMomentoDia
0// avanzarMomentoDia
29// obsequium
0// haFracasado
0// investigacionCompleta
12367// bonus
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
0// pergaminoGuardado
100// numeroAleatorio
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
95// posX
45// posY
19// altura
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
92// objetos
252// mascaraObjetos
0// contadorObjetos
13// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
0// orientacion
86// posX
45// posY
14// altura
6// estado
2// contadorAnimacion
0// bajando
0// orientacion
1// enDesnivel
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
-1// aDondeVa
0// aDondeHaLlegado
1// oldEstado
1// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
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
2// aDondeHaLlegado
50// contador
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
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
1// seHaCogido
0// numPersonaje
// OBJETO 4
0// orientacion
137// posX
62// posY
8// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
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
	And avanzo "22" pasos
	And giro a la izquierda
	And avanzo "24" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "12" pasos
	And giro a la derecha
	And avanzo "18" pasos
	And giro a la derecha
	And avanzo "15" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "13" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "8" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And giro a la derecha
	# TODO: comprobar que tengo las gafas
	# TODO: esperar a que suelte la frase
	# y verificar que el numeroRomano 
	# se ha generado. Es aleatorio, pero
	# verificar que se ha generado
	And giro a la derecha
	# vuelta atrás
	And avanzo "2" pasos
	And giro a la derecha
	And avanzo "8" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "13" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la derecha
	And avanzo "15" pasos
	And giro a la izquierda
#	And avanzo "18" pasos
	And avanzo "17" pasos
	And giro a la izquierda
	And avanzo "12" pasos
	And giro a la derecha
	And avanzo "3" pasos
# aqui creo que deberíamos cambiar
# con esto saldríamos fuera
#	And giro a la izquierda
#	And avanzo "4" pasos
#	And giro a la derecha
#	And avanzo "24" pasos
#	And giro a la derecha
#	And avanzo "22" pasos
	And grabo la partida

Scenario: ANTES DE LLEGAR AL ESPEJO
	Given una conexion a la interfaz
	When cargo una partida:
"""
7// dia
0// momentoDia
3335// duracionMomentoDia
0// oldMomentoDia
0// avanzarMomentoDia
29// obsequium
0// haFracasado
0// investigacionCompleta
12799// bonus
215// mascaraPuertas
1// espejoCerrado
2// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
1// usandoLampara
0// lamparaDesaparecida
337// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
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
1// esVisible
// GUILLERMO
0// orientacion
69// posX
37// posY
32// altura
0// estado
2// contadorAnimacion
1// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
124// objetos
252// mascaraObjetos
0// contadorObjetos
13// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
65// posX
37// posY
34// altura
6// estado
3// contadorAnimacion
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
-1// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
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
2// aDondeHaLlegado
50// contador
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
// OBJETO 2
0// orientacion
27// posX
35// posY
24// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 3
1// orientacion
84// posX
60// posY
2// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 4
0// orientacion
137// posX
62// posY
8// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
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
# CONTINUAR
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "36" pasos
	And giro a la derecha
	And avanzo "2" pasos
	And giro a la izquierda
	And avanzo "19" pasos
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "24" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la derecha
	And avanzo "2" pasos
	And giro a la derecha
	And avanzo "11" pasos
	And giro a la derecha
	And avanzo "28" pasos
	And giro a la derecha
	And avanzo "12" pasos
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "8" pasos
	And giro a la izquierda
	And avanzo "12" pasos
	And giro a la derecha
	And avanzo "2" pasos
	And giro a la izquierda
	And avanzo "19" pasos
	And giro a la derecha
	And avanzo "43" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "11" pasos
	And giro a la derecha
	And avanzo "44" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la derecha
	And avanzo "10" pasos
	And giro a la derecha
	And grabo la partida

Scenario: GENERAR BUG BUFFERMEZCLAS
	Given una conexion a la interfaz
	When cargo una partida:
"""
7// dia
0// momentoDia
3335// duracionMomentoDia
0// oldMomentoDia
0// avanzarMomentoDia
29// obsequium
0// haFracasado
0// investigacionCompleta
12799// bonus
215// mascaraPuertas
1// espejoCerrado
2// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
1// usandoLampara
0// lamparaDesaparecida
337// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
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
1// esVisible
// GUILLERMO
0// orientacion
69// posX
37// posY
32// altura
0// estado
2// contadorAnimacion
1// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
124// objetos
252// mascaraObjetos
0// contadorObjetos
13// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
65// posX
37// posY
34// altura
6// estado
3// contadorAnimacion
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
-1// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
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
2// aDondeHaLlegado
50// contador
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
// OBJETO 2
0// orientacion
27// posX
35// posY
24// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 3
1// orientacion
84// posX
60// posY
2// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 4
0// orientacion
137// posX
62// posY
8// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
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
# CONTINUAR
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "3" pasos
	And giro a la derecha
	And avanzo "36" pasos
	And giro a la derecha
	And avanzo "2" pasos
	And giro a la izquierda
	And avanzo "19" pasos
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "24" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la derecha
	And avanzo "2" pasos
	And giro a la derecha
	And avanzo "11" pasos
	And giro a la derecha
	And avanzo "28" pasos
	And giro a la derecha
	And avanzo "12" pasos
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "8" pasos
	And giro a la izquierda
	And avanzo "12" pasos
	And giro a la derecha
	And avanzo "2" pasos
	And giro a la izquierda
	And avanzo "19" pasos
	And giro a la derecha
	And avanzo "43" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "11" pasos
	And giro a la derecha
	And avanzo "44" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "7" pasos
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la derecha
	And avanzo "10" pasos
	And giro a la derecha
	# aqui hay que mirar el numero romano
	# para ir por una escalera u otra
	# en esta partida grabada el número
	# romano es 2
	# pero voy a la escaler más a la derecha
	# para forzar un bug
	And avanzo "10" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	# TODO: en el DUMP solo salen 
	# Guillermo y Adso
	# pero habría que "mostrarle"
	# a la IA el reflejo 
	# igual ve que hay alguien delante
	# y no avanza pensando que el camino
	# está bloqueado

	And grabo la partida
# TODO: NOP LEFT DOWN y otros provocan este error
# desde esta situación
# ../core/abadia/MezcladorSprites.cpp:120: void Abadia::MezcladorSprites::mezclaSprites(Abadia::Sprite**, int): 
# Assertion `spr->anchoFinal*spr->altoFinal*4 < lgtudBufferMezclas' failed.

Scenario: BUFFER MEZCLAS
	Given una conexion a la interfaz
	When cargo una partida:
"""
7// dia
0// momentoDia
3052// duracionMomentoDia
0// oldMomentoDia
0// avanzarMomentoDia
29// obsequium
0// haFracasado
0// investigacionCompleta
13311// bonus
215// mascaraPuertas
1// espejoCerrado
2// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
1// usandoLampara
0// lamparaDesaparecida
337// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
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
1// esVisible
// SPRITE 24
1// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
2// orientacion
34// posX
101// posY
26// altura
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
124// objetos
252// mascaraObjetos
0// contadorObjetos
13// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
39// posX
104// posY
24// altura
6// estado
2// contadorAnimacion
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
-1// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
3// cntParaDormir
// MALAQUIAS
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
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
2// aDondeHaLlegado
50// contador
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
// OBJETO 2
0// orientacion
27// posX
35// posY
24// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 3
1// orientacion
84// posX
60// posY
2// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 4
0// orientacion
137// posX
62// posY
8// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
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
	# esto carga la partida grabada en el 
	# escenario GENERAR BUFFER MEZCLAS
	# y al hacer NOP u otro movimiento
	# sale este error
# ../core/abadia/MezcladorSprites.cpp:120: void Abadia::MezcladorSprites::mezclaSprites(Abadia::Sprite**, int): 
# Assertion `spr->anchoFinal*spr->altoFinal*4 < lgtudBufferMezclas' failed.
	And no hago nada
#vaya, pues ahora no se reproduce


# Logica::pulsadoQR
# si esta en la escalera de la izquierda, sale devolviendo 1
# si esta en la escalera del centro, sale devolviendo 2
# si esta en la escalera de la derecha, sale devolviendo 3
Scenario: PUERTA DERECHA
	Given una conexion a la interfaz
	When cargo una partida:
"""
7// dia
0// momentoDia
3077// duracionMomentoDia
0// oldMomentoDia
0// avanzarMomentoDia
29// obsequium
0// haFracasado
0// investigacionCompleta
13311// bonus
215// mascaraPuertas
1// espejoCerrado
2// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
1// usandoLampara
0// lamparaDesaparecida
337// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
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
37// posX
111// posY
24// altura
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
124// objetos
252// mascaraObjetos
0// contadorObjetos
13// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
2// orientacion
44// posX
111// posY
24// altura
6// estado
2// contadorAnimacion
0// bajando
2// orientacion
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
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
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
2// aDondeHaLlegado
50// contador
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
// OBJETO 2
0// orientacion
27// posX
35// posY
24// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 3
1// orientacion
84// posX
60// posY
2// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 4
0// orientacion
137// posX
62// posY
8// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
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
	# aqui hay que mirar el numero romano
	# para ir por una escalera u otra
	# en esta partida grabada el número
	# romano es 2
	# pero voy a la escaler más a la derecha
	# para forzar un bug
	And avanzo "10" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	# TODO: en el DUMP solo salen 
	# Guillermo y Adso
	# pero habría que "mostrarle"
	# a la IA el reflejo 
	# igual ve que hay alguien delante
	# y no avanza pensando que el camino
	# está bloqueado

	And mando el comando "QR"
	# HABEIS MUERTO FRAY GUILLERMO, HABEIS CAIDO EN LA TRAMPA
	And espero "71" iteraciones
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           | 14335 |  7  |   True      |         False         |      0     |    114      |        2     |     29    |    2   |     94     |
        And la lista de "Personajes" tiene "1" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |   24   |  1 |  Adso     |     3            |      1      |   39 |  103 |
        And la lista de "Objetos" tiene "0" elementos
        And la lista de "frases" tiene "2" elementos
        And los elementos de la lista de "frases" son:
         | id |
         | 34 |
         | 56 |
	# Para salir y empezar a jugar de nuevo haría falta
	# And no hago anda
	# And pulso espacio


# pensaba que con numeroRomano 2 la puerta buena era la de la derecha
# probamos con la central
# pues es esta
# Logica::pulsadoQR
# si esta en la escalera de la izquierda, sale devolviendo 1
# si esta en la escalera del centro, sale devolviendo 2
# si esta en la escalera de la derecha, sale devolviendo 3
Scenario: PUERTA CENTRAL
	Given una conexion a la interfaz
	When cargo una partida:
"""
7// dia
0// momentoDia
3077// duracionMomentoDia
0// oldMomentoDia
0// avanzarMomentoDia
29// obsequium
0// haFracasado
0// investigacionCompleta
13311// bonus
215// mascaraPuertas
1// espejoCerrado
2// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
1// usandoLampara
0// lamparaDesaparecida
337// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
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
37// posX
111// posY
24// altura
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
124// objetos
252// mascaraObjetos
0// contadorObjetos
13// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
2// orientacion
44// posX
111// posY
24// altura
6// estado
2// contadorAnimacion
0// bajando
2// orientacion
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
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
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
2// aDondeHaLlegado
50// contador
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
// OBJETO 2
0// orientacion
27// posX
35// posY
24// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 3
1// orientacion
84// posX
60// posY
2// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 4
0// orientacion
137// posX
62// posY
8// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
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
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And mando el comando "QR"
	And avanzo "3" pasos
	And giro a la derecha
	# TODO: Jorge empieza a hablar
	# comprobar frases
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "7" pasos
	And giro a la derecha
	And espero "51" iteraciones
	# TODO: verificar que aparece el libro
	And avanzo "1" pasos
	# TODO: verificar que tengo el libro
	# TODO: verificar en otro escenario 
	# que si he dejado antes los guantes
	# muero al leer el libro
	# 555 iteraciones despúes nos quedamos
	# a oscuras solo con la lampara
	And espero "555" iteraciones
	# TODO: verificar que Jorge nos ha quitado
	# el libro
	And giro a la derecha
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la derecha
	And avanzo "5" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "6" pasos
	And giro a la izquierda
	And avanzo "10" pasos
	And giro a la izquierda
	And avanzo "9" pasos
	And giro a la izquierda
	And avanzo "5" pasos
	And giro a la derecha
	And avanzo "3" pasos
	And giro a la izquierda
	And avanzo "4" pasos
	And giro a la derecha
	And avanzo "4" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And giro a la derecha
	And avanzo "45" pasos
	And giro a la izquierda
	And avanzo "11" pasos
	And giro a la derecha
	And espero "5" iteraciones 
	# casi, casi, investigacion al 98%
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           | 16383 |  7  |   False     |         False         |      0     |    103      |        2     |     29    |    2   |     98     |
        And la lista de "Personajes" tiene "3" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |   26   |  0 | Guillermo |     124          |      1      |   23 |   47 |
         |   30   |  1 |  Adso     |     3            |      2      |   27 |   47 |
         |   26   |  6 | Jorge     | __DO_NOT_CHECK__ |      1      |   25 |   43 |
        And la lista de "Objetos" tiene "0" elementos
	And no hago nada
	# TACHAN, investigacionCompleta True, porcentaje 100%
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           | 16383 |  7  |   True      |         True          |      0     |    103      |        2     |     29    |    2   |    100     |
        And la lista de "Personajes" tiene "3" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |   26   |  0 | Guillermo |     124          |      1      |   23 |   47 |
         |   30   |  1 |  Adso     |     3            |      2      |   27 |   47 |
         |   26   |  6 | Jorge     | __DO_NOT_CHECK__ |      0      |   25 |   43 |
        And la lista de "Objetos" tiene "0" elementos
	And no hago nada
	# un nop más y aparece la pantalla de has resuelto el 100% de la investigación
	# y hay que pulsar espacio para salir



# Logica::pulsadoQR
# si esta en la escalera de la izquierda, sale devolviendo 1
# si esta en la escalera del centro, sale devolviendo 2
# si esta en la escalera de la derecha, sale devolviendo 3
Scenario: PUERTA IZQUIERDA
	Given una conexion a la interfaz
	When cargo una partida:
"""
7// dia
0// momentoDia
3077// duracionMomentoDia
0// oldMomentoDia
0// avanzarMomentoDia
29// obsequium
0// haFracasado
0// investigacionCompleta
13311// bonus
215// mascaraPuertas
1// espejoCerrado
2// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
1// usandoLampara
0// lamparaDesaparecida
337// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
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
37// posX
111// posY
24// altura
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
124// objetos
252// mascaraObjetos
0// contadorObjetos
13// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
2// orientacion
44// posX
111// posY
24// altura
6// estado
2// contadorAnimacion
0// bajando
2// orientacion
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
1// orientacion
0// posX
0// posY
0// altura
11// estado
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
2// estaMuerto
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
2// aDondeHaLlegado
50// contador
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
0// orientacion
0// posX
0// posY
0// altura
7// estado
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
0// estaVivo
// JORGE
3// orientacion
18// posX
101// posY
24// altura
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
128// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
0// aDondeHaLlegado
1// estaActivo
0// contadorHuida
// BERNARDO
3// orientacion
0// posX
0// posY
0// altura
20// estado
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
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
4// aDondeHaLlegado
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
1// seHaCogido
0// numPersonaje
// OBJETO 2
0// orientacion
27// posX
35// posY
24// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 3
1// orientacion
84// posX
60// posY
2// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 4
0// orientacion
137// posX
62// posY
8// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 5
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
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
	And avanzo "2" pasos
	And giro a la izquierda
	And avanzo "2" pasos
	And mando el comando "QR"
# HABEIS MUERTO FRAY GUILLERMO, HABEIS CAIDO EN LA TRAMPA
	And espero "71" iteraciones
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           | 14335 |  7  |   True      |         False         |      0     |    114      |        2     |     29    |    2   |     94     |
        And la lista de "Personajes" tiene "1" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |   24   |  1 |  Adso     |     3            |      1      |   39 |  110 |
        And la lista de "Objetos" tiene "0" elementos
        And la lista de "frases" tiene "2" elementos
        And los elementos de la lista de "frases" son:
         | id |
         | 34 |
         | 56 |
	# Para salir y empezar a jugar de nuevo haría falta
	# And no hago anda
	# And no hago anda
	# And pulso espacio

