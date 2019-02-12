# TODO
# seguir http://behave.github.io/behave.example/tutorials/tutorial09.html para hacer RESET antes de cada escenario
# y empezar con una partida limpia
# ?se podria pasar argumento al RESET para cargar un escenario u otro???

# TODO: hay situaciones en la que no salta el timeout
# y el escenario se queda bloqueado ¿con websocket?

# TODO: probar acentos , por ejemplo, forzando la pantalla fin de investigacion
# o volviendo a sacar los menus

# TODO: con interfaz hipermedia se podria poner de nuevo el menu???

# TODO: hacer volcado de pantalla y tests comparando que los pixeles son los mismos

Feature: Interfaz abadIA
# ejecutar con -Dinterfaz=websocket o -Dinterfaz=http segun la interfaz a probar

  Scenario: Inicializacion del juego
     Given una conexion a la interfaz
      When reinicio el juego
     Then los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
      And la lista de "Personajes" tiene "2" elementos
      And los valores de los "Personajes" son correctos:
       | altura | id | nombre    | objetos | orientacion | posX | posY |
       |    0   |  0 | Guillermo |   32    |      0      |  136 |  168 |
       |    0   |  1 |  Adso     |    0    |      0      |  134 |  170 |
      And la lista de "Objetos" tiene "0" elementos
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
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
      And la lista de "Personajes" tiene "2" elementos
      And los valores de los "Personajes" son correctos:
       | altura | id | nombre    | objetos | orientacion | posX | posY |
       |    0   |  0 | Guillermo |   32    |      0      |  136 |  168 |
       |    0   |  1 |  Adso     |    0    |      1      |  134 |  170 |
      And la lista de "frases" tiene "0" elementos
      And la lista de "Objetos" tiene "0" elementos
# suena el tintineo de inicio del juego
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
	|     1   |

  Scenario: Movimientos basicos con NOP tras avanzar
	Given una partida recien iniciada
	When giro a la izquierda
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       1     |  136 |  168 |
         |    0   |  1 |  Adso     |       1     |  134 |  169 |
	And giro a la izquierda
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       2     |  136 |  168 |
         |    0   |  1 |  Adso     |       1     |  134 |  169 |
	And giro a la izquierda
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       3     |  136 |  168 |
         |    0   |  1 |  Adso     |       1     |  134 |  169 |
	And giro a la izquierda
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       0     |  136 |  168 |
         |    0   |  1 |  Adso     |       1     |  134 |  169 |
	And avanzo
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       0     |  137 |  168 |
	And no hago nada
	And giro a la derecha
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       3     |  137 |  168 |
	And avanzo
	And no hago nada
	And avanzo
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       3     |  137 |  170 |
	And no hago nada
	And giro a la derecha
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       2     |  137 |  170 |
        And la lista de "Objetos" tiene "0" elementos


  Scenario: Movimientos basicos sin NOP tras avanzar
	Given una partida recien iniciada
	When giro a la izquierda
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       1     |  136 |  168 |
         |    0   |  1 |  Adso     |       1     |  134 |  169 |
	And giro a la izquierda
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       2     |  136 |  168 |
         |    0   |  1 |  Adso     |       1     |  134 |  169 |
	And giro a la izquierda
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       3     |  136 |  168 |
         |    0   |  1 |  Adso     |       1     |  134 |  169 |
	And giro a la izquierda
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       0     |  136 |  168 |
         |    0   |  1 |  Adso     |       1     |  134 |  169 |
	And avanzo
	And avanzo
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       0     |  137 |  168 |
	And giro a la derecha
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       3     |  137 |  168 |
	And avanzo
	And avanzo
	And avanzo
	And avanzo
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       3     |  137 |  170 |
	And giro a la derecha
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       2     |  137 |  170 |
        And la lista de "Objetos" tiene "0" elementos

  Scenario: TESTTESTTEST
	Given una partida recien iniciada
	When giro a la izquierda
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       1     |  136 |  168 |
         |    0   |  1 |  Adso     |       1     |  134 |  169 |
	And avanzo "9" pasos
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos | orientacion | posX | posY |
         |    0   |  0 | Guillermo |    32   |      1      |  136 |  159 |
         |    0   |  1 |  Adso     |     0   |      1      |  134 |  160 |
	And giro a la derecha
	And pulso espacio
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos | orientacion | posX | posY |
         |    0   |  0 | Guillermo |     0   |      0      |  136 |  159 |
         |    0   |  1 |  Adso     |     0   |      1      |  134 |  160 |
        And la lista de "Objetos" tiene "1" elementos
	And los valores de los "Objetos" son correctos:
	 | altura | id | orientacion | posX | posY |
	 |   0    |  2 |      2      |  138 |  138 |
	And giro a la derecha
	And espero "40" iteraciones 
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Objetos" tiene "1" elementos
	And los valores de los "Objetos" son correctos:
	 | altura | id | orientacion | posX | posY |
	 |   0    |  2 |      2      |  138 |  138 |
	And giro a la izquierda
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Objetos" tiene "1" elementos
# TODO: Revisar, antes en el primer  NOP el objeto seguía en pantalla
#	And no hago nada
#       	And los valores iniciales son correctos:
#           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
#           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
#        And la lista de "Objetos" tiene "1" elementos
	And no hago nada
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Objetos" tiene "0" elementos
	And espero "14" iteraciones 

  Scenario: Pasar primera pantalla
	Given una partida recien iniciada
	When giro a la izquierda
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       1     |  136 |  168 |
         |    0   |  1 |  Adso     |       1     |  134 |  169 |
	And avanzo "9" pasos
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos | orientacion | posX | posY |
         |    0   |  0 | Guillermo |    32   |      1      |  136 |  159 |
         |    0   |  1 |  Adso     |     0   |      1      |  134 |  160 |
	And giro a la derecha
	And pulso espacio
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos | orientacion | posX | posY |
         |    0   |  0 | Guillermo |     0   |      0      |  136 |  159 |
         |    0   |  1 |  Adso     |     0   |      1      |  134 |  160 |
        And la lista de "Objetos" tiene "1" elementos
	And los valores de los "Objetos" son correctos:
	 | altura | id | orientacion | posX | posY |
	 |   0    |  2 |      2      |  138 |  138 |
	And giro a la derecha
	And espero "40" iteraciones 
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Objetos" tiene "1" elementos
	And los valores de los "Objetos" son correctos:
	 | altura | id | orientacion | posX | posY |
	 |   0    |  2 |      2      |  138 |  138 |
	And giro a la izquierda
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Objetos" tiene "1" elementos
# TODO: Revisar, antes en el primer  NOP el objeto seguía en pantalla
#	And no hago nada
#       	And los valores iniciales son correctos:
#           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
#           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
#        And la lista de "Objetos" tiene "1" elementos
	And no hago nada
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Objetos" tiene "0" elementos
	And espero "14" iteraciones 
	And pulso espacio
	# en esta iteración Guillermo aún tiene el objeto y no está en pantalla
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos | orientacion | posX | posY |
         |    0   |  0 | Guillermo |    32   |      0      |  136 |  159 |
         |    0   |  1 |  Adso     |     0   |      1      |  134 |  160 |
        And la lista de "Objetos" tiene "0" elementos
	# despues de una iteración más, el objeto ya está en la lista de objetos
	# pero Guillermo sigue teniendolo
	And no hago nada
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos | orientacion | posX | posY |
         |    0   |  0 | Guillermo |    32   |      0      |  136 |  159 |
         |    0   |  1 |  Adso     |     0   |      1      |  134 |  160 |
        And la lista de "Objetos" tiene "1" elementos
	# despues de una iteración más, el objeto ya está en la lista de objetos
	# pero Guillermo sigue teniendolo
	And no hago nada
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos | orientacion | posX | posY |
         |    0   |  0 | Guillermo |     0   |      0      |  136 |  159 |
         |    0   |  1 |  Adso     |     0   |      1      |  134 |  160 |
        And la lista de "Objetos" tiene "1" elementos

  Scenario: Llegar al abad
	Given una partida recien iniciada
	When giro a la izquierda
	And avanzo "18" pasos
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos | orientacion | posX | posY |
         |    0   |  0 | Guillermo |    32   |      1      |  136 |  150 |
         |    0   |  1 |  Adso     |     0   |      1      |  134 |  151 |
        And la lista de "Objetos" tiene "0" elementos
        And la lista de "frases" tiene "0" elementos
	And avanzo
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos | orientacion | posX | posY |
         |    0   |  0 | Guillermo |    32   |      1      |  136 |  149 |
         |    0   |  1 |  Adso     |     0   |      1      |  134 |  151 |
        And la lista de "Objetos" tiene "0" elementos
        And la lista de "frases" tiene "1" elementos
        And los elementos de la lista de "frases" son:
         | id |
         |  1 |
# Aqui ha pintado la B inicial de la frase "BIENVENIDO A ESTA ABADIA, HERMANO. OS RUEGO QUE ME SIGAIS. HA SUCEDIDO ALGO TERRIBLE",
# En cada ciclo pinta otra letra
# "BIENVENIDO A ESTA ABADIA, HERMANO. OS RUEGO QUE ME SIGAIS. HA SUCEDIDO ALGO TERRIBLE"
#  1234567890          1234567890          1234567890          1234567890          1234
#            1234567890          1234567890          1234567890          1234567890
# 84 caracteres
# pero luego tienen que desplazarse y desaparecer
# en la zona de texto cabe ?16?
# "O ALGO TERRIBLE "
#  1234567890123456
# 84+16=100
	And espero "100" iteraciones 
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Personajes" tiene "3" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |    0   |  0 | Guillermo |    32            |      1      |  136 |  149 |
         |    0   |  1 |  Adso     |     0            |      1      |  134 |  150 |
	 |    0   |  3 |  Abad     | __DO_NOT_CHECK__ |      3      |  136 |  147 |  
        And la lista de "Objetos" tiene "0" elementos
        And la lista de "frases" tiene "0" elementos
	And no hago nada
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Personajes" tiene "3" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos          | orientacion | posX | posY |
         |    0   |  0 | Guillermo |    32            |      1      |  136 |  149 |
         |    0   |  1 |  Adso     |     0            |      1      |  134 |  150 |
	 |    0   |  3 |  Abad     | __DO_NOT_CHECK__ |      3      |  136 |  147 |  
        And la lista de "Objetos" tiene "0" elementos
        And la lista de "frases" tiene "1" elementos
        And los elementos de la lista de "frases" son:
         | id |
         |  2 |
	And espero "14" iteraciones 
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "frases" tiene "0" elementos
	And no hago nada
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     29    |    0   |      0     |
        And la lista de "frases" tiene "1" elementos
# el temido "os ordeno que vengais"
        And los elementos de la lista de "frases" son:
         | id |
         |  8 | 

  Scenario: Varias frases desde un dump a otro
	Given una partida recien iniciada
	When giro a la izquierda
	And avanzo "19" pasos
	And espero "116" iteraciones 
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     29    |    0   |      0     |
        And la lista de "frases" tiene "3" elementos
#es una LIFO, primero esta la ultima frase
        And los elementos de la lista de "frases" son:
         | id |
         |  8 |
	 |  2 |
	 |  1 |
	And espero "38" iteraciones 
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     29    |    0   |      0     |
        And la lista de "frases" tiene "1" elementos
#es una LIFO, primero esta la ultima frase
        And los elementos de la lista de "frases" son:
         | id |
	 |  2 |
#	And espero "53" iteraciones 
	And espero "54" iteraciones 
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     27    |    0   |      0     |
        And la lista de "frases" tiene "2" elementos
#es una LIFO, primero esta la ultima frase
        And los elementos de la lista de "frases" son:
         | id |
	 |  2 |
	 |  8 |
	And espero "120" iteraciones 
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     21    |    0   |      0     |
        And la lista de "frases" tiene "5" elementos
#es una LIFO, primero esta la ultima frase
        And los elementos de la lista de "frases" son:
         | id |
	 |  8 |
	 |  2 |
	 |  8 |
	 |  2 |
	 |  8 |

  Scenario: Seguir al abad
	Given una partida recien iniciada
	When giro a la izquierda
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


# la frase 2 es
# "TEMO QUE UNO DE LOS MONJES HA COMETIDO UN CRIMEN. OS RUEGO QUE LO ENCONTREIS ANTES DE QUE LLEGUE BERNARDO GUI, PUES NO DESEO QUE SE MANCHE EL NOMBRE DE ESTA ABADIA"
# 163+16=179 + otro paso para pasar a la sig. frase
# pues no ... el abad empieza a moverse y ya hay que seguirlo
#	And espero "180" iteraciones 
#	And los valores iniciales son correctos:
#           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
#           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
#        And la lista de "Personajes" tiene "3" elementos
#        And los valores de los "Personajes" son correctos:
#         | altura | id | nombre    | objetos          | orientacion | posX | posY |
#         |    0   |  0 | Guillermo |    32            |      1      |  136 |  149 |
#         |    0   |  1 |  Adso     |     0            |      1      |  134 |  150 |
#	 |    0   |  3 |  Abad     | __DO_NOT_CHECK__ |      3      |  136 |  147 |  
#        And la lista de "Objetos" tiene "0" elementos
#	And la lista de "frases" tiene "1" elementos
#        And los elementos de la lista de frases son:
#         | id |
#         |  3 |




#	And espero "14" iteraciones 
#       	And los valores iniciales son correctos:
#           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
#           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
#        And la lista de "Objetos" tiene "1" elementos
#	And los valores de los "Objetos" son correctos:
#	 | altura | id | orientacion | posX | posY |
#	 |   0    |  2 |      2      |  138 |  138 |
#	And no hago nada
#       	And los valores iniciales son correctos:
#           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
#           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
#        And la lista de "Objetos" tiene "0" elementos

#
##	And giro por tercera vez a la izquierda
##	And giro por cuarta vez a la izquierda
##	And avanzo
##	And giro a la derecha
##	And avanzo una segunda vez
##	And avanzo una tercera vez
##	And giro por segunda vez a la derecha
##	Then los valores finales son correctos
##           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
##           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
##	And la lista de personajes tiene "2" elemenetos
##	And los valores de los "Personajes" son correctos
##	   | altura | id | nombre    | orientacion | posX | posY |
##           |    0   |  0 | Guillermo |       0     |  136 |  168 |
##           |    0   |  1 |  Adso     |       1     |  134 |  170 |
## 	And la lista de frases tiene "0" elementos

  Scenario: Probar sonidos
     Given una conexion a la interfaz
      When reinicio el juego
      And avanzo
      And avanzo
      And avanzo
      And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
      And la lista de "sonidos" tiene "12" elementos
      # Debe estar activo el sonido de tintineo y el de los pasos
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
	|     1   |
	|     1   |
      And no hago nada
      And giro a la izquierda
      And avanzo
      And avanzo
      And avanzo
      And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
      And la lista de "sonidos" tiene "12" elementos
      # El sonido de tintineo ya no estara activo al limpiar despues del DUMP
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
	|     1   |
	|     0   |
      And no hago nada
      And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
      And la lista de "sonidos" tiene "12" elementos
      # El sonido de pasos ya no estara activo al limpiar despues del DUMP
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


  Scenario: Cargar partida
     Given una conexion a la interfaz
      When cargo una partida:
	"""
        2// dia
        6// momentoDia
        0// duracionMomentoDia
        6// oldMomentoDia
        0// avanzarMomentoDia
        25// obsequium
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
        173// numeroAleatorio
        1// hayMovimiento
        9// cntMovimiento
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
        32// objetos
        252// mascaraObjetos
        0// contadorObjetos
        8// permisosPuertas
        8// numFotogramas
        2// incrPosY
        // ADSO
        1// orientacion
        134// posX
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
        -32// despY
        32// valorPosicion
        0// puedeQuitarObjetos
        0// objetos
        3// mascaraObjetos
        0// contadorObjetos
        8// permisosPuertas
        8// numFotogramas
        60// mascarasPuertasBusqueda
        2// aDondeVa
        0// aDondeHaLlegado
        1// oldEstado
        0// movimientosFrustados
        0// cntParaDormir
        // MALAQUIAS
        1// orientacion
        132// posX
        67// posY
        3// altura
        8// estado
        3// contadorAnimacion
        0// bajando
        1// orientacion
        1// enDesnivel
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
        7// aDondeVa
        0// aDondeHaLlegado
        0// estaMuerto
        0// estado2
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
        69// posY
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
        0// aDondeHaLlegado
        0// encapuchado
        0// estado2
        1// estaVivo
        0// contadorPergamino
        // SEVERINO
        3// orientacion
        140// posX
        77// posY
        2// altura
        0// estado
        3// contadorAnimacion
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
      And no hago nada
      Then los valores iniciales son correctos:
        | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
        |   0   |  2  |   False     |         False         |      6     |     34      |        0     |     25    |     13     |
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
        And la lista de "Personajes" tiene "6" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre     | objetos          | orientacion | posX | posY |
         |    2   |  0 | Guillermo  |    32            |      1      |  132 |   75 |
         |    2   |  1 | Adso       |     0            |      1      |  134 |   77 |
	 |    3   |  2 | Malaquias  | __DO_NOT_CHECK__ |      1      |  132 |   67 |  
	 |    4   |  3 | Abad       | __DO_NOT_CHECK__ |      3      |  136 |   60 |  
	 |    2   |  4 | Berengario | __DO_NOT_CHECK__ |      1      |  140 |   69 |  
	 |    2   |  5 | Severino   | __DO_NOT_CHECK__ |      3      |  140 |   77 |  

    Scenario: Salir de la pantalla fin de investigacion
     Given una conexion a la interfaz
      When cargo una partida:
"""
1// dia
4// momentoDia
0// duracionMomentoDia
4// oldMomentoDia
0// avanzarMomentoDia
0// obsequium
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
1123// cntMovimiento
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
136// posX
149// posY
0// altura
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
32// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
134// posX
150// posY
0// altura
0// estado
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
3// orientacion
136// posX
147// posY
0// altura
139// estado
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
-1// aDondeVa
-1// aDondeHaLlegado
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
2// orientacion
117// posX
137// posY
0// altura
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
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
2// aDondeVa
3// aDondeHaLlegado
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
	# empieza a escribir "NO HABEIS RESPETADO MIS ORDENES. ABANDONAD PARA SIEMPRE ESTA ABADIA" 
	# que son 66 caracteres (en este punto la N ya la ha puesto) + 16 para el scroll
	# 66+16=82
	And los valores iniciales son correctos:
          | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
          |   0   |  1  |   True      |         False         |      4     |     22      |        0     |      0    |      0     |
	And espero "82" iteraciones 
	And los valores iniciales son correctos:
          | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
          |   0   |  1  |   True      |         False         |      4     |     22      |        0     |      0    |      0     |
	And no hago nada
	And los valores iniciales son correctos:
          | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
          |   0   |  1  |   True      |         False         |      4     |     22      |        0     |      0    |      0     |
#TODO: falta probar que se puede grabar , cargar, reset ... pero ignora otros comandos, 
 	And reinicio el juego
	And no hago nada
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
	   |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |








  Scenario: Tralari
     Given una conexion a la interfaz
      When cargo una partida:
"""
1// dia
6// momentoDia
0// duracionMomentoDia
6// oldMomentoDia
0// avanzarMomentoDia
25// obsequium
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
173// numeroAleatorio
1// hayMovimiento
9// cntMovimiento
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
32// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
134// posX
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
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
0// objetos
3// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
2// aDondeVa
0// aDondeHaLlegado
1// oldEstado
0// movimientosFrustados
0// cntParaDormir
// MALAQUIAS
1// orientacion
132// posX
67// posY
3// altura
8// estado
3// contadorAnimacion
0// bajando
1// orientacion
1// enDesnivel
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
7// aDondeVa
0// aDondeHaLlegado
0// estaMuerto
0// estado2
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
69// posY
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
0// aDondeHaLlegado
0// encapuchado
0// estado2
1// estaVivo
0// contadorPergamino
// SEVERINO
3// orientacion
140// posX
77// posY
2// altura
0// estado
3// contadorAnimacion
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
	And espero "1000" iteraciones 
	Then los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   True      |         False         |      6     |     34      |        0     |     0     |      6     |

	Scenario: Partida fracasada
		Given una partida fracasada
#		When no hago nada
#		And no hago nada
		Then los valores iniciales son correctos:
			| bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
			|   0   |  1  |   True      |         False         |      4     |     22      |        0     |     0     |      0     |

	Scenario: Resetear desde una partida fracasada
		Given una partida fracasada
		When reinicio el juego
		And no hago nada
		Then los valores iniciales son correctos:
			| bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
			|   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |

	Scenario: Cargar desde una partida fracasada
		Given una partida fracasada
#		Given una partida recien iniciada
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
110// numeroAleatorio
1// hayMovimiento
25// cntMovimiento
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
1// esVisible
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
136// posX
155// posY
0// altura
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
0// orientacion
134// posX
155// posY
0// altura
0// estado
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
3// orientacion
136// posX
132// posY
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
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
3// aDondeVa
3// aDondeHaLlegado
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
2// orientacion
164// posX
137// posY
0// altura
0// estado
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
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
2// aDondeVa
-6// aDondeHaLlegado
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
2// orientacion
138// posX
155// posY
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
		When no hago nada
		Then los valores iniciales son correctos:
			| bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
			|   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |      0     |
#TODO: comprobar mas cosas, numeros de personajes, frases, etc.

  Scenario: Grabar una partida
# esto solo funciona si el volcado para comparar
# y el escenario se ejecutan sobre una instancia
# recien arrancada, hay contadores de animacion,
# contador de objetos,etc. que no se limpian al reiniciar
# y provoca diferencias en el volcado
# ?sacar a otra feature para tener estos casos separados?
# ?o intentar que el reset reinicie del todo??
# ?quizas creando una nueva instancia de la clase Juego??
#  Scenario: AAGrabar una partida
#  Scenario: AA
	Given una partida recien iniciada
	When giro a la izquierda
	And  pulso espacio
	And  grabo la partida y comparo el volcado:
"""
1 // dia
4 // momentoDia
0 // duracionMomentoDia
4 // oldMomentoDia
0 // avanzarMomentoDia
31 // obsequium
0 // haFracasado
0 // investigacionCompleta
0 // bonus
239 // mascaraPuertas
1 // espejoCerrado
0 // numeroRomano
103444 // despDatosAlturaEspejo
123468 // despBloqueEspejo
0 // seAcabaLaNoche
0 // haAmanecido
0 // usandoLampara
1 // lamparaDesaparecida
0 // tiempoUsoLampara
0 // cambioEstadoLampara
0 // cntTiempoAOscuras
0 // cntLeeLibroSinGuantes
0 // pergaminoGuardado
113 // numeroAleatorio
1 // hayMovimiento
1 // cntMovimiento
0 // numPersonajeCamara
0 // opcionPersonajeCamara
// SPRITE 0
1 // esVisible
// SPRITE 1
1 // esVisible
// SPRITE 2
0 // esVisible
// SPRITE 3
0 // esVisible
// SPRITE 4
0 // esVisible
// SPRITE 5
0 // esVisible
// SPRITE 6
0 // esVisible
// SPRITE 7
0 // esVisible
// SPRITE 8
0 // esVisible
// SPRITE 9
0 // esVisible
// SPRITE 10
0 // esVisible
// SPRITE 11
0 // esVisible
// SPRITE 12
0 // esVisible
// SPRITE 13
0 // esVisible
// SPRITE 14
0 // esVisible
// SPRITE 15
0 // esVisible
// SPRITE 16
0 // esVisible
// SPRITE 17
1 // esVisible
// SPRITE 18
0 // esVisible
// SPRITE 19
0 // esVisible
// SPRITE 20
0 // esVisible
// SPRITE 21
0 // esVisible
// SPRITE 22
0 // esVisible
// SPRITE 23
0 // esVisible
// SPRITE 24
0 // esVisible
// SPRITE 25
0 // esVisible
// GUILLERMO
1 // orientacion
136 // posX
168 // posY
0 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
1 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
0 // puedeQuitarObjetos
0 // objetos
252 // mascaraObjetos
16 // contadorObjetos
8 // permisosPuertas
8 // numFotogramas
2 // incrPosY
// ADSO
1 // orientacion
134 // posX
169 // posY
0 // altura
0 // estado
2 // contadorAnimacion
0 // bajando
1 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 32 // despY
32 // valorPosicion
0 // puedeQuitarObjetos
0 // objetos
3 // mascaraObjetos
0 // contadorObjetos
8 // permisosPuertas
8 // numFotogramas
60 // mascarasPuertasBusqueda
  - 1 // aDondeVa
  - 1 // aDondeHaLlegado
0 // oldEstado
0 // movimientosFrustados
0 // cntParaDormir
// MALAQUIAS
3 // orientacion
38 // posX
39 // posY
15 // altura
0 // estado
1 // contadorAnimacion
0 // bajando
3 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
0 // puedeQuitarObjetos
0 // objetos
3 // mascaraObjetos
0 // contadorObjetos
31 // permisosPuertas
8 // numFotogramas
63 // mascarasPuertasBusqueda
2 // aDondeVa
  - 6 // aDondeHaLlegado
0 // estaMuerto
0 // estado2
0 // contadorEnScriptorium
// ABAD
3 // orientacion
136 // posX
132 // posY
2 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
3 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
1 // puedeQuitarObjetos
0 // objetos
16 // mascaraObjetos
0 // contadorObjetos
25 // permisosPuertas
8 // numFotogramas
63 // mascarasPuertasBusqueda
3 // aDondeVa
3 // aDondeHaLlegado
0 // contador
0 // numFrase
0 // guillermoBienColocado
0 // lleganLosMonjes
0 // guillermoHaCogidoElPergamino
// BERENGARIO
3 // orientacion
40 // posX
72 // posY
15 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
3 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
0 // puedeQuitarObjetos
0 // objetos
0 // mascaraObjetos
0 // contadorObjetos
31 // permisosPuertas
8 // numFotogramas
63 // mascarasPuertasBusqueda
2 // aDondeVa
  - 6 // aDondeHaLlegado
0 // encapuchado
0 // estado2
1 // estaVivo
0 // contadorPergamino
// SEVERINO
0 // orientacion
200 // posX
40 // posY
0 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
0 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
0 // puedeQuitarObjetos
0 // objetos
0 // mascaraObjetos
0 // contadorObjetos
12 // permisosPuertas
8 // numFotogramas
47 // mascarasPuertasBusqueda
2 // aDondeVa
  - 6 // aDondeHaLlegado
1 // estaVivo
// JORGE
0 // orientacion
0 // posX
0 // posY
0 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
0 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
0 // puedeQuitarObjetos
0 // objetos
0 // mascaraObjetos
0 // contadorObjetos
31 // permisosPuertas
8 // numFotogramas
63 // mascarasPuertasBusqueda
0 // aDondeVa
  - 6 // aDondeHaLlegado
0 // estaActivo
0 // contadorHuida
// BERNARDO
0 // orientacion
0 // posX
0 // posY
0 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
0 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
1 // puedeQuitarObjetos
0 // objetos
0 // mascaraObjetos
0 // contadorObjetos
31 // permisosPuertas
8 // numFotogramas
63 // mascarasPuertasBusqueda
0 // aDondeVa
  - 6 // aDondeHaLlegado
0 // estaEnLaAbadia
// PUERTA 0
1 // orientacion
97 // posX
55 // posY
2 // altura
1 // identificador
0 // estaAbierta
1 // haciaDentro
0 // estaFija
0 // hayQueRedibujar
// PUERTA 1
2 // orientacion
183 // posX
30 // posY
2 // altura
2 // identificador
0 // estaAbierta
1 // haciaDentro
0 // estaFija
0 // hayQueRedibujar
// PUERTA 2
0 // orientacion
102 // posX
95 // posY
2 // altura
4 // identificador
0 // estaAbierta
0 // haciaDentro
0 // estaFija
0 // hayQueRedibujar
// PUERTA 3
3 // orientacion
158 // posX
40 // posY
2 // altura
8 // identificador
0 // estaAbierta
1 // haciaDentro
0 // estaFija
0 // hayQueRedibujar
// PUERTA 4
3 // orientacion
126 // posX
38 // posY
2 // altura
16 // identificador
0 // estaAbierta
0 // haciaDentro
0 // estaFija
0 // hayQueRedibujar
// PUERTA 5
2 // orientacion
96 // posX
118 // posY
0 // altura
0 // identificador
1 // estaAbierta
1 // haciaDentro
1 // estaFija
0 // hayQueRedibujar
// PUERTA 6
2 // orientacion
96 // posX
123 // posY
0 // altura
0 // identificador
1 // estaAbierta
0 // haciaDentro
1 // estaFija
0 // hayQueRedibujar
// OBJETO 0
1 // orientacion
52 // posX
94 // posY
19 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
  // OBJETO 1
0 // orientacion
107 // posX
85 // posY
6 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
  // OBJETO 2
3 // orientacion
136 // posX
166 // posY
0 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
  // OBJETO 3
1 // orientacion
54 // posX
94 // posY
19 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
  // OBJETO 4
0 // orientacion
0 // posX
0 // posY
0 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
  // OBJETO 5
0 // orientacion
0 // posX
0 // posY
0 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
  // OBJETO 6
0 // orientacion
53 // posX
53 // posY
19 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
  // OBJETO 7
0 // orientacion
8 // posX
8 // posY
2 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
"""

#  Scenario: Grabar una partida
# esto solo funciona si el volcado para comparar
# y el escenario se ejecutan sobre una instancia
# recien arrancada, hay contadores de animacion,
# contador de objetos,etc. que no se limpian al reiniciar
# y provoca diferencias en el volcado
# ?sacar a otra feature para tener estos casos separados?
# ?o intentar que el reset reinicie del todo??
# ?quizas creando una nueva instancia de la clase Juego??
  Scenario: AFUUU
	Given una partida recien iniciada
	When  grabo la partida y comparo el volcado:
"""
1 // dia
4 // momentoDia
0 // duracionMomentoDia
4 // oldMomentoDia
0 // avanzarMomentoDia
31 // obsequium
0 // haFracasado
0 // investigacionCompleta
0 // bonus
239 // mascaraPuertas
1 // espejoCerrado
0 // numeroRomano
103444 // despDatosAlturaEspejo
123468 // despBloqueEspejo
0 // seAcabaLaNoche
0 // haAmanecido
0 // usandoLampara
1 // lamparaDesaparecida
0 // tiempoUsoLampara
0 // cambioEstadoLampara
0 // cntTiempoAOscuras
0 // cntLeeLibroSinGuantes
0 // pergaminoGuardado
113 // numeroAleatorio
1 // hayMovimiento
1 // cntMovimiento
0 // numPersonajeCamara
0 // opcionPersonajeCamara
// SPRITE 0
1 // esVisible
// SPRITE 1
1 // esVisible
// SPRITE 2
0 // esVisible
// SPRITE 3
0 // esVisible
// SPRITE 4
0 // esVisible
// SPRITE 5
0 // esVisible
// SPRITE 6
0 // esVisible
// SPRITE 7
0 // esVisible
// SPRITE 8
0 // esVisible
// SPRITE 9
0 // esVisible
// SPRITE 10
0 // esVisible
// SPRITE 11
0 // esVisible
// SPRITE 12
0 // esVisible
// SPRITE 13
0 // esVisible
// SPRITE 14
0 // esVisible
// SPRITE 15
0 // esVisible
// SPRITE 16
0 // esVisible
// SPRITE 17
0 // esVisible
// SPRITE 18
0 // esVisible
// SPRITE 19
0 // esVisible
// SPRITE 20
0 // esVisible
// SPRITE 21
0 // esVisible
// SPRITE 22
0 // esVisible
// SPRITE 23
0 // esVisible
// SPRITE 24
0 // esVisible
// SPRITE 25
0 // esVisible
// GUILLERMO
0 // orientacion
136 // posX
168 // posY
0 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
0 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
0 // puedeQuitarObjetos
32 // objetos
252 // mascaraObjetos
0 // contadorObjetos
8 // permisosPuertas
8 // numFotogramas
2 // incrPosY
// ADSO
1 // orientacion
134 // posX
170 // posY
0 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
1 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 32 // despY
32 // valorPosicion
0 // puedeQuitarObjetos
0 // objetos
3 // mascaraObjetos
0 // contadorObjetos
8 // permisosPuertas
8 // numFotogramas
60 // mascarasPuertasBusqueda
  - 1 // aDondeVa
  - 1 // aDondeHaLlegado
0 // oldEstado
0 // movimientosFrustados
0 // cntParaDormir
// MALAQUIAS
0 // orientacion
38 // posX
38 // posY
15 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
0 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
0 // puedeQuitarObjetos
0 // objetos
3 // mascaraObjetos
0 // contadorObjetos
31 // permisosPuertas
8 // numFotogramas
63 // mascarasPuertasBusqueda
2 // aDondeVa
  - 6 // aDondeHaLlegado
0 // estaMuerto
0 // estado2
0 // contadorEnScriptorium
// ABAD
0 // orientacion
136 // posX
132 // posY
2 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
0 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
1 // puedeQuitarObjetos
0 // objetos
16 // mascaraObjetos
0 // contadorObjetos
25 // permisosPuertas
8 // numFotogramas
63 // mascarasPuertasBusqueda
3 // aDondeVa
  - 6 // aDondeHaLlegado
0 // contador
0 // numFrase
0 // guillermoBienColocado
0 // lleganLosMonjes
0 // guillermoHaCogidoElPergamino
// BERENGARIO
0 // orientacion
40 // posX
72 // posY
15 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
0 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
0 // puedeQuitarObjetos
0 // objetos
0 // mascaraObjetos
0 // contadorObjetos
31 // permisosPuertas
8 // numFotogramas
63 // mascarasPuertasBusqueda
2 // aDondeVa
  - 6 // aDondeHaLlegado
0 // encapuchado
0 // estado2
1 // estaVivo
0 // contadorPergamino
// SEVERINO
0 // orientacion
200 // posX
40 // posY
0 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
0 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
0 // puedeQuitarObjetos
0 // objetos
0 // mascaraObjetos
0 // contadorObjetos
12 // permisosPuertas
8 // numFotogramas
47 // mascarasPuertasBusqueda
2 // aDondeVa
  - 6 // aDondeHaLlegado
1 // estaVivo
// JORGE
0 // orientacion
0 // posX
0 // posY
0 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
0 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
0 // puedeQuitarObjetos
0 // objetos
0 // mascaraObjetos
0 // contadorObjetos
31 // permisosPuertas
8 // numFotogramas
63 // mascarasPuertasBusqueda
0 // aDondeVa
  - 6 // aDondeHaLlegado
0 // estaActivo
0 // contadorHuida
// BERNARDO
0 // orientacion
0 // posX
0 // posY
0 // altura
0 // estado
0 // contadorAnimacion
0 // bajando
0 // orientacion
0 // enDesnivel
0 // giradoEnDesnivel
0 // flipX
49152 // despFlipX
  - 2 // despX
  - 34 // despY
16 // valorPosicion
1 // puedeQuitarObjetos
0 // objetos
0 // mascaraObjetos
0 // contadorObjetos
31 // permisosPuertas
8 // numFotogramas
63 // mascarasPuertasBusqueda
0 // aDondeVa
  - 6 // aDondeHaLlegado
0 // estaEnLaAbadia
// PUERTA 0
1 // orientacion
97 // posX
55 // posY
2 // altura
1 // identificador
0 // estaAbierta
1 // haciaDentro
0 // estaFija
0 // hayQueRedibujar
// PUERTA 1
2 // orientacion
183 // posX
30 // posY
2 // altura
2 // identificador
0 // estaAbierta
1 // haciaDentro
0 // estaFija
0 // hayQueRedibujar
// PUERTA 2
0 // orientacion
102 // posX
95 // posY
2 // altura
4 // identificador
0 // estaAbierta
0 // haciaDentro
0 // estaFija
0 // hayQueRedibujar
// PUERTA 3
3 // orientacion
158 // posX
40 // posY
2 // altura
8 // identificador
0 // estaAbierta
1 // haciaDentro
0 // estaFija
0 // hayQueRedibujar
// PUERTA 4
3 // orientacion
126 // posX
38 // posY
2 // altura
16 // identificador
0 // estaAbierta
0 // haciaDentro
0 // estaFija
0 // hayQueRedibujar
// PUERTA 5
2 // orientacion
96 // posX
118 // posY
0 // altura
0 // identificador
1 // estaAbierta
1 // haciaDentro
1 // estaFija
0 // hayQueRedibujar
// PUERTA 6
2 // orientacion
96 // posX
123 // posY
0 // altura
0 // identificador
1 // estaAbierta
0 // haciaDentro
1 // estaFija
0 // hayQueRedibujar
// OBJETO 0
1 // orientacion
52 // posX
94 // posY
19 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
  // OBJETO 1
0 // orientacion
107 // posX
85 // posY
6 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
  // OBJETO 2
0 // orientacion
0 // posX
0 // posY
0 // altura
0 // seEstaCogiendo
1 // seHaCogido
0 // numPersonaje
// OBJETO 3
1 // orientacion
54 // posX
94 // posY
19 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
  // OBJETO 4
0 // orientacion
0 // posX
0 // posY
0 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
  // OBJETO 5
0 // orientacion
0 // posX
0 // posY
0 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
  // OBJETO 6
0 // orientacion
53 // posX
53 // posY
19 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
  // OBJETO 7
0 // orientacion
8 // posX
8 // posY
2 // altura
0 // seEstaCogiendo
0 // seHaCogido
  - 1 // numPersonaje
"""
