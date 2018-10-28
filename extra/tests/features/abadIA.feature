# TODO
# seguir http://behave.github.io/behave.example/tutorials/tutorial09.html para hacer RESET antes de cada escenario
# y empezar con una partida limpia
# ?se podria pasar argumento al RESET para cargar un escenario u otro???

Feature: Interfaz websocket abadIA

  Scenario: Inicializacion del juego
     Given una conexion a la interfaz websocket
      When reinicio el juego
      And no hago nada
##      And no hago nada
     Then los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
      And la lista de "Personajes" tiene "2" elementos
      And los valores de los "Personajes" son correctos:
       | altura | id | nombre    | orientacion | posX | posY |
       |    0   |  0 | Guillermo |       0     |  136 |  168 |
       |    0   |  1 |  Adso     |       1     |  134 |  170 |
      And la lista de "frases" tiene "1" elementos
      And la lista de "Objetos" tiene "0" elementos
#      And los elementos de la lista de frases son:
#       | id |
#       | 56 |

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
	And no hago nada
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Objetos" tiene "1" elementos
	And no hago nada
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Objetos" tiene "0" elementos
	And espero "14" iteraciones 
	And pulso espacio
       	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
        And la lista de "Objetos" tiene "1" elementos




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
