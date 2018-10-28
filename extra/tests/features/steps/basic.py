# ojo, ahora se depende de que al hacer "then los valores iniciales son correctos"
# se hace un dump dentro
# hay que poner dump tras cada paso o explicitamente en la definicion de pasos
# TODO: ?si los params van sin entrecomillar se consideran enteros y no hay que hacer conversion?

from behave import *
from websocket import create_connection
import json

@given('una conexion a la interfaz websocket')
def step_impl(context):
    print("conectando al websocket");
    context.ws = create_connection("ws://localhost:4477/ws")
    assert context.ws is not None 

@given('una conexion existente a la interfaz websocket')
def step_impl(context):
    assert context.ws is not None 

@given('una partida recien iniciada')
def step_impl(context):
    context.execute_steps('''
	Given una conexion a la interfaz websocket
	When reinicio el juego
        And no hago nada
        Then los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
           | altura | id | nombre    | orientacion | posX | posY |
           |    0   |  0 | Guillermo |       0     |  136 |  168 |
           |    0   |  1 |  Adso     |       1     |  134 |  170 |
        And la lista de "frases" tiene "1" elementos
    ''');

@when('reinicio el juego')
def step_impl(context):
    context.ws.send("RESET");
    assert True is not False

@when('mando el comando "{comando}"')
def step_impl(context,comando):
    context.ws.send(comando);

@when('no hago nada')
def step_impl(context):
    context.execute_steps('''
	Given una conexion existente a la interfaz websocket
	When mando el comando "NOP"
    ''');


@when('VERSION VALORES A FUEGO giro a la izquierda')
def step_impl(context):
#    context.ws.send("LEFT");
    print("giro a la izquierda "+context.table[0]["posX"]);
    context.execute_steps('''
	Given una conexion existente a la interfaz websocket
	When mando el comando "LEFT"
        Then los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
           | altura | id | nombre    | orientacion | posX | posY |
           |    0   |  0 | Guillermo |       1     |  136 |  168 |
           |    0   |  1 |  Adso     |       1     |  134 |  169 |
        And la lista de "frases" tiene "0" elementos
    ''');
    assert True is not False

@when('giro a la izquierda')
def step_impl(context):
    context.ws.send("LEFT");
#    context.execute_steps('''
#	Given una conexion existente a la interfaz websocket
#	When mando el comando "LEFT"
#    ''');

@when('giro a la derecha')
def step_impl(context):
    context.ws.send("RIGHT");

@when('avanzo')
def step_impl(context):
    context.ws.send("UP");

@when('avanzo "{numeroPasos}" pasos')
def step_impl(context,numeroPasos):
    i=0;
    while i < int(numeroPasos):
     context.ws.send("UP");
# El segundo UP es porque el movimiento de avanzar necesita de 2 ciclos para completar la animacion de dar pasos
# Tambien vale con enviar un NOP
# Pero es mas realista enviar 2 UP, que es lo que haria un jugador humano, dejar pulsado UP hasta que ve ha terminado de avanzar
     context.ws.send("UP"); 
     i+=1;

@when('espero "{numeroIteraciones}" iteraciones')
def step_impl(context,numeroIteraciones):
    i=0;
    while i < int(numeroIteraciones):
     context.ws.send("NOP");
     i+=1;

@when('pulso espacio')
def step_impl(context):
    context.ws.send("SPACE");

@when('VERSION SEMI giro a la izquierda')
def step_impl(context):
#    context.ws.send("LEFT");
    print("giro a la izquierda "+context.table[0]["posX"]);
    steps='''
	Given una conexion existente a la interfaz websocket
	When mando el comando "LEFT"
        Then los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de "Personajes" tiene "2" elementos
        And los valores de los "Personajes" son correctos:
           | altura | id | nombre    | orientacion | posX | posY |''';
    for row in context.table:
     fila='\n|';
     for head in context.table[0].headings:
       fila=fila+'%s|' % row[head];
     #esto falla si no hay tabla con al menos una columna ya que queda un \n| suelto
#       fila='\n|'+row["altura"]+'|'+row["id"]+'|'+row["nombre"]+'|';
     steps=steps+'%s' % (fila);
    print("giro a la izquierda ***"+steps+"***");
    context.execute_steps(steps);
    
#           | altura | id | nombre    | orientacion | posX | posY |
#           |    0   |  0 | Guillermo |       1     |  136 |  168 |
#           |    0   |  1 |  Adso     |       1     |  134 |  169 |
#        And la lista de frases tiene "0" elementos
#    ''');

#    assert True is False
#    assert True is not False



#@then('los valores iniciales son correctos')
@step('los valores iniciales son correctos')
def step_impl(context):
#    context.ws.send("NOP");
#    context.ws.send("NOP");
    context.ws.send("DUMP");
    result = context.ws.recv();
    print("result**"+result);
    dump = json.loads(result)
    context.dump=dump;
    for head in context.table[0].headings:
      print("***"+head+"***"+type(dump[head]).__name__+"***"+str(dump[head])+"***"+str(context.table[0][head])); 
      if (type(dump[head]).__name__=="bool"):
       #assert dump[head]==bool(context.table[0][head])
       assert str(dump[head])==(context.table[0][head])
      else:
       if (type(dump[head]).__name__=="int"):
        assert dump[head]==int(context.table[0][head])
       else:
        assert False 

@step('la lista de "{nombreLista}" tiene "{numeroElementos}" elementos')
def step_impl(context,nombreLista,numeroElementos):
    print("la lista de "+nombreLista+" tiene "+numeroElementos+ " elementos");
    assert(len(context.dump[nombreLista])==int(numeroElementos));

##@then('la lista de personajes tiene "{numeroElementos}" elementos')
#@step('la lista de personajes tiene "{numeroElementos}" elementos')
#def step_impl(context,numeroElementos):
#    assert(len(context.dump["Personajes"])==int(numeroElementos));

##@then('los valores de los personajes son correctos')
#@step('los valores de los personajes son correctos')
#def step_impl(context):
@step('los valores de los "{nombreLista}" son correctos')
def step_impl(context,nombreLista):
#    print("len tabla "+str(len(context.table.rows)));
#    assert False
#    assert( context.dump["Personajes"][0]["nombre"] == "Guillermo" );
#    dump = context.dump["Personajes"];
    dump = context.dump[nombreLista];
#    assert( dump[0]["nombre"] == "Guillermo" );
    i=0;
    for row in dump:
     if (i<len(context.table.rows)):
      for head in context.table[i].headings:
        if (context.table[i][head] != "__DO_NOT_CHECK__"):
         print("***"+head+"***"+type(row[head]).__name__+"***valor volcado***"+str(row[head])+"***valor esperado***"+str(context.table[i][head])); 
         if (type(row[head]).__name__=="bool"):
          assert str(row[head])==(context.table[i][head])
         else:
          if (type(row[head]).__name__=="int"):
           assert row[head]==int(context.table[i][head])
          else:
           if (type(row[head]).__name__=="str"):
            assert row[head]==context.table[i][head]
           else:
            assert False 
     i=i+1;

#@then('la lista de frases tiene "{numeroElementos}" elementos')
#def step_impl(context,numeroElementos):
#    print("nElem frase "+str(len(context.dump["frases"])));
#    print("dump "+str(context.dump));
#    assert(len(context.dump["frases"])==int(numeroElementos));

#@then('los elementos de la lista de frases son')
@step('los elementos de la lista de frases son')
def step_impl(context):
#TODO falta revisar implementacion
#    assert False;
    i=0;
    for row in context.dump["frases"]:
     for head in context.table[i].headings:
       print("***"+head+"***"+type(row).__name__+"***recibido***"+str(row)+"***esperado***"+str(context.table[i][head])); 
       if (type(row).__name__=="int"):
        assert row==int(context.table[i][head])
       else:
        assert False 
     i=i+1;

# TypeError: 'int' object is not subscriptable

# esto no parece servir para cortar las desconexiones abruptas
def after_scenario(context,scenario):
    context.ws.close();

