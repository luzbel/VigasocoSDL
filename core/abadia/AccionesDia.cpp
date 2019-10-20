// AccionesDia.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "../systems/cpc6128.h"
#include "../TimingHandler.h"

#include "Abad.h"
#include "AccionesDia.h"
#include "Berengario.h"
#include "Bernardo.h"
#include "Guillermo.h"
#include "Jorge.h"
#include "Juego.h"
#include "Logica.h"
#include "Marcador.h"
#include "MotorGrafico.h"
#include "Objeto.h"
#include "Paleta.h"
#include "Puerta.h"

#include "sonidos.h"

#ifdef LENG
#include "Adso.h"
#include "GestorFrases.h"
#include "Malaquias.h"
#include "Sprite.h" // para trazas
#endif


using namespace Abadia;

#ifdef LENG
#include <stdio.h>
#endif

// tabla con las acciones programadas
AccionProgramada *AccionesDia::acciones[7];

/////////////////////////////////////////////////////////////////////////////
// inicialización y limpieza
/////////////////////////////////////////////////////////////////////////////

AccionesDia::AccionesDia()
{
	// crea las acciones programadas según el momento del día
	acciones[0] = new AccionesNoche();
	acciones[1] = new AccionesPrima();
	acciones[2] = new AccionesTercia();
	acciones[3] = new AccionesSexta();
	acciones[4] = new AccionesNona();
	acciones[5] = new AccionesVisperas();
	acciones[6] = new AccionesCompletas();
}

AccionesDia::~AccionesDia()
{
	for (int i = 0; i < 7; i++){
		delete acciones[i];
	}
}

/////////////////////////////////////////////////////////////////////////////
// ejecución de las acciones programadas
/////////////////////////////////////////////////////////////////////////////

void AccionesDia::ejecutaAccionesProgramadas()
{
	// si no ha cambiado el momento del día, sale
	if (laLogica->momentoDia == laLogica->oldMomentoDia) return;

	laLogica->oldMomentoDia = laLogica->momentoDia;

	laLogica->cntMovimiento = 0;

	// ejecuta unas acciones dependiendo del momento del día
	acciones[laLogica->momentoDia]->ejecuta(this);
}

/////////////////////////////////////////////////////////////////////////////
// acciones programadas según el momento del día
/////////////////////////////////////////////////////////////////////////////

void AccionesNoche::ejecuta(AccionesDia *ad)
{
#ifdef LENG
	// fija la paleta de noche
	elJuego->paleta->setGamePalette(3);
	// TODO revisar si es necesario establecer siempre la paleta
	// para el día 1 se podría fijar al iniciar el juego
	// y aquí no haría falta si ya se ha fijado en visperas y completas
	// pero ojo con los saltos en el tiempo
	elJuego->puertas[5]->estaFija=false;
	elJuego->puertas[6]->estaFija=false;
//ad->colocaObjeto(elJuego->objetos[3], 0x54, 0x3e, 0x6); //colocar Tablilla de Zanthu en mesa celda SC
//	if (laLogica->dia == 2){
//			// dibuja el efecto de la espiral
//			ad->dibujaEfectoEspiral();
//	}
//fprintf(stderr,"LENG AccionesNoche::ejecuta\n");
#else
	if (laLogica->dia == 5){
		// pone las gafas en la habitación iluminada del laberinto
		ad->colocaObjeto(elJuego->objetos[2], 0x1b, 0x23, 0x18);

		// pone la llave 1 en el altar
		ad->colocaObjeto(elJuego->objetos[4], 0x89, 0x3e, 0x08);
	} else if (laLogica->dia == 6){
		// pone la llave de la habitación de severino en la mesa de malaquías
		ad->colocaObjeto(elJuego->objetos[5], 0x35, 0x35, 0x13);

		// coloca a jorge en la habitación de detrás del espejo
		ad->colocaPersonaje(laLogica->jorge, 0x12, 0x65, 0x18, ARRIBA);
		laLogica->jorge->estaActivo = true;
	}
#endif
}

void AccionesPrima::ejecuta(AccionesDia *ad)
{
#ifdef LENG
	switch (laLogica->dia) {
		case 2: 
fprintf(stderr,"AccionesPrima::ejecuta dia 2\n"); 
			// coloca a Guillermo en la entrada
			ad->colocaPersonaje(laLogica->guillermo, 0x88, 0xa8, 0x0, DERECHA);
			ad->colocaPersonaje(laLogica->adso, 0x88-2, 0xa8+2, 0x0, IZQUIERDA);
			//ad->colocaPersonaje(laLogica->malaquias, 0x88, 0x84, 0x2, ARRIBA);
			ad->colocaPersonaje(laLogica->malaquias, 0x89, 0x8D, 0x2, ARRIBA);
			// dibuja el efecto de la espiral
			ad->dibujaEfectoEspiral();
/*
			laLogica->mascaraPuertas= 0x10;
				laLogica->guillermo->permisosPuertas= 0x10;
				laLogica->adso->permisosPuertas= 0x10;
				laLogica->malaquías->permisosPuertas=0x10; // Pueden abrir la puerta que lleva a la cripta
*/
			laLogica->mascaraPuertas=	
				laLogica->abad->permisosPuertas = // 0x11;	
					0x10   // La puerta de la cripta
					| 0x2  // La puerta de la celda de los monjes 
					| 0x1; // La puerta de la celda del abad
fprintf(stderr,"laLogica->abad->permisosPuertas %d %d\n",laLogica->abad->permisosPuertas,0x10|0x1);
			laLogica->guillermo->permisosPuertas=
				laLogica->adso->permisosPuertas=
				laLogica->malaquias->permisosPuertas=0x10;

fprintf(stderr,"laLogica->adso->permisosPuertas %d\n",laLogica->adso->permisosPuertas);
			elGestorFrases->muestraFrase(0x04);
		        //while (elGestorFrases->mostrandoFrase) elJuego->timer->sleep(1000);
		        elJuego->timer->sleep(10000);
			ad->dibujaEfectoEspiral();
			
			break;
	}
#else
	// dibuja el efecto de la espiral
	ad->dibujaEfectoEspiral();

	// modifica las puertas que pueden abrirse
	laLogica->mascaraPuertas = 0xef;

	// fija la paleta de día
	elJuego->paleta->setGamePalette(2);

	// abre las puertas del ala izquierda de la abadía
	elJuego->puertas[5]->orientacion = IZQUIERDA;
	elJuego->puertas[5]->haciaDentro = true;
	elJuego->puertas[5]->estaFija = true;
	elJuego->puertas[5]->estaAbierta = true;
	elJuego->puertas[6]->orientacion = IZQUIERDA;
	elJuego->puertas[6]->haciaDentro = false;
	elJuego->puertas[6]->estaFija = true;
	elJuego->puertas[6]->estaAbierta = true;

	VigasocoMain->getAudioPlugin()->Play(SONIDOS::Campanas);
	
	if (laLogica->dia >= 3){
		// si se ha usado la lámpara, desaparece
		laLogica->reiniciaContadoresLampara();

		// si la lámpara había desaparecido, la pone en la cocina
		if (laLogica->lamparaDesaparecida){
			laLogica->lamparaDesaparecida = false;

			ad->colocaObjeto(elJuego->objetos[7], 0x5a, 0x2a, 0x04);
		}
	}

	if (laLogica->dia == 2){
		// desaparecen las gafas
		laLogica->guillermo->objetos &= 0xdf;
		laLogica->berengario->objetos &= 0xdf;

		ad->colocaObjeto(elJuego->objetos[2], 0, 0, 0);

		// dibuja los objetos que tiene guillermo en el marcador
		elMarcador->dibujaObjetos(laLogica->guillermo->objetos, 0xff);
	}

	if (laLogica->dia == 3){
		// jorge coge el libro y lo esconde
		laLogica->jorge->objetos = LIBRO;
		ad->colocaObjeto(elJuego->objetos[0], 0x0f, 0x2e, 0x00);

		// escribe un comando para pensar un nuevo movimiento
		laLogica->jorge->numBitAcciones = 0;
		laLogica->jorge->posAcciones = 0;
		laLogica->jorge->bufAcciones[0] = 0x10;

		// coloca a jorge al final del pasillo de las celdas de los monjes
		ad->colocaPersonaje(laLogica->jorge, 0xc8, 0x24, 0x00, DERECHA);
		laLogica->jorge->estaActivo = true;

		// indica que el abad no tiene ningún objeto
		laLogica->abad->objetos = 0;

		// si guillermo no tiene el pergamino, se coloca en la habitación de detrás del espejo
		if ((laLogica->guillermo->objetos & PERGAMINO) == 0){
			ad->colocaObjeto(elJuego->objetos[3], 0x18, 0x64, 0x18);
			laLogica->pergaminoGuardado = true;
		}
	}

	// si es el quinto día y no tenemos la llave 1, ésta desaparece
	if ((laLogica->dia == 5) && ((laLogica->guillermo->objetos & LLAVE1) == 0)){
		ad->colocaObjeto(elJuego->objetos[4], 0, 0, 0);
	}
#endif
}

void AccionesTercia::ejecuta(AccionesDia *ad)
{
#ifdef LENG
#else
	// dibuja el efecto de la espiral
	ad->dibujaEfectoEspiral();

	VigasocoMain->getAudioPlugin()->Play(SONIDOS::Tintineo);
#endif
}

void AccionesSexta::ejecuta(AccionesDia *ad)
{
#ifdef LENG
fprintf(stderr,"AccionesSexta::ejecuta\n");
#else
	VigasocoMain->getAudioPlugin()->Play(SONIDOS::Campanas);

	if (laLogica->dia == 4){
		// bernardo gui aparece en las escaleras de la abadía
		laLogica->bernardo->estaEnLaAbadia = true;
		ad->colocaPersonaje(laLogica->bernardo, 0x88, 0x88, 0x02, DERECHA);

		// indica que bernardo puede coger el pergamino
		laLogica->bernardo->mascaraObjetos = PERGAMINO;
	}
#endif
}

void AccionesNona::ejecuta(AccionesDia *ad)
{
#ifdef LENG
fprintf(stderr,"AccionesNona::ejecuta\n");
	if (laLogica->dia == 2){
		// TODO: ?en acciones anteriores sacar la tablilla de la biblioteca y gestionar bien que lo lleva el Abad???
laLogica->abad->mascaraObjetos=0; // TODO, si nunca la va a coger, mejor inicializar esto en Logica::inicia o en Abad::inicia
		ad->colocaObjeto(elJuego->objetos[3], 0x54, 0x3e, 0x6); //colocar Tablilla de Zanthu en mesa celda SC
		// TODO, esto debería hacerlo colocaObjeto de manera genérico, si se pone un objeto en la pantalla visible, redibujar
		// para que se vea
		if(elMotorGrafico->numPantalla==0xd) elMotorGrafico->posXPantalla=elMotorGrafico->posYPantalla=-1;
//		if (laLogica->opcionPersonajeCamara==3 || 
// en esa posicion, el abad lo vuelve a coger
//hay varias alternativas, ¿girar antes al abad? 


		//ad->colocaObjeto(elJuego->objetos[3], 95, 58, 2); //colocar Tablilla de Zanthu en  celda SC
//ad->colocaObjeto(elJuego->objetos[3], 89, 61, 4); //colocar Tablilla de Zanthu en  celda SC
		//ad->colocaObjeto(elJuego->objetos[3], 84, 62, 6); //colocar Tablilla de Zanthu en mesa celda SC NO SE VE
//elJuego->objetos[3]->sprite->esVisible=1;
fprintf(stderr,"AccionesNona::ejecuta dia 2 poner objeto \n");
fprintf(stderr,"AccionesNona::ejecuta dia 2 esVisble %d haCambiado %d desaparece %d\n",
elJuego->objetos[3]->sprite->esVisible,
elJuego->objetos[3]->sprite->haCambiado,
elJuego->objetos[3]->sprite->desaparece
);
fprintf(stderr,"AccionesNona::ejecuta dia 2 a que el listo del abad ha cogido el objeto %d \n",laLogica->abad->objetos);
fprintf(stderr,"elMotorGrafico->numPantalla %d\n",elMotorGrafico->numPantalla);
	}
#else
	// dibuja el efecto de la espiral
	ad->dibujaEfectoEspiral();

	// si es el tercer día, jorge pasa a estar inactivo y desaparece
	if (laLogica->dia == 3){
		laLogica->jorge->estaActivo = false;
		laLogica->jorge->posX = laLogica->jorge->posY = laLogica->jorge->altura = 0; 
	}
	
	VigasocoMain->getAudioPlugin()->Play(SONIDOS::Tintineo);
#endif
}

void AccionesVisperas::ejecuta(AccionesDia *ad)
{
#ifdef LENG
#else
	VigasocoMain->getAudioPlugin()->Play(SONIDOS::Campanas);
#endif
}

void AccionesCompletas::ejecuta(AccionesDia *ad)
{
#ifdef LENG
#else
	// dibuja el efecto de la espiral
	ad->dibujaEfectoEspiral();

	// fija la paleta de noche
	elJuego->paleta->setGamePalette(3);

	// modifica las puertas que pueden abrirse
	laLogica->mascaraPuertas = 0xdf;
	
	VigasocoMain->getAudioPlugin()->Play(SONIDOS::Tintineo);
#endif
}

/////////////////////////////////////////////////////////////////////////////
// dibujo de la espiral
/////////////////////////////////////////////////////////////////////////////

// genera el efecto de la espiral
void AccionesDia::dibujaEfectoEspiral()
{
	dibujaEspiral(3);	// dibuja la espiral
	dibujaEspiral(0);	// borra la espiral

	// indica un cambio de pantalla
	elMotorGrafico->posXPantalla = elMotorGrafico->posYPantalla = -1;
}

// dibuja una espiral cuadrada del color que se le pasa
void AccionesDia::dibujaEspiral(int color)
{
	// obtiene acceso al temporizador
	TimingHandler *timer = elJuego->timer;

	// fija la posición inicial
	int posX = 0;
	int posY = 0;

	// fija la longitud de las tiras
	int derecha = 0x3f;
	int abajo = 0x4f;
	int izquierda = 0x3f;
	int arriba = 0x4e;

	int colorAUsar = 0;

	// milisegundos que esperar para ver el efecto
	int retardo = 4;

	// repite 32 veces
	for (int i = 0; i < 32; i++){
		int num = derecha;
		derecha -= (i == 0) ? 1 : 2;

		// dibuja una tira (de izquierda a derecha) del ancho indicado por derecha
		for (int j = 0; j < num; j++){
			dibujaBloque(posX, posY, colorAUsar);
			posX++;
		}

		// espera un poco para que se vea el resultado
		timer->sleep(retardo);

		num = abajo;
		abajo -=2;

		// dibuja una tira (de arriba a abajo) del alto indicado por abajo
		for (int j = 0; j < num; j++){
			dibujaBloque(posX, posY, colorAUsar);
			posY += 2;
		}

		// espera un poco para que se vea el resultado
		timer->sleep(retardo);

		num = izquierda;
		izquierda -= 2;

		// dibuja una tira (de derecha a izquierda) del ancho indicado por izquierda
		for (int j = 0; j < num; j++){
			dibujaBloque(posX, posY, colorAUsar);
			posX--;
		}

		// espera un poco para que se vea el resultado
		timer->sleep(retardo);

		num = arriba;
		arriba -= 2;

		// dibuja una tira (de abajo a arriba) del alto indicado por arriba
		for (int j = 0; j < num; j++){
			dibujaBloque(posX, posY, colorAUsar);
			posY -= 2;
		}

		// espera un poco para que se vea el resultado
		timer->sleep(retardo);

		// invierte el color a usar
		colorAUsar = colorAUsar ^ color;

		if ((i != 0) && ((i % 8) == 0)){
			retardo--;
		}
	}

	dibujaBloque(posX, posY, colorAUsar);
}

// dibuja un bloque de 4x8 del color que se le pasa
void AccionesDia::dibujaBloque(int posX, int posY, int color)
{
	for (int i = 0; i < 4; i++){
		elJuego->cpc6128->setMode1Pixel(32 + posX*4 + i, posY, color);
		elJuego->cpc6128->setMode1Pixel(32 + posX*4 + i, posY + 1, color);
	}
}

/////////////////////////////////////////////////////////////////////////////
// método de ayuda para colocar los objetos y los personajes
/////////////////////////////////////////////////////////////////////////////

void AccionesDia::colocaObjeto(Objeto *obj, int posX, int posY, int altura)
{
	obj->seHaCogido = false;
	obj->seEstaCogiendo = false;
	obj->personaje = 0;
	obj->posX = posX;
	obj->posY = posY;
	obj->altura = altura;
	obj->orientacion = DERECHA;
}

void AccionesDia::colocaPersonaje(Personaje *pers, int posX, int posY, int altura, int orientacion)
{
	pers->posX = posX;
	pers->posY = posY;
	pers->altura = altura;
	pers->orientacion = orientacion;
	pers->enDesnivel = false;
	pers->giradoEnDesnivel = false;
	pers->bajando = false;
}
