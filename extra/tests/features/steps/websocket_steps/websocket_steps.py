from behave import *
from websocket import create_connection
import json

@given('una conexion a la interfaz')
def step_impl(context):
    print("conectando al websocket");
    context.ws = create_connection(context.url)
    assert context.ws is not None 
    context.ws.settimeout(context.timeout)
    assert context.ws.gettimeout()==context.timeout

@given('una conexion existente a la interfaz')
def step_impl(context):
    assert context.ws is not None 

@when('reinicio el juego')
def step_impl(context):
    context.ws.send("RESET");
#    print(context.ws.recv());
#    assert context.ws.recv() is "OK"
    res=context.ws.recv();
    print("al reiniciar recibo: ***"+res+"***");
    assert res == "OK"

@when('mando el comando "{comando}"')
def step_impl(context,comando):
    context.ws.send(comando);
    assert context.ws.recv() == "OK"

@when('no hago nada')
def step_impl(context):
#    context.execute_steps('''
#	Given una conexion existente a la interfaz
#	When mando el comando "NOP"
#    ''');
    context.ws.send("NOP");
    assert context.ws.recv()=="OK"

@when('giro a la izquierda')
def step_impl(context):
    context.ws.send("LEFT");
    assert context.ws.recv()=="OK"
#    context.execute_steps('''
#	Given una conexion existente a la interfaz
#	When mando el comando "LEFT"
#    ''');

@when('giro a la derecha')
def step_impl(context):
    context.ws.send("RIGHT");
    assert context.ws.recv()=="OK"

@when('avanzo')
def step_impl(context):
    context.ws.send("UP");
    assert context.ws.recv()=="OK"

@when('avanzo "{numeroPasos}" pasos')
def step_impl(context,numeroPasos):
    i=0;
    while i < int(numeroPasos):
     context.ws.send("UP");
     assert context.ws.recv()=="OK"
# El segundo UP es porque el movimiento de avanzar necesita de 2 ciclos para completar la animacion de dar pasos
# Tambien vale con enviar un NOP
# Pero es mas realista enviar 2 UP, que es lo que haria un jugador humano, dejar pulsado UP hasta que ve ha terminado de avanzar
     context.ws.send("UP"); 
     assert context.ws.recv()=="OK"
     i+=1;

@when('espero "{numeroIteraciones}" iteraciones')
def step_impl(context,numeroIteraciones):
    i=0;
    while i < int(numeroIteraciones):
     context.ws.send("NOP");
     assert context.ws.recv()=="OK"
     i+=1;

@when('pulso espacio')
def step_impl(context):
    context.ws.send("SPACE");
    assert context.ws.recv()=="OK"

@when('cargo una partida')
def step_impl(context):
    context.ws.send("LOAD "+context.text);
    assert context.ws.recv()=="OK"

@step('grabo la partida')
def step_impl(context):
    context.ws.send("SAVE");
    partida = context.ws.recv();
    print("***partida recibida***");
    print(partida); 
# TODO: no se por que hay una línea en blanco al final extra al
# final de la respuesta
    assert partida.count('\n')==431;

@step('grabo la partida y comparo el volcado')
def step_impl(context):
    assert context.text.count('\n')+1==431;
    context.ws.send("SAVE");
    partida = context.ws.recv();
    print("***partida recibida***");
    print(partida);
    print("***partida esperada***");
    print(context.text);
# TODO: no se por que hay una línea en blanco al final extra al
# final de la respuesta
    assert partida.count('\n')==431;
    assert context.text==partida


#@then('los valores iniciales son correctos')
@step('los valores iniciales son correctos')
def step_impl(context):
#    context.ws.send("NOP");
#    context.ws.send("NOP");
    context.ws.send("DUMP");
    result = context.ws.recv();
    print("resultDUMP**"+result);
    dump = json.loads(result)
    context.dump=dump;
    for head in context.table[0].headings:
      print("***"+head+"***"+type(dump[head]).__name__+"***Valor recibido***"+str(dump[head])+"***Valor esperado***"+str(context.table[0][head])+"***"); 
      if (type(dump[head]).__name__=="bool"):
       #assert dump[head]==bool(context.table[0][head])
       assert str(dump[head])==(context.table[0][head])
      else:
       if (type(dump[head]).__name__=="int"):
        assert dump[head]==int(context.table[0][head])
       else:
        assert False 

# esto no parece servir para cortar las desconexiones abruptas
def after_scenario(context,scenario):
    context.ws.close();

