# TODO
# seguir http://behave.github.io/behave.example/tutorials/tutorial09.html para hacer RESET antes de cada escenario
# y empezar con una partida limpia
# ?se podria pasar argumento al RESET para cargar un escenario u otro???

Feature: Interfaz websocket abadIA

  Scenario: Inicializacion del juego
     Given una conexion a la interfaz websocket
      When reinicio el juego
     Then los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
      And la lista de personajes tiene "2" elementos
      And los valores de los personajes son correctos:
       | altura | id | nombre    | orientacion | posX | posY |
       |    0   |  0 | Guillermo |       0     |  136 |  168 |
       |    0   |  1 |  Adso     |       1     |  134 |  170 |
      And la lista de frases tiene "0" elementos
#      And los elementos de la lista de frases son:
#       | id |
#       | 56 |

  Scenario: Movimientos basicos
	Given una partida recien iniciada
	When giro a la izquierda:
         | altura | id | nombre    | orientacion | posX | posY |
         |    0   |  0 | Guillermo |       1     |  136 |  168 |
         |    0   |  1 |  Adso     |       1     |  134 |  169 |
 #	And giro por segunda vez a la izquierda
#	And giro por tercera vez a la izquierda
#	And giro por cuarta vez a la izquierda
#	And avanzo
#	And giro a la derecha
#	And avanzo una segunda vez
#	And avanzo una tercera vez
#	And giro por segunda vez a la derecha
#	Then los valores finales son correctos
#           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
#           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
#	And la lista de personajes tiene "2" elemenetos
#	And los valores de los personajes son correctos
#	   | altura | id | nombre    | orientacion | posX | posY |
#           |    0   |  0 | Guillermo |       0     |  136 |  168 |
#           |    0   |  1 |  Adso     |       1     |  134 |  170 |
# 	And la lista de frases tiene "0" elementos
