from behave import *
from websocket import create_connection
import json

@given('una conexion a la interfaz websocket')
def step_impl(context):
    context.ws = create_connection("ws://localhost:4477/ws")
    pass

@given('una conexion existente a la interfaz websocket')
def step_impl(context):
    assert context.ws is not None 

@given('una partida recien iniciada')
def step_impl(context):
    context.execute_steps('''
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
    ''');

@when('reinicio el juego')
def step_impl(context):
    context.ws.send("RESET");
    assert True is not False

@when('mando el comando "{comando}"')
def step_impl(context,comando):
    context.ws.send(comando);

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
        And la lista de personajes tiene "2" elementos
        And los valores de los personajes son correctos:
           | altura | id | nombre    | orientacion | posX | posY |
           |    0   |  0 | Guillermo |       1     |  136 |  168 |
           |    0   |  1 |  Adso     |       1     |  134 |  169 |
        And la lista de frases tiene "0" elementos
    ''');
    assert True is not False

@when('giro a la izquierda')
def step_impl(context):
#    context.ws.send("LEFT");
    print("giro a la izquierda "+context.table[0]["posX"]);
    steps='''
	Given una conexion existente a la interfaz websocket
	When mando el comando "LEFT"
        Then los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |   False     |         False         |      4     |     23      |        0     |     31    |      0     |
        And la lista de personajes tiene "2" elementos
        And los valores de los personajes son correctos:
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



@then('los valores iniciales son correctos')
def step_impl(context):
    context.ws.send("NOP");
    context.ws.send("NOP");
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

@then('la lista de personajes tiene "{numeroElementos}" elementos')
def step_impl(context,numeroElementos):
    assert(len(context.dump["Personajes"])==int(numeroElementos));

@then('los valores de los personajes son correctos')
def step_impl(context):
    assert( context.dump["Personajes"][0]["nombre"] == "Guillermo" );
    dump = context.dump["Personajes"];
    assert( dump[0]["nombre"] == "Guillermo" );
    i=0;
    for row in dump:
     for head in context.table[i].headings:
       print("***"+head+"***"+type(row[head]).__name__+"***"+str(row[head])+"***"+str(context.table[i][head])); 
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

@then('la lista de frases tiene "{numeroElementos}" elementos')
def step_impl(context,numeroElementos):
    print("nElem frase "+str(len(context.dump["frases"])));
    print("dump "+str(context.dump));
    assert(len(context.dump["frases"])==int(numeroElementos));

@then('los elementos de la lista de frases son')
def step_impl(context):
#TODO falta revisar implementacion
    assert False;
#    i=0;
#    for row in context.dump["frases"]:
#     for head in context.table[i].headings:
#       print("***"+head+"***"+type(row[head]).__name__+"***"+str(row[head])+"***"+str(context.table[i][head])); 
#       if (type(row[head]).__name__=="int"):
#        assert row==int(context.table[i][head])
#       else:
#        assert False 
#     i=i+1;

# esto no parece servir para cortar las desconexiones abruptas
def after_scenario(context,scenario):
    context.ws.close();

