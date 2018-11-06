# ojo, ahora se depende de que al hacer "then los valores iniciales son correctos"
# se hace un dump dentro
# hay que poner dump tras cada paso o explicitamente en la definicion de pasos
# TODO: ?si los params van sin entrecomillar se consideran enteros y no hay que hacer conversion?

#TODO: mirar el directorio a con una prueba usando
# https://github.com/behave/behave/blob/master/features/step.use_step_library.feature
# https://github.com/behave/behave/blob/master/features/userdata.feature
# para poder usar distintas implementaciones de los steps segun estéusando
# websocket o rest
# viene de https://github.com/behave/behave/issues/279

from behave import *
#from websocket import create_connection
import json
import requests

@step('prueba HTTP')
def step_impl(context):
	r=requests.get('http://localhost:4477/')
	print("status:***"+str(r.status_code)+"***text***"+r.text+"***");
	assert r.status_code==200
	assert r.text=="Hola mundo"
	

@given('una partida recien iniciada')
def step_impl(context):
    context.execute_steps('''
	Given una conexion a la interfaz
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
        And la lista de "frases" tiene "0" elementos
    ''');

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
#@step('los elementos de la lista de frases son')
@step('los elementos de la lista de "{nombreLista}" son')
def step_impl(context,nombreLista):
#TODO falta revisar implementacion
#    assert False;
    i=0;
    for row in context.dump[nombreLista]:
     for head in context.table[i].headings:
       print("***i:"+str(i)+"***"+head+"***"+type(row).__name__+"***recibido***"+str(row)+"***esperado***"+str(context.table[i][head])); 
       if (type(row).__name__=="int"):
        assert row==int(context.table[i][head])
       else:
        assert False 
     i=i+1;

