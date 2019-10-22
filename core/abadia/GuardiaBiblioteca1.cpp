// GuardiaBiblioteca1.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "BuscadorRutas.h"
#include "GestorFrases.h"
#include "Guillermo.h"
#include "GuardiaBiblioteca1.h"
#include "Juego.h"
#include "Logica.h"
#include "Marcador.h"
#include "MotorGrafico.h"
#include "Objeto.h"

#ifdef LENG
#include "Abad.h"
#include <stdio.h>
#endif

using namespace Abadia;

/////////////////////////////////////////////////////////////////////////////
// posiciones a las que puede ir el personaje según el estado
/////////////////////////////////////////////////////////////////////////////

PosicionJuego GuardiaBiblioteca1::posicionesPredef[2] = {
	PosicionJuego(IZQUIERDA, 0x3a, 0x32, 0x0f),	// posición para cerrar el paso al pasillo que lleva a la biblioteca
//	PosicionJuego(ARRIBA, 0x89, 0x8D, 0x02),	// posición en la entrada de la abadía
};

/////////////////////////////////////////////////////////////////////////////
// inicialización y limpieza
/////////////////////////////////////////////////////////////////////////////

GuardiaBiblioteca1::GuardiaBiblioteca1(SpriteMonje *spr) : Monje(spr)
{
	// coloca los datos de la capucha
	// de sectario

	datosCara[0] = 69308;
	datosCara[1] = 69308+0x32*4;

	mascarasPuertasBusqueda = 0x3f;

	// asigna las posiciones predefinidas
	posiciones = posicionesPredef;
}

GuardiaBiblioteca1::~GuardiaBiblioteca1()
{
}

/////////////////////////////////////////////////////////////////////////////
// comportamiento
/////////////////////////////////////////////////////////////////////////////

// Los estados en los que puede estar jorge son:
//		0x00 -> estado normal
//		0x0b -> estado en el que se encuentra en la habitación de detrás del espejo cuando llega guillermo
//		0x0c -> estado en el que ha dejado el libro para que lo lea guillermo
//		0x0d -> estado en el que guillermo ha cogido el libro que le ha dado jorge
//		0x0e -> estado en el que adso le informa a jorge que guillermo lleva guantes
//		0x0f -> estado en el que jorge sale huyendo con el libro
//		0x10 -> estado en el que jorge llega al sitio donde se muere y se completa la investigación
//		0x1e -> estado en el que el abad está presentado a guillermo ante jorge
//		0x1f -> estado en el que jorge habla con guillermo después de que hayan sido presentados
void GuardiaBiblioteca1::piensa()
{
#ifdef LENG
	aDondeVa=0; // Por defecto, impedir la entrada a la biblioteca
	// si está cerca guillermo
/*	if (estaCerca(laLogica->guillermo)){
		// si no le ha dicho que no puede subir a la biblioteca
		if ((estado & 0x80) == 0){
			// si guillermo quiere entrar en la biblioteca, le dice que no puede
			if (laLogica->guillermo->posY < 0x38){
				estado |= 0x80;

				// pone en el marcador la frase SIN LA BENDICION DEL SC NO PODEIS PASAR
				elGestorFrases->muestraFraseYa(0x10);
			}
		}
	}
*/
	if (estaCerca(laLogica->guillermo)){
		// si guillermo quiere entrar en la biblioteca
		if (laLogica->guillermo->posY < 0x38){
			// si no le ha dicho que no puede subir a la biblioteca
			if ((estado & 0x80) == 0){
				estado |= 0x80;
				// pone en el marcador la frase SIN LA BENDICION DEL SC NO PODEIS PASAR
				elGestorFrases->muestraFraseYa(0x10);
				if ( laLogica->dia > 2 || (laLogica->dia==2 && laLogica->momentoDia >= COMPLETAS) )  {
						elMarcador->decrementaObsequium(2);
				}
			} 
		} 
fprintf(stderr,"laLogica->guillermo->posY %x estado %x obsequium %d\n",laLogica->guillermo->posY,estado,laLogica->obsequium);
	} else estado=estado&0x7f;
	return;
#endif
#ifdef NOCOMPILARESTO
#ifdef LENG
	switch (laLogica->dia) {
		case 2: 
			switch (laLogica->momentoDia) {
				case TERCIA: aDondeVa=0; break;
				case SEXTA: 
					     aDondeVa=0;
					     //if (laLogica->abad->aDondeVa!=0&&!elGestorFrases->mostrandoFrase){ // si ha terminado la frase de introducción el SC
					     if (laLogica->abad->estado==2){ // si ha terminado la frase de introducción el SC
						     // muestra la frase de Devuelve los dioses terrestres 
						     // lo dice Jorge pero podría ser cualquier sectario
						     elGestorFrases->muestraFrase(0xA);
						     //fprintf(stderr,"JIF 1\n");
						     return;
					     }	 
					     // si el SC se va al terminar la ceremonia, el también se va, y el resto de monjes le siguen
					     //if (laLogica->abad->aDondeVa!=2&&!elGestorFrases->mostrandoFrase){ 
					     if (laLogica->abad->estado==3){ 
						     //fprintf(stderr,"JIF 2\n");
						     aDondeVa=1; 
					     }
					     break;
				case NONA:
					     if (laLogica->abad->estado>6){ // si va a la ceremonia de visperas
//						     fprintf(stderr,"JIF dia 2 nona van a ceremonia como el abad\n");
						     aDondeVa=0;
					     }
					     break;
				case VISPERAS: // TODO, voy por aquí, hay que ir a la ceremonia antes de visperas para que el SC haga el cambio de hora
//fprintf(stderr,"jorge dia 2 visperas aDondeVa %d\n",aDondeVa);
					aDondeVa=0; // para evitar que se vayan antes de que el SC termine la ceremonia
					     if (laLogica->abad->estado==0xa){ // si ha terminado la frase del SC Una extraña presencia 
//						     fprintf(stderr,"JIF dia 2 visperas responden al abad\n");
						     // muestra la frase Iä! Iä!
						     // lo dice Jorge pero podría ser cualquier sectario
						     elGestorFrases->muestraFrase(0xa);
						     return;
					     }	 
					     // si el SC se va al terminar la ceremonia, el también se va, y el resto de monjes le siguen
					     if (laLogica->abad->estado==0xb){ 
//						     fprintf(stderr,"JIF dia 2 visperas fin ceremonia se van\n");
						     aDondeVa=1; 
					     }
					     break;
			}
			break;
	}
	return;
#endif
			// si jorge no está activo, sale
			if (!estaActivo){
				elBuscadorDeRutas->seBuscaRuta = false;

				return;
			}

			// si es el tercer día
			if (laLogica->dia == 3){
				// en prima, se queda quieto
				if (laLogica->momentoDia == PRIMA){
					elBuscadorDeRutas->seBuscaRuta = false;

					return;
				}

				// en tercia, conversa con guillermo
				if (laLogica->momentoDia == TERCIA){
					// no se mueve del sitio
					elBuscadorDeRutas->seBuscaRuta = false;

					// si el abad ha terminado de presentar a guillermo, cambia de estado
					if (estado == 0x1e){
						if (!elGestorFrases->mostrandoFrase){
							estado = 0x1f;
						}

						return;
					}

					// si el abad ha terminado de presentar a guillermo, éste le da la bienvenida
					if (estado == 0x1f){
						if (estaCerca(laLogica->guillermo)){
							// pone en el marcador la frase SED BIENVENIDO, VENERABLE HERMANO; Y ESCUCHAD LO QUE OS DIGO. LAS VIAS DEL ANTICRISTO SON LENTAS Y TORTUOSAS. LLEGA CUANDO MENOS LO ESPERAS. NO DESPERDICIEIS LOS ULTIMOS DIAS
							elGestorFrases->muestraFrase(0x32);

							// al terminar la frase avanza el momento del día
							laLogica->avanzarMomentoDia = true;
						}

						return;
					}

					// si jorge está cerca de guillermo, el abad presenta a guillermo
					if (estaCerca(laLogica->guillermo)){
						// pone en el marcador la frase VENERABLE JORGE, EL QUE ESTA ANTE VOS ES FRAY GUILLERMO, NUESTRO HUESPED
						elGestorFrases->muestraFraseYa(0x31);

						estado = 0x1e;
					}

					return;
				}

				// si es sexta, se va a la celda de los monjes
				if (laLogica->momentoDia == SEXTA){
					aDondeVa = 0;
					estado = 0;

					// si ha llegado a su celda, pasa a estar inactivo
					if (aDondeHaLlegado == 0){
						estaActivo = false;
					}

					return;
				}
			}

			// si es el sexto o séptimo día
			if (laLogica->dia >= 6){
				if (estado == 0x0b){
					// si ha terminado de decir la frase, deja el libro para que lo coja guillermo
					if (!elGestorFrases->mostrandoFrase){
						laLogica->dejaObjeto(this);

						estado = 0x0c;
					}

					elBuscadorDeRutas->seBuscaRuta = false;

					return;
				}

				if (estado == 0x0c){
					// si guillermo ha cogido el libro, le informa de que libro es y pasa al siguiente estado
					if ((laLogica->guillermo->objetos & LIBRO) == LIBRO){
						// pone en el marcador la frase ES EL COENA CIPRIANI DE ARISTOTELES. AHORA COMPRENDEREIS POR QUE TENIA QUE PROTEGERLO. CADA PALABRA ESCRITA POR EL FILOSOFO HA DESTRUIDO UNA PARTE DEL SABER DE LA CRISTIANDAD. SE QUE HE ACTUADO SIGUIENDO LA VOLUNTAD DEL SEÑOR... LEEDLO, PUES, FRAY GUILLERMO. DESPUES TE LO MOSTRATE A TI MUCHACHO
						elGestorFrases->muestraFrase(0x2e);

						estado = 0x0d;
					}

					elBuscadorDeRutas->seBuscaRuta = false;

					return;

				}

				if (estado == 0x0d){
					// si guillermo no tiene los guantes
					if ((laLogica->guillermo->objetos & GUANTES) == 0){
						// si guillermo no ha muerto todavía
						if (!laLogica->haFracasado){
							// si ha salido de la pantalla de detrás del espejo o ha terminado la frase, mata a guillermo
							if ((elMotorGrafico->numPantalla == 0x72) || (!elGestorFrases->mostrandoFrase)){
								laLogica->cntLeeLibroSinGuantes = 0xff;
							} else {
								laLogica->cntLeeLibroSinGuantes = 0x01;
							}
						}

						elBuscadorDeRutas->seBuscaRuta = false;
					} else {
						// si guillermo tenía los guantes y ha terminado de mostrar la frase, adso le informa de que guillermo tenía puestos los guantes
						if (!elGestorFrases->mostrandoFrase){
							// pone en el marcador la frase VENERABLE JORGE, VOIS NO PODEIS VERLO, PERO MI MAESTRO LLEVA GUANTES.  PARA SEPARAR LOS FOLIOS TENDRIA QUE HUMEDECER LOS DEDOS EN LA LENGUA, HASTA QUE HUBIERA RECIBIDO SUFICIENTE VENENO
							elGestorFrases->muestraFrase(0x23);

							estado = 0x0e;
						}

						elBuscadorDeRutas->seBuscaRuta = false;
					}

					return;

				}

				if (estado == 0x0e){
					if (!elGestorFrases->mostrandoFrase){
						// inicia el contador para salir huyendo
						contadorHuida = 0;

						estado = 0x0f;

						// pone en el marcador la frase FUE UNA BUENA IDEA ¿VERDAD?; PERO YA ES TARDE
						elGestorFrases->muestraFrase(0x2f);

					}

					elBuscadorDeRutas->seBuscaRuta = false;

					return;
				}

				if (estado == 0x0f){
					contadorHuida++;

					// si el contador para salir huyendo ha llegado al límite, jorge huye
					if (contadorHuida == 0x28){
						// oculta el área de juego
						// CPC elJuego->limpiaAreaJuego(3);
						elJuego->limpiaAreaJuego(0); // VGA

						// va hacia la habitación iluminada del laberinto
						aDondeVa = 1;

						// apaga la luza de la pantalla y le quita el libro a guillermo
						elMotorGrafico->pantallaIluminada = false;
						laLogica->guillermo->objetos &= 0x7f;

						// quita el libro del marcador
						elMarcador->dibujaObjetos(laLogica->guillermo->objetos, 0x80);

						// hace desaparecer el libro
						elJuego->objetos[0]->seHaCogido = false;
						elJuego->objetos[0]->seEstaCogiendo = false;
						elJuego->objetos[0]->personaje = 0;
						elJuego->objetos[0]->posX = 0;
						elJuego->objetos[0]->posY = 0;
						elJuego->objetos[0]->altura = 0;
						elJuego->objetos[0]->orientacion = DERECHA;

						estado = 0x10;
					} else {
						elBuscadorDeRutas->seBuscaRuta = false;
					}

					return;
				}

				if (estado == 0x10){
					// si jorge ha llegado al sitio donde se muere y guillermo también, se ha completado la investigación
					if ((aDondeHaLlegado == 1) && (elMotorGrafico->numPantalla == 0x67) && (laLogica->guillermo->altura < 0x1e)){
						laLogica->haFracasado = true;
						laLogica->investigacionCompleta = true;
					}

					return;
				}

				// si entra a la habitación del espejo, inicia el estado de la secuencia final
				if (elMotorGrafico->numPantalla == 0x73){
					laLogica->bonus |= 0x0800;

					// pone en el marcador la frase SOIS VOS, GUILERMO... PASAD, OS ESTABA ESPERANDO. TOMAD, AQUI ESTA VUESTRO PREMIO
					elGestorFrases->muestraFraseYa(0x21);

					estado = 0x0b;
				}

				elBuscadorDeRutas->seBuscaRuta = false;

				return;
			}
#endif
}
