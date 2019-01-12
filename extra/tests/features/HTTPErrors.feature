# ejecutar con -Dinterfaz=http 
# no tienen sentido en la interfaz websocket

Feature: Errores HTTP
# Pruebas de peticiones invalidas para comprobar los errores devueltos

  Scenario: Accept no soportado
	Given una conexion a la interfaz
	When hago una peticion con un Accept invalido
	Then el resultado es "KO" con descripcion "Unsupported type"

  Scenario: POST en juego actual
	Given una conexion a la interfaz
	When hago un POST al juego actual
	Then el resultado es "404 Not Found"

  Scenario: Comando desconocido
	Given una conexion a la interfaz
	When mando un comando desconocido
	Then el resultado es "KO" con descripcion "Comando desconocido"


