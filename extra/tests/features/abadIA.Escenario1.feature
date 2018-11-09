# TODO
# seguir http://behave.github.io/behave.example/tutorials/tutorial09.html para hacer RESET antes de cada escenario
# y empezar con una partida limpia
# ?se podria pasar argumento al RESET para cargar un escenario u otro???

# ejecutar con -Dinterfaz=websocket o -Dinterfaz=http segun la interfaz a probar

Feature: Escenario1 abadIA
# es un escenario simple en el que se acaba la partida al pasar a la segunda pantalla 

  Scenario: Pasar primera pantalla
	Given una partida recien iniciada
	When giro a la izquierda
	And avanzo "9" pasos
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |    True     |          True         |      4     |     22      |        0     |     31    |    0   |    100     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
         | altura | id | nombre    | objetos | orientacion | posX | posY |
         |    0   |  0 | Guillermo |    32   |      1      |  136 |  159 |
         |    0   |  1 |  Adso     |     0   |      1      |  134 |  160 |
#	And giro a la derecha
	And no hago nada
	And pulso espacio
#	And los valores iniciales son correctos:
#           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
#           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
#        And la lista de "Personajes" tiene "2" elementos
#        And los valores de los "Personajes" son correctos:
#         | altura | id | nombre    | objetos | orientacion | posX | posY |
#         |    0   |  0 | Guillermo |     0   |      0      |  136 |  159 |
#         |    0   |  1 |  Adso     |     0   |      1      |  134 |  160 |
#        And la lista de "Objetos" tiene "1" elementos
#	And los valores de los "Objetos" son correctos:
#	 | altura | id | orientacion | posX | posY |
#	 |   0    |  2 |      2      |  138 |  138 |
#	And giro a la derecha
#	And espero "40" iteraciones 
#       	And los valores iniciales son correctos:
#           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
#           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
#        And la lista de "Objetos" tiene "1" elementos
#	And los valores de los "Objetos" son correctos:
#	 | altura | id | orientacion | posX | posY |
#	 |   0    |  2 |      2      |  138 |  138 |
#	And giro a la izquierda
#       	And los valores iniciales son correctos:
#           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
#           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
#        And la lista de "Objetos" tiene "1" elementos
#	And no hago nada
#       	And los valores iniciales son correctos:
#           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
#           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
#        And la lista de "Objetos" tiene "1" elementos
#	And no hago nada
#       	And los valores iniciales son correctos:
#           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
#           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
#        And la lista de "Objetos" tiene "0" elementos
#	And espero "14" iteraciones 
#	And pulso espacio
#       	And los valores iniciales son correctos:
#           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
#           |   0   |  1  |   False     |         False         |      4     |     22      |        0     |     31    |    0   |      0     |
#        And la lista de "Objetos" tiene "1" elementos
