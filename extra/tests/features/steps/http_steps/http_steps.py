from behave import *
import json
import requests

#TODO: meter la direccion y puerto en una constante, en configuracion
# o que se inicialice al principio del escenario

# TODO: volver a activar cuando tengamos recurso status
@given('una conexion a la interfaz')
def step_impl(context):
    print("timeout "+str(context.timeout));
    assert True
#    print("conectando a recurso status para comprobar webserver operativo");
#    r=requests.get('http://localhost:4477/',timeout=context.timeout)
#    print("status:***"+str(r.status_code)+"***text***"+r.text+"***");
#    assert r.status_code==200
#    assert r.text=="Hola mundo"
#    r=requests.get('http://localhost:4477/status',timeout=context.timeout)
#    print("status:***"+str(r.status_code)+"***text***"+r.text+"***");
##    assert r.status_code==200
#    assert r.text=="OK"

@given('una conexion existente a la interfaz')
def step_impl(context):
    context.execute_steps('''
	Given una conexion a la interfaz
    ''');

@when('hago una peticion con un Accept invalido')
def step_impl(context):
    r=requests.get(context.url+'/current', headers={"accept":"FAKE"},timeout=context.timeout)
# TODO: este assert debería ir en el then
    assert r.status_code==400
    context.dump=r.json()

@when('hago un POST al juego actual')
def step_impl(context):
    r=requests.post(context.url+'/current', timeout=context.timeout)
# TODO: este assert debería ir en el then
    assert r.status_code==404
    context.dump=r.text.rstrip()

@when('mando un comando desconocido')
def step_impl(context):
    r=requests.post(context.url+'/current/actions/'+'FAKE',timeout=context.timeout)
# TODO: este assert debería ir en el then
    assert r.status_code==400
    context.dump=r.json()


@when('reinicio el juego')
def step_impl(context):
    r=requests.post(context.url,timeout=context.timeout)
    assert r.status_code==200

@when('mando el comando "{comando}"')
def step_impl(context,comando):
    r=requests.post(context.url+'/current/actions/'+comando,timeout=context.timeout)
    assert r.status_code==200

@when('no hago nada')
def step_impl(context):
    r=requests.post(context.url+'/current/actions/NOP',timeout=context.timeout)
    assert r.status_code==200

@when('digo que SI')
def step_impl(context):
    r=requests.post(context.url+'/current/actions/SI',timeout=context.timeout)
    assert r.status_code==200

@when('digo que NO')
def step_impl(context):
    r=requests.post(context.url+'/current/actions/NO',timeout=context.timeout)
    assert r.status_code==200

@when('giro a la izquierda')
def step_impl(context):
    r=requests.post(context.url+'/current/actions/LEFT',timeout=context.timeout)
    assert r.status_code==200

@when('giro a la derecha')
def step_impl(context):
    r=requests.post(context.url+'/current/actions/RIGHT',timeout=context.timeout)
    assert r.status_code==200

@when('doy media vuelta')
def step_impl(context):
    r=requests.post(context.url+'/current/actions/RIGHT',timeout=context.timeout)
    assert r.status_code==200
    r=requests.post(context.url+'/current/actions/RIGHT',timeout=context.timeout)
    assert r.status_code==200

@when('avanzo')
def step_impl(context):
    r=requests.post(context.url+'/current/actions/UP',timeout=context.timeout)
    assert r.status_code==200

@when('avanzo "{numeroPasos}" pasos')
def step_impl(context,numeroPasos):
#    i=0;
#    while i < int(numeroPasos):
#     r=requests.post(context.url+'/current/actions/UP',timeout=context.timeout)
#     assert r.status_code==200
# El segundo UP es porque el movimiento de avanzar necesita de 2 ciclos para completar la animacion de dar pasos
# Tambien vale con enviar un NOP
# Pero es mas realista enviar 2 UP, que es lo que haria un jugador humano, dejar pulsado UP hasta que ve ha terminado de avanzar
#     r=requests.post(context.url+'/current/actions/UP',timeout=context.timeout)
#     assert r.status_code==200
#     i+=1;
     r=requests.post(context.url+'/current/actions/UP?repeat='+str(int(numeroPasos)*2),timeout=context.timeout)
     assert r.status_code==200

@when('Adso avanza "{numeroPasos}" pasos')
def step_impl(context,numeroPasos):
#    i=0;
#    while i < int(numeroPasos):
#     r=requests.post(context.url+'/current/actions/DOWN',timeout=context.timeout)
#     assert r.status_code==200
#     i+=1;
     r=requests.post(context.url+'/current/actions/DOWN?repeat='+numeroPasos,timeout=context.timeout)
     assert r.status_code==200


@when('espero "{numeroIteraciones}" iteraciones')
def step_impl(context,numeroIteraciones):
#    i=0;
#    while i < int(numeroIteraciones):
#     r=requests.post(context.url+'/current/actions/NOP',timeout=context.timeout)
#     assert r.status_code==200
#     i+=1;
     r=requests.post(context.url+'/current/actions/NOP?repeat='+numeroIteraciones,timeout=context.timeout)
     assert r.status_code==200

@when('pulso espacio')
def step_impl(context):
    r=requests.post(context.url+'/current/actions/SPACE',timeout=context.timeout)
    assert r.status_code==200

@when('cargo una partida')
def step_impl(context):
    r=requests.put(context.url+'/current',context.text,timeout=context.timeout)
    assert r.status_code==200

@step('grabo la partida')
def step_impl(context):
    r=requests.get(context.url+'/current', headers={"accept":"text/x.abadIA+plain"},timeout=context.timeout)
    print("***partida recibida***");
    print(r.text);
    assert r.status_code==200
# TODO: no se por que en el body hay una línea en blanco al final
    assert r.text.count('\n')==431

@step('grabo la partida y comparo el volcado')
def step_impl(context):
    print("lineas partida esperada: "+context.text.count('\n')+1);
    assert context.text.count('\n')+1==431;
    r=requests.get(context.url+'/current', headers={"accept":"text/x.abadIA+plain"},timeout=context.timeout)
    print("***partida recibida***");
    print(r.text);
    print("***partida esperada***");
    print(context.text);
    assert r.status_code==200
# TODO: no se por que en el body hay una línea en blanco al final
    assert r.text.count('\n')==431
    assert context.text==r.text

# TODO: comparar contra tabla para poder ampliar lo que se comprueba
@then('el resultado es "{resultado}" con descripcion "{descripcion}"')
def step_impl(context,resultado,descripcion):
	assert context.dump["resultado"]==resultado
	assert context.dump["descripcion"]==descripcion

@then('el resultado es "{resultado}"')
def step_impl(context,resultado):
	print("mmmm *"+context.dump+"**"+resultado+"**");
	assert context.dump==resultado

#@then('los valores iniciales son correctos')
@step('los valores iniciales son correctos')
def step_impl(context):
    r=requests.get(context.url+'/current', headers={"accept":"application/json"},timeout=context.timeout)
    assert r.status_code==200
    print("resultDUMP**"+str(r.json()));
    print("resultDUMPtext**"+r.text);
    dump = r.json() 
    context.dump=dump;
    for head in context.table[0].headings:
      print("***"+head+"***"+type(dump[head]).__name__+"***valor recibido***"+str(dump[head])+"***valor esperado***"+str(context.table[0][head])+"***"); 
      if (type(dump[head]).__name__=="bool"):
       #assert dump[head]==bool(context.table[0][head])
       assert str(dump[head])==(context.table[0][head])
      else:
       if (type(dump[head]).__name__=="int"):
        assert dump[head]==int(context.table[0][head])
       else:
        assert False 
