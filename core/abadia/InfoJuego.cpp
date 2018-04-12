// InfoJuego.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include <cassert>
#include <iomanip>
#include <string>
#if __cplusplus >= 199711L
#include <iostream> // TODO: revisar JT
#include <chrono>
#include <ctime>
#include <sstream>
#else
#include <string.h>
#endif

#include "../systems/cpc6128.h"
#include "../IDrawPlugin.h"
#include "../IPalette.h"
#include "../FontManager.h"
#include "../Vigasoco.h"

#include "Controles.h"
#include "GeneradorPantallas.h"
#include "Guillermo.h"
#include "InfoJuego.h"
#include "Juego.h"
#include "Logica.h"
#include "MotorGrafico.h"
#include "Objeto.h"
#include "PersonajeConIA.h"
#include "Puerta.h"
#include "RejillaPantalla.h"
#include "Sprite.h"

#ifdef __abadIA__
#include <fstream>
char pathDump[200];
#endif
using namespace Abadia;

#include "crow_all.h"

char webCommand;

void start_web_server() {
	std::cout << "Starting Web Server" << std::endl;

	crow::SimpleApp app;

	CROW_ROUTE(app, "/dump")([](){
		std::string str;

		str = elJuego->infoJuego->muestraInfo();
		return crow::response(200, str);
	});

	CROW_ROUTE(app, "/fin")([](){
		webCommand = 'F';
		return "Pido Salir";
	});

	CROW_ROUTE(app, "/cmd/<string>")
	([ = ](crow::request req, std::string str){
	    std::cout << "infoJuego -> Mando el comando -> " << str << std::endl;	
		elJuego->infoJuego->inputHandler->webCommand = 'A'; // str.at(0);
		// elJuego->infoJuego->inputHandler->sendCommand(str.at(0));
	    std::cout << "Pido el JSON" << std::endl;	
		// json = elJuego->infoJuego->muestraInfo();
		return crow::response(200, str);
	});

    app.port(4477).run(); // la primera letra de cuatro y la septima QR
}

std::thread t1(start_web_server);

/////////////////////////////////////////////////////////////////////////////
// inicializaci�n y limpieza
/////////////////////////////////////////////////////////////////////////////

InfoJuego::InfoJuego()
{
	cpc6128 = elJuego->cpc6128;

	for (int i = 0; i < 3; i++){
		alturasPlanta[i] = 0;
	}

	numPersonaje = Juego::numPersonajes;
	numObjeto = Juego::numObjetos;
	numPuerta = Juego::numPuertas;
	mostrarLogica = false;
	mostrarRejilla = false;
	mostrarMapaPlantaActual = false;
	mostrarMapaRestoPlantas = false;
	inputHandler = VigasocoMain->getInputHandler();

#if __cplusplus >= 199711

	// TODO: revisar añadido por JT
	// Creo el path para el fichero de dump con la info

	fprintf(stderr, "Init pathDump\n");
	std::time_t t = std::time(NULL);
	
	startTime = std::time(NULL);
	currentTime = std::time(NULL);
	version = 1; 

    if (std::strftime(pathDump, sizeof(pathDump), "abadia%Y-%m-%d_%H:%M:%S", std::localtime(&t))) {
        fprintf(stderr,"pathDump (%s)\n", pathDump);
		nameGame = pathDump;
    }
 	// strftime(pathDump, sizeof(pathDump), "/tmp/abadiaDump%Y%m%D-%H%M%S.json", tm);
	// printf(stderr, "pathDump: %s", pathDump);
#else // mientras actualizo a un entorno tan bonito como el del Mac de JT
	strcpy(pathDump,"/tmp/abadiaSIN-FECHA-HORA.json");	
#endif 
}

InfoJuego::~InfoJuego()
{
	for (int i = 0; i < 3; i++){
		delete [] alturasPlanta[i];
	}
}

/////////////////////////////////////////////////////////////////////////////
// tablas con datos acerca de las plantas
/////////////////////////////////////////////////////////////////////////////

int InfoJuego::zonaVisiblePlanta[3][4] = {
	{ 0x01, 0x0c, 0x01, 0x0a },
	{ 0x01, 0x05, 0x02, 0x06 },
	{ 0x01, 0x05, 0x02, 0x06 }
};

int InfoJuego::alturaBasePlanta[3] = {
	0x00, 0x0d, 0x18
};

/////////////////////////////////////////////////////////////////////////////
// m�todos para mostrar informaci�n interna del juego
/////////////////////////////////////////////////////////////////////////////

// inicia los datos necesarios para poder mostrar la informaci�n sobre el comportamiento del juego m�s tarde
void InfoJuego::inicia()
{
	// inicia la paleta (los colores colores 0-3 no pueden usarse ya que los usa el juego)
// PARA VGA, usamos para infojuego a partir del 200
// ojo , el 253 y 254 se usan para otra cosa. ver vigasoco.cpp
// asi que sumo 200 a todos los indices que me encuentro
	IPalette *paleta = VigasocoMain->getPalette();

	// tabla con los colores asignados a cada personaje en los mapas
	int colores[8][3] = {
		{ 0xff, 0x00, 0x00 },	// guillermo (rojo)
		{ 0xff, 0x00, 0x00 },	// adso (rojo)
		{ 0x00, 0xff, 0x00 },	// malaqu�as (verde)
		{ 0x00, 0x00, 0x00 },	// el abad (negro)
		{ 0x00, 0xff, 0xff },	// berengario (azul celeste)
		{ 0x00, 0x00, 0xff },	// severino (azul)
		{ 0x80, 0x00, 0xff },	// jorge (morado)
		{ 0xff, 0x00, 0xff }	// bernardo gui (rosa)
	};

	// fija el color de los personajes en los mapas
	for (int i = 0; i < 8; i++){
		// CPC paleta->setColor(4 + i, colores[i][0], colores[i][1], colores[i][2]);
		paleta->setColor(200 + 4 + i, colores[i][0], colores[i][1], colores[i][2]);
	}

	// fija el color de los personajes en el mapa de alturas
	// CPC paleta->setColor(15, 0xff, 0x00, 0x00);
	paleta->setColor(200+15, 0xff, 0x00, 0x00);

	int paso = 0x80/16;

	// crea un degradado de grises para mostrar el mapa de alturas
	for (int i = 0; i < 16; i++){
		//paleta->setColor(16 + i, 0x80 + paso*i, 0x80 + paso*i, 0x80 + paso*i);
		paleta->setColor(200+16 + i, 0x80 + paso*i, 0x80 + paso*i, 0x80 + paso*i);
	}

	// guarda la altura de las pantallas de cada planta
	generaAlturasPlanta();
}

// muestra la informaci�n del juego que se ha activado
std::string InfoJuego::muestraInfo()
{
/* las teclas 1 a 7 ahora se usan para hacer trampas y cambiar la camara para seguir a otros personajes
	if (losControles->seHaPulsado(KEYBOARD_1)) numPersonaje = (numPersonaje + 1) % (Juego::numPersonajes + 1);
	if (losControles->seHaPulsado(KEYBOARD_2)) numObjeto = (numObjeto + 1) % (Juego::numObjetos + 1);
	if (losControles->seHaPulsado(KEYBOARD_3)) numPuerta = (numPuerta + 1) % (Juego::numPuertas + 1);
	if (losControles->seHaPulsado(KEYBOARD_4)) mostrarLogica = !mostrarLogica;
	if (losControles->seHaPulsado(KEYBOARD_5)) mostrarRejilla = !mostrarRejilla;
	if (losControles->seHaPulsado(KEYBOARD_6)) mostrarMapaPlantaActual = !mostrarMapaPlantaActual;
	if (losControles->seHaPulsado(KEYBOARD_7)) mostrarMapaRestoPlantas = !mostrarMapaRestoPlantas;
*/
/*
	// como con el plugin actual de SDLVideo no se muestran los textos
	// de infojuego
	// solo remapeo teclas para mostrar mapas
	if (losControles->seHaPulsado(KEYBOARD_8)) mostrarRejilla = !mostrarRejilla;
	if (losControles->seHaPulsado(KEYBOARD_9)) mostrarMapaPlantaActual = !mostrarMapaPlantaActual;
	if (losControles->seHaPulsado(KEYBOARD_0)) mostrarMapaRestoPlantas = !mostrarMapaRestoPlantas;
*/
// ahora no hago transparencia, y si se consultan los mapas
// se consultan todos y no se ve la pantalla
// asi que no miro las teclas y siempre dejo activos los mapas
// TODO FIXME
// mover esto a la inicializacion

#ifdef __abadIA__
// En las primeras versiones del proyecto abadIA, a la IA
// se le mostrará la informaci�n de la habitacion en formato reducido
// En versiones posteriores la IA deberá jugar procesando los pixeles
// de la misma pantalla que usan los jugadores humanos
mostrarRejilla=true;
mostrarMapaPlantaActual=false;
mostrarMapaRestoPlantas=false;

std::stringstream out;

out << "{" ;
out << muestra("nameGame", nameGame);
out << muestra("version", version);
out << muestra("startTime", startTime);
out << muestra("currentGame", std::time(0));
out << muestra("duracion", std::time(0) - startTime);
out << muestra("dia", laLogica->dia);
out << muestra("momentoDia", laLogica->momentoDia);
out << muestra("obsequium", laLogica->obsequium);
out << muestra("numeroRomano", laLogica->numeroRomano);
// out << muestra("webCommand", webCommand);
out << "\"Guillermo\": {";
	out << muestra("posX", elJuego->personajes[0]->posX);
	out << muestra("posY", elJuego->personajes[0]->posY);
	out << muestra("altura", elJuego->personajes[0]->altura);
	out << muestra("orientacion", elJuego->personajes[0]->orientacion);
	out << muestra("objetos", elJuego->personajes[0]->objetos);
out << "\"filler\":\"fillvalue\""  << "},";
out << "\"Adso\": {";
	out << muestra("posX", elJuego->personajes[1]->posX);
	out << muestra("posY", elJuego->personajes[1]->posY);
	out << muestra("altura", elJuego->personajes[1]->altura);
	out << muestra("orientacion", elJuego->personajes[1]->orientacion);
	out << muestra("objetos", elJuego->personajes[1]->objetos);
out << "\"filler\":\"fillvalue\""  << "},";
out << "\"Abad\": {" ; // TODO: la IA solo deberia ver esta info , si Guillermo y el Abad estan en la misma habitacion
	out << muestra("posX", elJuego->personajes[3]->posX) ;
	out << muestra("posY", elJuego->personajes[3]->posY) ;
	out << muestra("altura", elJuego->personajes[3]->altura) ;
	out << muestra("orientacion", elJuego->personajes[3]->altura) ;
	out << muestra("objetos", elJuego->personajes[3]->objetos) ;
out << "\"filler\":\"fillvalue\""  << "}," ;
// TODO, solo dar info de objetos visibles en la habitacion
out << "\"Objeto0\": {" ; // TODO: la IA solo deberia ver esta info , si Guillermo y el Abad estan en la misma habitacion
	out << muestra("posX", elJuego->objetos[0]->posX) ;
	out << muestra("posY", elJuego->objetos[0]->posY) ;
	out << muestra("altura", elJuego->objetos[0]->altura) ;
	out << muestra("orientacion", elJuego->objetos[0]->orientacion) ;
out << "\"filler\":\"fillvalue\""  << "}," ;
out << "\"Objeto1\": {" ; // TODO: la IA solo deberia ver esta info , si Guillermo y el Abad estan en la misma habitacion
	out << muestra("posX", elJuego->objetos[1]->posX) ;
	out << muestra("posY", elJuego->objetos[1]->posY) ;
	out << muestra("altura", elJuego->objetos[1]->altura) ;
	out << muestra("orientacion", elJuego->objetos[1]->orientacion) ;
out << "\"filler\":\"fillvalue\""  << "}," ;
out << "\"Objeto2\": {" ; // TODO: la IA solo deberia ver esta info , si Guillermo y el Abad estan en la misma habitacion
	out << muestra("posX", elJuego->objetos[2]->posX) ;
	out << muestra("posY", elJuego->objetos[2]->posY) ;
	out << muestra("altura", elJuego->objetos[2]->altura) ;
	out << muestra("orientacion", elJuego->objetos[2]->orientacion) ;
out << "\"filler\":\"fillvalue\""  << "}," ;
out << "\"Objeto3\": {" ; // TODO: la IA solo deberia ver esta info , si Guillermo y el Abad estan en la misma habitacion
	out << muestra("posX", elJuego->objetos[3]->posX) ;
	out << muestra("posY", elJuego->objetos[3]->posY) ;
	out << muestra("altura", elJuego->objetos[3]->altura) ;
	out << muestra("orientacion", elJuego->objetos[3]->orientacion) ;
out << "\"filler\":\"fillvalue\""  << "}," ;
out << "\"Objeto4\": {" ; // TODO: la IA solo deberia ver esta info , si Guillermo y el Abad estan en la misma habitacion
	out << muestra("posX", elJuego->objetos[4]->posX) ;
	out << muestra("posY", elJuego->objetos[4]->posY) ;
	out << muestra("altura", elJuego->objetos[4]->altura) ;
	out << muestra("orientacion", elJuego->objetos[4]->orientacion) ;
out << "\"filler\":\"fillvalue\""  << "}," ;
out << "\"Objeto5\": {" ; // TODO: la IA solo deberia ver esta info , si Guillermo y el Abad estan en la misma habitacion
	out << muestra("posX", elJuego->objetos[5]->posX) ;
	out << muestra("posY", elJuego->objetos[5]->posY) ;
	out << muestra("altura", elJuego->objetos[5]->altura) ;
	out << muestra("orientacion", elJuego->objetos[5]->orientacion) ;
out << "\"filler\":\"fillvalue\""  << "}," ;
out << "\"Objeto6\": {" ; // TODO: la IA solo deberia ver esta info , si Guillermo y el Abad estan en la misma habitacion
	out << muestra("posX", elJuego->objetos[6]->posX) ;
	out << muestra("posY", elJuego->objetos[6]->posY) ;
	out << muestra("altura", elJuego->objetos[6]->altura) ;
	out << muestra("orientacion", elJuego->objetos[6]->orientacion) ;
out << "\"filler\":\"fillvalue\""  << "}," ;
out << "\"Objeto7\": {" ; // TODO: la IA solo deberia ver esta info , si Guillermo y el Abad estan en la misma habitacion
	out << muestra("posX", elJuego->objetos[7]->posX) ;
	out << muestra("posY", elJuego->objetos[7]->posY) ;
	out << muestra("altura", elJuego->objetos[7]->altura) ;
	out << muestra("orientacion", elJuego->objetos[7]->orientacion) ;
out << "\"filler\":\"fillvalue\""  << "}," ;
out << "\"filler\":\"fillvalue\"}" << std::endl;

version++;

// TODO: pasar a C++
// TODO: no abrir el fichero en cada pasada
// TODO: el nombre del fichoer deberia cambiar en cada pasada y no machacarse cada vez que se genera captura
// TODO: controlar errores al abrir, cerrar y escribir a fichero
// TODO: optimizar escritura ¿mejor 1 elemento de 640x200 o 200 640 o ...?
/*
	FILE *fp;
	fp=fopen("/tmp/volcadopantalla","w");
	if ( fwrite(elJuego->cpc6128->screenBuffer,640,200,fp) != 640*200 )  
		fprintf(stderr,"liada parda al hacer el screen dump que tanto quiere JT\n");
	fclose(fp);
	*/

// en abadIA no dejamos el modoInformacion activo para que salga la info en cada bucle
// en abadIA se vuelca la informacion cuando lo pide el comando y luego se desactiva
elJuego->modoInformacion=false;

#else
mostrarRejilla=true;
mostrarMapaPlantaActual=true;
mostrarMapaRestoPlantas=true;
#endif

	if (mostrarRejilla){
		// dibuja la rejilla del juego
		dibujaRejilla();
	}

	// obtiene la planta del personaje al que sigue el motor
	int planta = elMotorGrafico->obtenerPlanta(elMotorGrafico->obtenerAlturaBasePlanta(elMotorGrafico->personaje->altura));

	if (mostrarMapaPlantaActual){
		// dibuja el mapa de la planta actual del personaje al que sigue la c�mara
		dibujaAlturaPlanta(planta);

		// dibuja la posici�n de los personajes en el mapa de la planta actual
		muestraPosicionMapaAlturas(planta);
	}

	if (mostrarMapaRestoPlantas){
		// para las plantas que no se muestran, dibuja el mapa peque�o de �stas
		int numMapas = 0;
		for (int i = 0; i < 3; i++){
			if (i != planta){
				dibujaMapa(4 + numMapas*100, i);
				numMapas++;
			}
		}


		// dibuja la posici�n de los personajes en el mapa del resto de plantas
		numMapas = 0;
		for (int i = 0; i < 3; i++){
			if (i != planta){
				muestraPosicionMapa(4 + numMapas*100, i);
				numMapas++;
			}
		}
	}

	if (mostrarLogica){
		// muestra la l�gica general del juego
		muestraInfoLogica(100, 0);
	}

	if (numPersonaje != Juego::numPersonajes){
		// muestra la informaci�n sobre el personaje seleccionado
		muestraInfoPersonaje(numPersonaje, 500, 0);
	}

	if (numObjeto != Juego::numObjetos){
		// muestra la informaci�n sobre el objeto seleccionado
		muestraInfoObjeto(numObjeto, 300, 0);
	}

	if (numPuerta != Juego::numPuertas){
		// muestra la informaci�n sobre la puerta seleccionada
		muestraInfoPuerta(numPuerta, 100, 0);
	}
return out.str();
}

/////////////////////////////////////////////////////////////////////////////
// m�todos para dibujar la rejilla
/////////////////////////////////////////////////////////////////////////////

// dibuja la rejilla
void InfoJuego::dibujaRejilla()
{
	// obtiene la rejilla de la pantalla actual
	RejillaPantalla *rejilla = elMotorGrafico->rejilla;

	// pinta la rejilla de un color dependiendo de su altura
	for (int j = 0; j < 24; j++){
		for (int i = 0; i < 24; i++){
			dibujaPosicionRejilla(i + 1, j, rejilla->bufAlturas[j][i]);
		}
	}
}

// dibuja una posici�n de la rejilla
void InfoJuego::dibujaPosicionRejilla(int x, int y, int valor)
{
	int color = (valor & 0x0f) + 16;

	// si en esa posici�n no hay un personaje, dibuja la altura
	if (valor < 0x10){
		for (int j = 0; j < 4; j++){
			for (int i = 0; i < 4; i++){
				dibujaPixelCuadrado(4*x + i, 4*y + j, color);
			}
		}
	} else {
		// si hay un personaje, dibuja un s�mbolo
		static int gfxPosPersonaje[4][4] = {
			{ 15,  0,  0, 15 },
			{  0, 15, 15,  0 },
			{  0, 15, 15,  0 },
			{ 15,  0,  0, 15 }
		};

		for (int j = 0; j < 4; j++){
			for (int i = 0; i < 4; i++){
				dibujaPixelCuadrado(4*x + i, 4*y + j, (gfxPosPersonaje[j][i] == 0) ? color : gfxPosPersonaje[j][i]);
			}
		}
	}
}

/////////////////////////////////////////////////////////////////////////////
// m�todos para dibujar la altura del mapa de una planta
/////////////////////////////////////////////////////////////////////////////

// genera el mapa de alturas de cada pantalla y lo graba para despu�s
void InfoJuego::generaAlturasPlanta()
{
	// crea un personaje ficticio para generar la altura de todas las pantallas de la planta
	Sprite spr;
	Guillermo pers(&spr);

	// crea un objeto rejilla para obtener la altura de la pantalla en la que se encuentre el personaje
	RejillaPantalla *rejilla = new RejillaPantalla(elMotorGrafico);

	// genera la altura de las 3 plantas
	for (int numPlanta = 0; numPlanta < 3; numPlanta++){
		// calcula la memoria necesaria para guardar la altura de esta planta
		int minX = zonaVisiblePlanta[numPlanta][0];
		int maxX = zonaVisiblePlanta[numPlanta][1];
		int minY = zonaVisiblePlanta[numPlanta][2];
		int maxY = zonaVisiblePlanta[numPlanta][3];

		int longX = maxX - minX + 1;
		int longY = maxY - minY + 1;

		// reserva la memoria necesaria para guardar la altura de esta planta
		alturasPlanta[numPlanta] = new UINT8[longX*longY*16*16];
		UINT8 *alturas = alturasPlanta[numPlanta];

		// limpia la cache de alturas para el mapa
		for (int j = 0; j < longY; j++){
			for (int i = 0; i < longX; i++){
				UINT8 *alturaPantalla = &alturas[(longX*j + i)*16*16];

				for (int y = 0; y < 16; y++){
					for (int x = 0; x < 16; x++){
						alturaPantalla[16*y + x] = 0x00;
					}
				}
			}
		}

		// obtiene el mapa de la planta
		UINT8 *mapa = MotorGrafico::plantas[numPlanta];

		// recorre las pantallas del mapa, rellenando su altura
		for (int j = minY; j <= maxY; j++){
			for (int i = minX; i <= maxX; i++){

				// si la pantalla actual est� definida, guarda su altura
				if ((mapa[16*j + i] != 0) || ((numPlanta == 0) && (i == 0x04) && (j == 0x03))){

					pers.posX = 16*i;
					pers.posY = 16*j;
					pers.altura = alturaBasePlanta[numPlanta];

					rejilla->rellenaAlturasPantalla(&pers);
					UINT8 *alturaPantalla = &alturas[(longX*(j - minY) + i - minX)*16*16];

					// recorre las 16x16 posiciones centrales de la rejilla y guarda su altura
					for (int y = 0; y < 16; y++){
						for (int x = 0; x < 16; x++){
							alturaPantalla[16*y + x] = 0x10 + ((rejilla->bufAlturas[y + 4][x + 4]) & 0x0f);
						}
					}
				}
			}
		}
	}
}

// dibuja el mapa completo de la planta en una posici�n determinada
void InfoJuego::dibujaAlturaPlanta(int numPlanta)
{
	// calcula el zoom a usar seg�n la planta que se muestra
	int zoom = (numPlanta == 0) ? 1 : 2;

	// obtiene el mapa de la planta
	UINT8 *mapa = MotorGrafico::plantas[numPlanta];

	// obtiene la altura de la planta
	UINT8 *alturas = alturasPlanta[numPlanta];

	// obtiene la zona visible de la planta
	int minX = zonaVisiblePlanta[numPlanta][0];
	int maxX = zonaVisiblePlanta[numPlanta][1];
	int minY = zonaVisiblePlanta[numPlanta][2];
	int maxY = zonaVisiblePlanta[numPlanta][3];
	int longX = maxX - minX + 1;
	int posX = 320 - 4 - longX*16*zoom;

	// pinta las casillas del mapa que tienen una pantalla asociada
	for (int j = minY; j <= maxY; j++){
		for (int i = minX; i <= maxX; i++){
			// si la pantalla actual est� definida, la pinta
			if ((mapa[16*j + i] != 0) || ((numPlanta == 0) && (i == 0x04) && (j == 0x03))){

				UINT8 *alturaPantalla = &alturas[(longX*(j - minY) + i - minX)*16*16];
				dibujaAlturaPosicionPlanta(posX, 0, i - minX, j - minY, zoom, alturaPantalla);
			}
		}
	}
}

// dibuja la altura de una pantalla de la planta con un determinado factor de zoom
void InfoJuego::dibujaAlturaPosicionPlanta(int posX, int posY, int i, int j, int zoom, UINT8 *alturas)
{
	for (int y = 0; y < 16; y++){
		for (int x = 0; x < 16; x++){
			for (int zoomY = 0; zoomY < zoom; zoomY++){
				for (int zoomX = 0; zoomX < zoom; zoomX++){
					dibujaPixelCuadrado(posX + (16*i + x)*zoom + zoomX, posY + (16*j + y)*zoom + zoomY, alturas[16*y + x]);
				}
			}
		}
	}
}

/////////////////////////////////////////////////////////////////////////////
// m�todos para dibujar el mapa de una planta
/////////////////////////////////////////////////////////////////////////////

// dibuja el mapa completo de la planta en una posici�n determinada
void InfoJuego::dibujaMapa(int posX, int numPlanta)
{
	// calcula el zoom a usar seg�n la planta que se muestra
	int zoom = (numPlanta == 0) ? 6 : 8;

	// obtiene el mapa de la planta
	UINT8 *mapa = MotorGrafico::plantas[numPlanta];

	// obtiene la zona visible de la planta
	int minX = zonaVisiblePlanta[numPlanta][0];
	int maxX = zonaVisiblePlanta[numPlanta][1];
	int minY = zonaVisiblePlanta[numPlanta][2];
	int maxY = zonaVisiblePlanta[numPlanta][3];

	int longY = maxY - minY + 1;
	int posY = 100 + (160 - 100 - longY*zoom)/2;

	// pinta las casillas del mapa que tienen una pantalla asociada
	for (int j = minY; j <= maxY; j++){
		for (int i = minX; i <= maxX; i++){
			// si la pantalla actual est� definida, la pinta
			if ((mapa[16*j + i] != 0) || ((numPlanta == 0) && (i == 0x04) && (j == 0x03))){
				dibujaPixelCuadradoZoom(posX, posY, i - minX, j - minY, zoom, 0x1f);
			}
		}
	}
}

/////////////////////////////////////////////////////////////////////////////
// m�todos para dibujar las posiciones en los mapas
/////////////////////////////////////////////////////////////////////////////

// muestra la posici�n de los personajes que est�n en el mapa de alturas
void InfoJuego::muestraPosicionMapaAlturas(int numPlanta)
{
	// calcula el zoom a usar seg�n la planta que se muestra
	int zoom = (numPlanta == 0) ? 1 : 2;

	// obtiene la zona visible de la planta
	int minX = zonaVisiblePlanta[numPlanta][0];
	int maxX = zonaVisiblePlanta[numPlanta][1];
	int minY = zonaVisiblePlanta[numPlanta][2];

	int longX = maxX - minX + 1;
	int posX = 320 - 4 - longX*16*zoom;

	// recorre los personajes pintando la posici�n que ocupan
	for (int i = 0; i < Juego::numPersonajes; i++){
		Personaje *pers = elJuego->personajes[i];

		// si el personaje no est� en la abad�a, pasa al siguiente personaje
		if ((pers->posX == 0) && (pers->posY == 0) && (pers->altura == 0)) continue;

		// si el personaje no est� en esta planta, pasa al siguiente
		if (elMotorGrafico->obtenerPlanta(elMotorGrafico->obtenerAlturaBasePlanta(pers->altura)) != numPlanta) continue;

		// calcula el desplazamiento dentro del mapa
		int despX = (((pers->posX & 0xf0) >> 4) - minX)*16 + (pers->posX & 0x0f);
		int despY = (((pers->posY & 0xf0) >> 4) - minY)*16 + (pers->posY & 0x0f);

		// dibuja la posici�n dentro del mapa
		dibujaPixelCuadradoZoom(posX, 0, despX, despY, zoom, 4 + i);
	}
}

// muestra la posici�n de los personajes que est�n en los mapas peque�os
void InfoJuego::muestraPosicionMapa(int posX, int numPlanta)
{
	// calcula el zoom a usar seg�n la planta que se muestra
	int zoom = (numPlanta == 0) ? 6 : 8;

	// obtiene la zona visible de la planta
	int minX = zonaVisiblePlanta[numPlanta][0];
	int maxX = zonaVisiblePlanta[numPlanta][1];
	int minY = zonaVisiblePlanta[numPlanta][2];
	int maxY = zonaVisiblePlanta[numPlanta][3];

	int longY = maxY - minY + 1;
	int posY = 100 + (160 - 100 - longY*zoom)/2;

	// recorre los personajes pintando la posici�n que ocupan
	for (int i = 0; i < Juego::numPersonajes; i++){
		Personaje *pers = elJuego->personajes[i];

		// si el personaje no est� en la abad�a, pasa al siguiente personaje
		if ((pers->posX == 0) && (pers->posY == 0) && (pers->altura == 0)) continue;

		// si el personaje no est� en esta planta, pasa al siguiente
		if (elMotorGrafico->obtenerPlanta(elMotorGrafico->obtenerAlturaBasePlanta(pers->altura)) != numPlanta) continue;

		// calcula el desplazamiento dentro del mapa
		int despX = (((pers->posX & 0xf0) >> 4) - minX)*zoom + (pers->posX & 0x0f)*zoom/16;
		int despY = (((pers->posY & 0xf0) >> 4) - minY)*zoom + (pers->posY & 0x0f)*zoom/16;

		bool pixelValido = (((pers->posX & 0xf0) >> 4) >= minX) && (((pers->posX & 0xf0) >> 4) <= maxX) &&
							(((pers->posY & 0xf0) >> 4) >= minY) && (((pers->posY & 0xf0) >> 4) <= maxY);
		//assert(pixelValido);

		if (pixelValido){
			// dibuja la posici�n dentro del mapa
			dibujaPixelCuadrado(posX + despX, posY + despY, 4 + i);
		}
	}
}

/////////////////////////////////////////////////////////////////////////////
// m�todos para mostrar informaci�n sobre la l�gica y las entidades del juego
/////////////////////////////////////////////////////////////////////////////

// muestra por pantalla la informaci�n relativa a la l�gica del juego
void InfoJuego::muestraInfoLogica(int x, int y)
{
	std::ostringstream strBuf;
	strBuf << "Variables de logica" << std::endl
		<< "===================" << std::endl
		<< "dia = " << muestra(laLogica->dia) << std::endl
		<< "momentoDia = " << muestra(laLogica->momentoDia) << std::endl
		<< "durMomentoDia = " << muestra(laLogica->duracionMomentoDia) << std::endl
		<< "oldMomentoDia = " << muestra(laLogica->oldMomentoDia) << std::endl
		<< "avanzMomentoDia = " << muestra(laLogica->avanzarMomentoDia) << std::endl
		<< "obsequium = " << muestra(laLogica->obsequium) << std::endl
		<< "haFracasado = " << muestra(laLogica->haFracasado) << std::endl
		<< "investigacionCompleta = " << muestra(laLogica->investigacionCompleta) << std::endl
		<< "bonus = " << muestra(laLogica->bonus) << std::endl

		<< "mascaraPuertas = " << muestra(laLogica->mascaraPuertas) << std::endl

		<< "espejoCerrado = " << muestra(laLogica->espejoCerrado) << std::endl
		<< "numeroRomano = " << muestra(laLogica->numeroRomano) << std::endl

		<< "seAcabaLaNoche = " << muestra(laLogica->seAcabaLaNoche) << std::endl
		<< "haAmanecido = " << muestra(laLogica->haAmanecido) << std::endl
		<< "usandoLampara = " << muestra(laLogica->usandoLampara) << std::endl
		<< "tiempoUsoLampara = " << muestra(laLogica->tiempoUsoLampara) << std::endl
		<< "cambioEstadoLampara = " << muestra(laLogica->cambioEstadoLampara) << std::endl
		<< "cntTiempoAOscuras = " << muestra(laLogica->cntTiempoAOscuras) << std::endl

		<< "cntLeeLibroSinGuantes = " << muestra(laLogica->cntLeeLibroSinGuantes) << std::endl
		<< "pergaminoGuardado = " << muestra(laLogica->pergaminoGuardado) << std::endl

		<< "hayMovimiento = " << muestra(laLogica->hayMovimiento) << std::endl
		<< "cntMovimiento = " << muestra(laLogica->cntMovimiento) << std::endl

		<< "numPersonajeCamara = " << muestra(laLogica->numPersonajeCamara) << std::endl
		<< "opcionPersonajeCamara = " << muestra(laLogica->opcionPersonajeCamara) << std::endl;

	theFontManager->print(VigasocoMain->getDrawPlugin(), strBuf.str(), x, y);
}

// muestra por pantalla la informaci�n relativa a el personaje i
void InfoJuego::muestraInfoPersonaje(int i, int x, int y)
{
	Personaje *pers = elJuego->personajes[i];

	std::ostringstream strBuf;
	strBuf << "Personaje = " << i << std::endl
		<< "=============" << std::endl
		<< muestraPersonaje(i, pers) << std::endl
		<< "Sprite asociado" << std::endl
		<< "===============" << std::endl
		<< muestraSprite(pers->sprite) << std::endl;
	theFontManager->print(VigasocoMain->getDrawPlugin(), strBuf.str(), x, y);
}

// muestra por pantalla la informaci�n relativa a la puerta i
void InfoJuego::muestraInfoPuerta(int i, int x, int y)
{
	Puerta *puerta = elJuego->puertas[i];

	std::ostringstream strBuf;
	strBuf <<  "Puerta = " << i << std::endl
		<< "==========" << std::endl
		<< muestraPuerta(puerta) << std::endl
		<< "Sprite asociado" << std::endl
		<< "===============" << std::endl
		<< muestraSprite(puerta->sprite) << std::endl;
	theFontManager->print(VigasocoMain->getDrawPlugin(), strBuf.str(), x, y);
}

// muestra por pantalla la informaci�n relativa al objeto i
void InfoJuego::muestraInfoObjeto(int i, int x, int y)
{
	Objeto *obj = elJuego->objetos[i];

	std::ostringstream strBuf;
	strBuf <<  "Objeto = " << i << std::endl
		<< "==========" << std::endl
		<< muestraObjeto(obj) << std::endl
		<< "Sprite asociado" << std::endl
		<< "===============" << std::endl
		<< muestraSprite(obj->sprite) << std::endl;
	theFontManager->print(VigasocoMain->getDrawPlugin(), strBuf.str(), x, y);
}

/////////////////////////////////////////////////////////////////////////////
// conversi�n de tipos a cadenas
/////////////////////////////////////////////////////////////////////////////

// muestra la informaci�n relativa a una entidad
std::string InfoJuego::muestraEntidad(EntidadJuego *entidad)
{
	std::ostringstream strBuf;
	strBuf << "pos = (" + muestra(entidad->posX) + ", " + muestra(entidad->posY) + ", " + muestra(entidad->altura) + ")" << std::endl
		<< "orientacion = " << muestra(entidad->orientacion) << std::endl;
	return strBuf.str();
}

// muestra la informaci�n relativa a un personaje
std::string InfoJuego::muestraPersonaje(int i, Personaje *pers)
{
	std::ostringstream strBuf;
	strBuf << "estado = " << muestra(pers->estado) << std::endl
		<< muestraEntidad(pers) << std::endl
		<< "cntAnim = " << muestra(pers->contadorAnimacion) << std::endl
		<< "bajando = " << muestra(pers->bajando) << std::endl
		<< "enDesnivel = " << muestra(pers->enDesnivel) << std::endl
		<< "giroDesnivel = " << muestra(pers->giradoEnDesnivel) << std::endl
		<< "flipX = " << muestra(pers->flipX) << std::endl
		<< "objetos = " << muestra(pers->objetos) << std::endl
		<< "mascaraObjs = " << muestra(pers->mascaraObjetos) << std::endl
		<< "contadorObjs = " << muestra(pers->contadorObjetos) << std::endl;

	if (i != 0){
		PersonajeConIA *pIA = (PersonajeConIA *)pers;
		strBuf << "numBitAcciones = " << muestra(pIA->numBitAcciones) << std::endl
				<< "pensarNuevoMov = " << muestra(pIA->pensarNuevoMovimiento) << std::endl
				<< "accionActual = " << muestra(pIA->accionActual) << std::endl
				<< "posAcciones = " << muestra(pIA->posAcciones) << std::endl
				<< "aDondeVa = " << muestra(pIA->aDondeVa) << std::endl
				<< "aDondeHaLleg = " << muestra(pIA->aDondeHaLlegado) << std::endl;
	}

	return strBuf.str();
}

// muestra la informaci�n relativa a una puerta
std::string InfoJuego::muestraPuerta(Puerta *puerta)
{
	std::ostringstream strBuf;
	strBuf << muestraEntidad(puerta)
		<< "identificador = " << muestra(puerta->identificador) << std::endl
		<< "estaAbierta = " << muestra(puerta->estaAbierta) << std::endl
		<< "haciaDentro = " << muestra(puerta->haciaDentro) << std::endl
		<< "estaFija = " << muestra(puerta->estaFija) << std::endl
		<< "hayQueRedibujar = " << muestra(puerta->hayQueRedibujar) << std::endl;
	return strBuf.str();
}

// muestra la informaci�n relativa a un objeto
std::string InfoJuego::muestraObjeto(Objeto *obj)
{
	std::ostringstream strBuf;

	if (!obj->seHaCogido){
		strBuf << muestraEntidad(obj)
			<< "seEstaCogiendo = " << muestra(obj->seEstaCogiendo) << std::endl
			<< "seHaCogido = " << muestra(obj->seHaCogido) << std::endl;
	} else {
		strBuf << "pos = (" + muestra(obj->personaje->posX) + ", " + muestra(obj->personaje->posY) + ", " + muestra(obj->personaje->altura) + ")" << std::endl
		<< "orientacion = " << muestra(obj->personaje->orientacion) << std::endl
		<< "seEstaCogiendo = " << muestra(obj->seEstaCogiendo) << std::endl
		<< "seHaCogido = " << muestra(obj->seHaCogido) << std::endl;
	}
	return strBuf.str();
}

// muestra la informaci�n relativa a un sprite
std::string InfoJuego::muestraSprite(Sprite *spr)
{
	std::ostringstream strBuf;
	strBuf	<< "esVisible = " << muestra(spr->esVisible) << std::endl
		<< "haCambiado = " << muestra(spr->haCambiado) << std::endl
		<< "desaparece = " << muestra(spr->desaparece) << std::endl
		<< "profundidad = " << muestra(spr->profundidad) << std::endl
		<< "posPant = (" << muestra(spr->posXPant) << ", " << muestra(spr->posYPant) << ")" << std::endl
		<< "oldPosPant = (" << muestra(spr->oldPosXPant) << ", " << muestra(spr->oldPosYPant) << ")" << std::endl
		<< "dim = (" << muestra(spr->ancho) << ", " << muestra(spr->alto) << ")" << std::endl
		<< "oldDim = (" << muestra(spr->oldAncho) << ", " << muestra(spr->oldAlto) << ")" << std::endl
		<< "posTile = (" << muestra(spr->posXTile) << ", " << muestra(spr->posYTile) << ")" << std::endl
		<< "dimFinal = (" << muestra(spr->anchoFinal) << ", " << muestra(spr->altoFinal) << ")" << std::endl
		<< "posLocal = (" << muestra(spr->posXLocal) << ", " << muestra(spr->posYLocal) << ")" << std::endl
		<< "despGfx = " << muestra(spr->despGfx) << std::endl
		<< "despBuffer = " << muestra(spr->despBuffer) << std::endl;
	return strBuf.str();
}

/////////////////////////////////////////////////////////////////////////////
// conversi�n de valores a cadenas
/////////////////////////////////////////////////////////////////////////////
std::string InfoJuego::muestra(std::string clave, std::string valor)
{
	std::ostringstream strBuf;
	strBuf << "\"" << clave << "\": \"" << valor << "\",";
	return strBuf.str();
}

std::string InfoJuego::muestra(std::string clave, char valor)
{
	std::ostringstream strBuf;
	strBuf << "\"" << clave << "\": \"" << valor << "\",";
	return strBuf.str();
}


std::string InfoJuego::muestra(std::string clave, long valor)
{
	std::ostringstream strBuf;
	strBuf << "\"" << clave << "\": \"" << valor << "\",";
	return strBuf.str();
}

std::string InfoJuego::muestra(std::string clave, int valor)
{
	std::ostringstream strBuf;
	strBuf << "\"" << clave << "\": \"" << valor << "\",";
	return strBuf.str();
}

std::string InfoJuego::muestra(int valor)
{
	std::ostringstream strBuf;
    strBuf << std::setfill('0') << std::setw(2) << std::hex << (UINT16)valor;
	return strBuf.str();
}

std::string InfoJuego::muestra(bool valor)
{
	return (valor) ? "true" : "false";
}

/////////////////////////////////////////////////////////////////////////////
// m�todos auxiliares
/////////////////////////////////////////////////////////////////////////////

// dibuja un pixel que ocupe 2x2 posiciones en el bitmap final
void InfoJuego::dibujaPixelCuadrado(int x, int y, int color)
{
	assert((x >= 0) && (x < 320));
	assert((y >= 0) && (y < 200));
	assert((color >= 0) && (color < 32));

	cpc6128->setPixel(2*x, y, color);
	cpc6128->setPixel(2*x + 1, y, color);
}

// igual que el m�todo anterior pero con un factor de zoom
void InfoJuego::dibujaPixelCuadradoZoom(int posX, int posY, int i, int j, int zoom, int color)
{
	for (int zoomY = 0; zoomY < zoom; zoomY++){
		for (int zoomX = 0; zoomX < zoom; zoomX++){
			dibujaPixelCuadrado(posX + i*zoom + zoomX, posY + j*zoom + zoomY, color);
		}
	}
}
