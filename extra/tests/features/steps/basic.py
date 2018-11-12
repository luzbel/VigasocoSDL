# ojo, ahora se depende de que al hacer "then los valores iniciales son correctos"
# se hace un dump dentro
# hay que poner dump tras cada paso o explicitamente en la definicion de pasos
# TODO: ?si los params van sin entrecomillar se consideran enteros y no hay que hacer conversion?

#TODO: mirar el directorio a con una prueba usando
# https://github.com/behave/behave/blob/master/features/step.use_step_library.feature
# https://github.com/behave/behave/blob/master/features/userdata.feature
# para poder usar distintas implementaciones de los steps segun estÃ©usando
# websocket o rest
# viene de https://github.com/behave/behave/issues/279

from behave import *
#from websocket import create_connection
import json
import requests

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

# TODO: revisar porque se necesitan 2 "no hago nada"
# antes de pasar a haFracasado==True
# cuando obsequium es cero desde la carga ???
@given('una partida fracasada')
def step_impl(context):
    context.execute_steps('''
	Given una conexion a la interfaz
	When cargo una partida:
"""
1// dia
4// momentoDia
0// duracionMomentoDia
4// oldMomentoDia
0// avanzarMomentoDia
0// obsequium
0// haFracasado
0// investigacionCompleta
0// bonus
239// mascaraPuertas
1// espejoCerrado
0// numeroRomano
103444// despDatosAlturaEspejo
123468// despBloqueEspejo
0// seAcabaLaNoche
0// haAmanecido
0// usandoLampara
1// lamparaDesaparecida
0// tiempoUsoLampara
0// cambioEstadoLampara
0// cntTiempoAOscuras
0// cntLeeLibroSinGuantes
0// pergaminoGuardado
136// numeroAleatorio
1// hayMovimiento
1123// cntMovimiento
0// numPersonajeCamara
0// opcionPersonajeCamara
// SPRITE 0
1// esVisible
// SPRITE 1
1// esVisible
// SPRITE 2
0// esVisible
// SPRITE 3
1// esVisible
// SPRITE 4
0// esVisible
// SPRITE 5
0// esVisible
// SPRITE 6
0// esVisible
// SPRITE 7
0// esVisible
// SPRITE 8
0// esVisible
// SPRITE 9
0// esVisible
// SPRITE 10
0// esVisible
// SPRITE 11
0// esVisible
// SPRITE 12
0// esVisible
// SPRITE 13
0// esVisible
// SPRITE 14
0// esVisible
// SPRITE 15
0// esVisible
// SPRITE 16
0// esVisible
// SPRITE 17
0// esVisible
// SPRITE 18
0// esVisible
// SPRITE 19
0// esVisible
// SPRITE 20
0// esVisible
// SPRITE 21
0// esVisible
// SPRITE 22
0// esVisible
// SPRITE 23
0// esVisible
// SPRITE 24
0// esVisible
// SPRITE 25
0// esVisible
// GUILLERMO
1// orientacion
136// posX
149// posY
0// altura
0// estado
2// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
32// objetos
252// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
2// incrPosY
// ADSO
1// orientacion
134// posX
150// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-32// despY
32// valorPosicion
0// puedeQuitarObjetos
0// objetos
3// mascaraObjetos
0// contadorObjetos
8// permisosPuertas
8// numFotogramas
60// mascarasPuertasBusqueda
-1// aDondeVa
-1// aDondeHaLlegado
0// oldEstado
0// movimientosFrustados
0// cntParaDormir
// MALAQUIAS
1// orientacion
55// posX
56// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
1// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// estaMuerto
0// estado2
0// contadorEnScriptorium
// ABAD
3// orientacion
136// posX
147// posY
0// altura
139// estado
2// contadorAnimacion
0// bajando
3// orientacion
0// enDesnivel
0// giradoEnDesnivel
1// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
16// mascaraObjetos
0// contadorObjetos
25// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
-1// aDondeVa
-1// aDondeHaLlegado
0// contador
0// numFrase
0// guillermoBienColocado
0// lleganLosMonjes
0// guillermoHaCogidoElPergamino
// BERENGARIO
2// orientacion
61// posX
92// posY
15// altura
0// estado
0// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
2// aDondeVa
2// aDondeHaLlegado
0// encapuchado
0// estado2
1// estaVivo
0// contadorPergamino
// SEVERINO
2// orientacion
117// posX
137// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
2// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
12// permisosPuertas
8// numFotogramas
47// mascarasPuertasBusqueda
2// aDondeVa
3// aDondeHaLlegado
1// estaVivo
// JORGE
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
0// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaActivo
0// contadorHuida
// BERNARDO
0// orientacion
0// posX
0// posY
0// altura
0// estado
0// contadorAnimacion
0// bajando
0// orientacion
0// enDesnivel
0// giradoEnDesnivel
0// flipX
49152// despFlipX
-2// despX
-34// despY
16// valorPosicion
1// puedeQuitarObjetos
0// objetos
0// mascaraObjetos
0// contadorObjetos
31// permisosPuertas
8// numFotogramas
63// mascarasPuertasBusqueda
0// aDondeVa
-6// aDondeHaLlegado
0// estaEnLaAbadia
// PUERTA 0
1// orientacion
97// posX
55// posY
2// altura
1// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 1
2// orientacion
183// posX
30// posY
2// altura
2// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 2
0// orientacion
102// posX
95// posY
2// altura
4// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 3
3// orientacion
158// posX
40// posY
2// altura
8// identificador
0// estaAbierta
1// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 4
3// orientacion
126// posX
38// posY
2// altura
16// identificador
0// estaAbierta
0// haciaDentro
0// estaFija
0// hayQueRedibujar
// PUERTA 5
2// orientacion
96// posX
118// posY
0// altura
0// identificador
1// estaAbierta
1// haciaDentro
1// estaFija
0// hayQueRedibujar
// PUERTA 6
2// orientacion
96// posX
123// posY
0// altura
0// identificador
1// estaAbierta
0// haciaDentro
1// estaFija
0// hayQueRedibujar
// OBJETO 0
1// orientacion
52// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 1
0// orientacion
107// posX
85// posY
6// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 2
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
1// seHaCogido
0// numPersonaje
// OBJETO 3
1// orientacion
54// posX
94// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 4
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 5
0// orientacion
0// posX
0// posY
0// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 6
0// orientacion
53// posX
53// posY
19// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
// OBJETO 7
0// orientacion
8// posX
8// posY
2// altura
0// seEstaCogiendo
0// seHaCogido
-1// numPersonaje
"""
	And no hago nada
        And los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |    False    |         False         |      4     |     22      |        0     |     0     |      0     |
	And no hago nada
        Then los valores iniciales son correctos:
           | bonus | dia | haFracasado | investigacionCompleta | momentoDia | numPantalla | numeroRomano | obsequium | porcentaje |
           |   0   |  1  |    True     |         False         |      4     |     22      |        0     |     0     |      0     |
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
      print("\nrow "+str(i)+"\n");
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

