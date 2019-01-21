

Feature: Multicommand
#  Pruebas enviar varios comandos en cada petición HTTP

  Scenario: ABC
	Given una partida recien iniciada
	When mando los comandos:
"""
[ { "command": "LEFT" } , { "command": "UP" , "repeat": 4 } ]
"""
	And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | planta | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |    0   |      0     |
        And la lista de "Personajes" tiene "2" elementos

  Scenario: DEF
	Given una partida recien iniciada
	When mando los comandos:
"""
[ 
{ "command": "LEFT" } , 
{ "command": "UP" , "repeat":38  } ,
{ "command": "NOP" , "repeat":101  } ,
{ "command": "UP" , "repeat":20  } ,
{ "command": "NOP" } ,
{ "command": "RIGHT" } , 
{ "command": "UP" , "repeat":54  } ,
{ "command": "NOP" } ,
{ "command": "LEFT" } , 
{ "command": "UP" , "repeat":132  } ,
{ "command": "NOP" } ,
{ "command": "RIGHT" } , 
{ "command": "UP" , "repeat":60  } ,
{ "command": "NOP" } ,
{ "command": "LEFT" } , 
{ "command": "UP" , "repeat":34  } ,
{ "command": "NOP" , "repeat":10  } ,
{ "command": "UP" , "repeat":20  } ,
{ "command": "NOP" } ,
{ "command": "RIGHT" } , 
{ "command": "UP" , "repeat":8  } ,
{ "command": "NOP" } ,
{ "command": "LEFT" } , 
{ "command": "UP" , "repeat":14  } ,
{ "command": "NOP" } ,
{ "command": "LEFT" } , 
{ "command": "UP" , "repeat":10  } ,
{ "command": "NOP" } ,
{ "command": "RIGHT" } , 
{ "command": "UP" , "repeat":4  } ,
{ "command": "NOP" } ,
{ "command": "LEFT" } , 
{ "command": "UP" , "repeat":50  } ,
{ "command": "NOP" } ,
{ "command": "RIGHT" } , 
{ "command": "UP" , "repeat":20  } ,
{ "command": "NOP" } ,
{ "command": "NOP" } ,
{ "command": "LEFT" } , 
{ "command": "NOP" , "repeat":2  } 
]
"""
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
