from behave import *
import json
import requests

@given('una conexion a la interfaz')
def step_impl(context):
    print("conectando a recurso status para comprobar webserver operativo");
    r=requests.get('http://localhost:4477/')
    print("status:***"+str(r.status_code)+"***text***"+r.text+"***");
    assert r.status_code==200
    assert r.text=="Hola mundo"
    r=requests.get('http://localhost:4477/status')
    print("status:***"+str(r.status_code)+"***text***"+r.text+"***");
#    assert r.status_code==200
    assert r.text=="OK"

@given('una conexion existente a la interfaz')
def step_impl(context):
    context.execute_steps('''
	Given una conexion a la interfaz
    ''');

@when('reinicio el juego')
def step_impl(context):
    r=requests.post('http://localhost:4477/cmd/RESET')
    assert r.status_code==200

@when('mando el comando "{comando}"')
def step_impl(context,comando):
    r=requests.post('http://localhost:4477/'+comando)
    assert r.status_code==200

@when('no hago nada')
def step_impl(context):
    r=requests.post('http://localhost:4477/cmd/NOP')
    assert r.status_code==200

@when('giro a la izquierda')
def step_impl(context):
    r=requests.post('http://localhost:4477/cmd/LEFT')
    assert r.status_code==200

@when('giro a la derecha')
def step_impl(context):
    r=requests.post('http://localhost:4477/cmd/RIGHT')
    assert r.status_code==200

@when('avanzo')
def step_impl(context):
    r=requests.post('http://localhost:4477/cmd/UP')
    assert r.status_code==200

@when('avanzo "{numeroPasos}" pasos')
def step_impl(context,numeroPasos):
    i=0;
    while i < int(numeroPasos):
     r=requests.post('http://localhost:4477/cmd/UP')
     assert r.status_code==200
# El segundo UP es porque el movimiento de avanzar necesita de 2 ciclos para completar la animacion de dar pasos
# Tambien vale con enviar un NOP
# Pero es mas realista enviar 2 UP, que es lo que haria un jugador humano, dejar pulsado UP hasta que ve ha terminado de avanzar
     r=requests.post('http://localhost:4477/cmd/UP')
     assert r.status_code==200
     i+=1;

@when('espero "{numeroIteraciones}" iteraciones')
def step_impl(context,numeroIteraciones):
    i=0;
    while i < int(numeroIteraciones):
     r=requests.post('http://localhost:4477/cmd/NOP')
     assert r.status_code==200
     i+=1;

@when('pulso espacio')
def step_impl(context):
    r=requests.post('http://localhost:4477/cmd/SPACE')
    assert r.status_code==200

@when('cargo una partida')
def step_impl(context):
    r=requests.post('http://localhost:4477/load',context.text)
    assert r.status_code==200

#@then('los valores iniciales son correctos')
@step('los valores iniciales son correctos')
def step_impl(context):
    r=requests.post('http://localhost:4477/cmd/DUMP')
    assert r.status_code==200
    print("resultDUMP**"+str(r.json()));
    print("resultDUMPtext**"+r.text);
    dump = r.json() 
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
