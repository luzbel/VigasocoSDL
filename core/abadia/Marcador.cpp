// Marcador.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "../systems/cpc6128.h"

#include "Abad.h"
#include "Juego.h"
#include "Logica.h"
#include "Marcador.h"
#include "Paleta.h"
#include "Sprite.h"

//para printf trazas
#include <stdio.h>

using namespace Abadia;

/////////////////////////////////////////////////////////////////////////////
// duración de las etapas del día
/////////////////////////////////////////////////////////////////////////////

int Marcador::duracionEtapasDia[7][7] = {
	{ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
	{ 0x00, 0x00, 0x05, 0x00, 0x05, 0x00, 0x00 },
	{ 0x00, 0x00, 0x05, 0x00, 0x05, 0x00, 0x00 },
	{ 0x0f, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00 },
	{ 0x0f, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00 },
	{ 0x0f, 0x00, 0x05, 0x00, 0x05, 0x00, 0x00 },
	{ 0x0f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }
};

/////////////////////////////////////////////////////////////////////////////
// inicialización y limpieza
/////////////////////////////////////////////////////////////////////////////

Marcador::Marcador()
{
	cpc6128 = elJuego->cpc6128;
	roms = elJuego->roms;
}

Marcador::~Marcador()
{
}

/////////////////////////////////////////////////////////////////////////////
// métodos relacionados con los días y los momentos del día
/////////////////////////////////////////////////////////////////////////////

// avanza el momento del día del marcador
void Marcador::muestraDiaYMomentoDia()
{
	// coloca una paleta según el momento del día
	/* 
	if (laLogica->momentoDia < VISPERAS){
		elJuego->paleta->setGamePalette(2);
	} else {
		elJuego->paleta->setGamePalette(3);
	}
	*/
	if (laLogica->momentoDia == NOCHE ||
		laLogica->momentoDia == COMPLETAS){
		elJuego->paleta->setGamePalette(3);
	} else {
		elJuego->paleta->setGamePalette(2);
	}


	// dibuja el número de día en el marcador
	dibujaDia(laLogica->dia);

	// hace que avance el momento del día, para mostrar el efecto de scroll en las letras del día
	laLogica->momentoDia = laLogica->momentoDia - 1;
	avanzaMomentoDia();
}

// avanza el momento del día
void Marcador::avanzaMomentoDia()
{
	laLogica->momentoDia = laLogica->momentoDia + 1;

	// si se han terminado los momentos del día, avanza al siguiente día
	if (laLogica->momentoDia > COMPLETAS){
		laLogica->momentoDia = 0;
		laLogica->dia = laLogica->dia + 1;

		// si se ha terminado el séptimo día, vuelve al primer día
		if (laLogica->dia > 7){
			laLogica->dia = 1;
		}

		// dibuja el nuevo día en el marcador
		dibujaDia(laLogica->dia);
	}

	// obtiene un puntero a los caracteres que forman el momento del día
	nombreMomentoDia = &roms[0x4fbc + 7*laLogica->momentoDia];

	// quedan 9 caracteres para completar el scroll del nombre del día
	numPosScrollDia = 9;

	// obtiene la duración de esta etapa del día
	laLogica->duracionMomentoDia = duracionEtapasDia[laLogica->dia - 1][laLogica->momentoDia]*0x100;
}

// dibuja el día en el marcador
void Marcador::dibujaDia(int numDia)
{
	// indexa en la tabla de los días
	UINT8 *data = &roms[0x4fa7 + (numDia - 1)*3];

	// dibuja los 3 números romanos que forman el día en el que se está
	dibujaDigitoDia(data[0], 68, 165);
	dibujaDigitoDia(data[1], 68 + 8, 165);
	dibujaDigitoDia(data[2], 68 + 16, 165);
}

// dibuja un número romano que forma el día en la posición que se le pasa
void Marcador::dibujaDigitoDia(int digito, int x, int y)
{
	/* CPC
	// apunta a 8 pixels negros
	int despDigito = 0x5581;

	// si se le pasó una 'I'
	if (digito == 2){
		despDigito = 0xab49;
	} else if (digito == 1){
		// si se le pasó una 'V'
		despDigito = 0xab39;
	}

	// obtiene un puntero a los gráficos del dígito
	UINT8 *data = &roms[despDigito];

	// rellena las 8 líneas que ocupa la letra
	for (int j = 0; j < 8; j++){
		// cada dígito tiene 8 pixels de ancho
		for (int i = 0; i < 2; i++){
			for (int k = 0; k < 4; k++){
				cpc6128->setMode1Pixel(x + 4*i + k, y + j, cpc6128->unpackPixelMode1(*data, k));
			}
			data++;
		}

		// si no había que mostrar ningún dígito, mantiene el puntero en los pixels negros
		if (digito == 0){
			data = data - 2;
		}
	}
	*/
	// VGA
	// apunta a 8 pixels negros
	int despDigito = 72108+(8*8*2);

	// si se le pasó una 'I'
	if (digito == 2){
		despDigito = 72108+(8*8*1);
	} else if (digito == 1){
		// si se le pasó una 'V'
		despDigito = 72108;
	}

	// obtiene un puntero a los gráficos del dígito
	UINT8 *data = &roms[despDigito+0x24000-1-0x4000]; // pasar a la zona VGA y dentro buscar el digito

	// rellena las 8 líneas que ocupa la letra
	for (int j = 0; j < 8; j++){
		// cada dígito tiene 8 pixels de ancho
		for (int i = 0; i < 8; i++){
			cpc6128->setVGAPixel(x + i, y + j,*data++);
		}
/* ?? no hace falta, en los graficos VGA estan los 8x8 pixeles negros ???
		// si no había que mostrar ningún dígito, mantiene el puntero en los pixels negros
		if (digito == 0){
			data = data - 2;
		}
		*/
	}
}

// realiza el efecto de scroll en la parte del marcador que muestra el momento del día
void Marcador::realizaScrollMomentoDia()
{
	// si todavía quedan posiciones para desplazar
	if (numPosScrollDia != 0){
		numPosScrollDia--;

		int caracter = 0x20;

		// en las 2 primeras posiciones del scroll, se ponen caracteres de espacio
		if (numPosScrollDia < 7) {
			caracter = *nombreMomentoDia;
			nombreMomentoDia++;
		}

		// 8 líneas de alto
		for (int j = 0; j < 8; j++){
			// desplaza 48/8 = 6 caracteres a la izquierda 1 caracter (cada caracter es de 8x8)
			for (int i = 0; i < 48; i++){
				// CPC cpc6128->setMode1Pixel(44 + i - 8, 180 + j, cpc6128->getMode1Pixel(44 + i, 180 + j));
				// VGA
				cpc6128->setVGAPixel(44 + i - 8, 180 + j, cpc6128->getMode1Pixel(44 + i, 180 + j));
			}
		}
		
		// imprime el caracter que toca
		// CPC imprimirCaracter(caracter, 84, 180, 3, 2);
		imprimirCaracter(caracter, 84, 180, 0, 4); // VGA
	}
}
/////////////////////////////////////////////////////////////////////////////
// métodos relacionados con el obsequium
/////////////////////////////////////////////////////////////////////////////

// decrementa la barra de obsequium
void Marcador::decrementaObsequium(int unidades)
{
	laLogica->obsequium = laLogica->obsequium - unidades;

	// si se ha terminado el obsequium
	if (laLogica->obsequium < 0){
		// si guillermo no ha muerto, cambia el estado del abad para que le eche de la abadía
		if (!laLogica->haFracasado){
			laLogica->abad->estado = 0x0b;
		}

		laLogica->obsequium = 0;
	}

	// dibuja la parte de la barra correspondiente a la vida que tenemos
	// CPC dibujaBarra(laLogica->obsequium, 2, 240, 177);
	dibujaBarra(laLogica->obsequium, 6, 240, 177); // VGA

	// dibuja la parte de la barra correspondiente a la vida que no tenemos
	// CPC dibujaBarra(31 - laLogica->obsequium + 1, 3, 240 + laLogica->obsequium, 177);
	dibujaBarra(31 - laLogica->obsequium + 1, 0, 240 + laLogica->obsequium, 177); // VGA
}

// dibuja una barra de la longitud y color especificados
void Marcador::dibujaBarra(int lgtud, int color, int x, int y)
{
	if (lgtud != 0){
		cpc6128->fillMode1Rect(x, y, lgtud, 6, color);
	}
}

/////////////////////////////////////////////////////////////////////////////
// dibujo del marcador
/////////////////////////////////////////////////////////////////////////////

// limpia el área que ocupa el marcador
void Marcador::limpiaAreaMarcador()
{
//TODO revisar si al poner las traducciones con caracteres de 8x10
// en vez de 8x8, hay que cambiar esto
	// CPC cpc6128->fillMode1Rect(0, 160, 320, 40, 3);
	cpc6128->fillMode1Rect(0, 160, 320, 40, 0); // VGA
}

// dibuja el marcador
void Marcador::dibujaMarcador()
{
//TODO igual hay que coger el marcardor del GraficosVGA de la nueva versión del remake
// Ver si tiene 32 pixeles o 34 o 35, para dejar hueco para los 2 pixeles de mas de los
// acentos
	/* CPC
	// apunta a los datos gráficos del marcador
	UINT8 *data = &roms[0x1e328];

	// dibuja las 32 líneas que forman el marcador en la parte inferior de la pantalla
	for (int j = 0; j < 32; j++){
		for (int i = 0; i < 256/4; i++){
			for (int k = 0; k < 4; k++){
				cpc6128->setMode1Pixel(32 + 4*i + k, 160 + j, cpc6128->unpackPixelMode1(*data, k));
			}
			data++;
		}
	}
	*/
	// VGA
	// apunta a los datos gráficos del marcador
	UINT8 *data = &roms[0x24000 -1 - 0x4000 + 0xB200];

	// dibuja las 32 líneas que forman el marcador en la parte inferior de la pantalla
	for (int j = 0; j < 32; j++){
		for (int i = 0; i < 256; i++){
			cpc6128->setVGAPixel(32 + i , 160 + j, *data++);
		}
	}	
	// TODO 
	// chapuza temporal
	// como los nuevos caracteres ocupan 8x10 en vez de 8x8
	// se machacan algunos pixeles del marcador al hacer scroll de las letras
	// voy a borrarlos antes para que no quede un efecto feo
	// la solucion alternativa adoptada en el remake PC con traducciones es dibujar
	// un nuevo marcador con espacio suficiente
	cpc6128->fillMode1Rect(96, 162, 128, 2, 0);
}

// dibuja los objetos que tenemos en el marcador
void Marcador::dibujaObjetos(int objetos, int mascara)
{
// TODO esto cambiara si se usa el otro marcador con huecos para acentos
	int posX = 100;
	int posY = 176;
	Sprite **sprites = elJuego->sprites;

	// recorre los 6 huecos posibles
	for (int numHuecos = 0; numHuecos < 6; numHuecos++){
		// si se han procesado todos los objetos que había que actualizar, sale
		if (mascara == 0){
			return;
		}

		// averigua si hay que comprobar el objeto actual
		if ((mascara & (1 << (Juego::numObjetos - 1))) != 0){
			// si tenemos el objeto, lo dibuja
			if ((objetos & (1 << (Juego::numObjetos - 1))) != 0){
				Sprite *spr = sprites[Juego::primerSpriteObjetos + numHuecos];

				// obtiene un puntero a los gráficos del objeto
				// CPC UINT8 *data = &roms[spr->despGfx];
				// VGA
				UINT8 *data = &roms[spr->despGfx + 0x24000 - 1 - 0x4000];

				// dibuja el objeto
				for (int j = 0; j < spr->alto; j++){
					// CPC for (int i = 0; i < spr->ancho; i++){
					for (int i = 0; i < spr->ancho*4; i++){
						/* CPC
						for (int k = 0; k < 4; k++){
							cpc6128->setMode1Pixel(posX + 4*i + k, posY + j, cpc6128->unpackPixelMode1(*data, k));
						}
						data++;
						*/
						// VGA
						int pixel=*data++;
						if (pixel!=255) cpc6128->setVGAPixel(posX + i, posY + j,pixel);
					}
				}
			} else {
				// en otro caso, limpia el hueco (12x16 pixels)
				for (int j = 0; j < 12; j++){
					for (int i = 0; i < 16; i++){
						cpc6128->setMode1Pixel(posX + i, posY + j, 0);
					}
				}
			}
		}

		// pasa al siguiente objeto
		mascara = mascara << 1;
		objetos = objetos << 1;

		// avanza la posición al siguiente hueco
		posX += 20;

		// al pasar del tercer al cuarto hueco, hay 4 pixels extra
		if (numHuecos == 2){
			posX += 4;
		}
	}
}

/////////////////////////////////////////////////////////////////////////////
// dibujo de frases
/////////////////////////////////////////////////////////////////////////////

// limpia la zona del marcador en donde se muestran las frases
void Marcador::limpiaAreaFrases()
{
//TODO revisar si al poner las traducciones con caracteres de 8x10
// en vez de 8x8, hay que cambiar esto
	// CPC cpc6128->fillMode1Rect(96, 164, 128, 8, 3);
	cpc6128->fillMode1Rect(96, 164, 128, 8, 0); // VGA 
}

// recorre los caracteres de la frase, mostrándolos por pantalla
void Marcador::imprimeFrase(std::string frase, int x, int y, int colorTexto, int colorFondo)
{
	for (unsigned int i = 0; i < frase.length(); i++){
		imprimirCaracter(frase[i], x + 8*i, y, colorTexto, colorFondo);
	}
}

void Marcador::imprimirCaracter(int caracter, int x, int y, int colorTexto, int colorFondo)
{
	switch(caracter) {
		case ',': caracter=0x3c; break;
		case '.': caracter=0x3d; break;
		case '¿': caracter=0x40; break;
		case 'Ñ': caracter=0x57; break;
		case 'W': caracter=0xd1; break;
	}


	int largo=10; // algunos caracteres son de 8x8 y otros de 8x10
	// TODO queda muy feo declarar esto en la funcion. Llevar a objetos estáticos de la clase
	static const UINT8 c0[10] = { 0x18,0x0c,0x00,0x3c,0x66,0xc6,0xfe,0xc6,0xe6,0x66 }; // À
	static const UINT8 c1[10] = { 0x18,0x30,0x00,0x3c,0x66,0xc6,0xfe,0xc6,0xe6,0x66 }; // Á 
	static const UINT8 c2[10] = { 0x38,0x6c,0x00,0x3c,0x66,0xc6,0xfe,0xc6,0xe6,0x66 }; // Â
	static const UINT8 c3[10] = { 0x36,0x6c,0x00,0x3c,0x66,0xc6,0xfe,0xc6,0xe6,0x66 }; // Ã
	static const UINT8 c4[10] = { 0x00,0x6c,0x00,0x3c,0x66,0xc6,0xfe,0xc6,0xe6,0x66 }; // Ä
	static const UINT8 c7[10] = { 0x00,0x00,0x00,0x78,0xc6,0xc0,0xe6,0x7c,0x18,0x30 }; //  Ç
	static const UINT8 c8[10] = { 0x30,0x18,0x00,0xdc,0xe6,0x60,0x7c,0x60,0xe6,0xdc }; // È
	static const UINT8 c9[10] = { 0x18,0x30,0x00,0xdc,0xe6,0x60,0x7c,0x60,0xe6,0xdc }; // É
	static const UINT8 ca[10] = { 0x38,0x6c,0x00,0xdc,0xe6,0x60,0x7c,0x60,0xe6,0xdc }; // Ê 
	static const UINT8 cd[10] = { 0x0c,0x18,0x00,0x7e,0x98,0x30,0x30,0x30,0x1a,0xfc }; // Í 
	static const UINT8 cf[10] = { 0x00,0x6c,0x00,0x7e,0x98,0x30,0x30,0x30,0x1a,0xfc }; // Ï
	// la d1 es la enye Ñ , que está en las fuentes normales en el lugar de la W, 
	// que no se usaba en español 
	static const UINT8 d2[10] = { 0x30,0x18,0x00,0x38,0x6c,0xc6,0xc6,0xc6,0xee,0x7c }; // Ò
	static const UINT8 d3[10] = { 0x18,0x30,0x00,0x38,0x6c,0xc6,0xc6,0xc6,0xee,0x7c }; // Ó 
	static const UINT8 d5[10] = { 0x36,0x6c,0x00,0x38,0x6c,0xc6,0xc6,0xc6,0xee,0x7c }; // Ö 
	static const UINT8 d6[10] = { 0x00,0x6c,0x00,0x38,0x6c,0xc6,0xc6,0xc6,0xee,0x7c }; // Õ 
	static const UINT8 d9[10] = { 0x18,0x0c,0x00,0xe6,0x66,0xc6,0xc6,0xc6,0xc6,0x7c }; // Ù 
	static const UINT8 da[10] = { 0x18,0x30,0x00,0xe6,0x66,0xc6,0xc6,0xc6,0xc6,0x7c }; // Ú 

	static const UINT8 d1[10] = { 0x00,0x00,0x00,0x66,0xe6,0xc6,0xd6,0xd6,0xfe,0x66 }; // w


	static const UINT8 ui[10] = { 0x00,0x00,0x00,0x00,0x00,0x00,0x7e,0xfc,0x00,0x00 }; // -
	static const UINT8 uj[10] = { 0x00,0x00,0x00,0x30,0x30,0x10,0x20,0x00,0x00,0x00 }; // '

	// inicialmente se apunta a los datos del espacio en blanco
	const UINT8 * data = &roms[0x38e7];

	// Como los nuevos caracteres para las traducciones y acentos son de 8x10
	// en vez de 8x8, hay que empezar a dibujarlos 2 lineas antes para que
	// que queden cuadrados facilmente
	y=y-2;

	switch(caracter)
	{
		case 'À': data=c0; break;
		case 'Á': data=c1; break;
		case 'Â': data=c2; break;
		case 'Ã': data=c3; break;
		case 'Ä': data=c4; break;
		case 'Ç': data=c7; break;
		case 'È': data=c8; break;
		case 'É': data=c9; break;
		case 'Ê': data=ca; break;
		case 'Í': data=cd; break;
		case 'Ï': data=cf; break;
		// case 'Ñ': data=; break; // intercambiado con la W 0x57
		case 'Ò': data=d2; break;
		case 'Ó': data=d3; break;
		case 'Õ': data=d6; break;
		case 'Ö': data=d5; break;
		case 'Ù': data=d9; break;
		case 'Ú': data=da; break;
		case 0xd1: data=d1; break; // la ñ se cambia por la w y la w por esta
		case '-': data=ui; break;
		case '\'': data=uj; break;
		default: {

				 if ((unsigned int)caracter>127) 
					printf("ERROR, no existe grafico para el caracter "
						"%c %u \n", caracter, (unsigned char)caracter);

				 // se asegura de que el caracter esté entre 0 y 127
				 caracter &= 0x7f;

				 // si es un caracter no imprimible, sale
				 if ((caracter != 0x20) && (caracter < 0x2d)){
					 return;
				 }

				 // inicialmente se apunta a los datos del espacio en blanco
				 //	UINT8 *data = &roms[0x38e7];

				 // si el caracter no es un espacio en blanco, 
				 // modifica el puntero a los datos del caracter
				 if (caracter != 0x20){
					 data = &roms[0xb400 + 8*(caracter - 0x2d)];
				 }
				 largo=8;
				 // limpio los 2 pixeles de mas que hayan podido
				 // dejar los caracteres de 8x10 antes
				 // TODO: esto cambiaria si se usa un marcador con mas espacio
				 cpc6128->fillMode1Rect(x, y, 8, 2, colorFondo);
				 y=y+2;

				break;
			 }

	}

	// los caracteres normales son de 8x8 pixels
	// los añadidos para las traducciones son de 8x10
	for (int j = 0; j < largo; j++){
		int bit = 0x80;
		int valor = *data;

		for (int i = 0; i < 8; i++){
			cpc6128->setMode1Pixel(x + i, y + j, 
				(valor & bit) ? colorTexto : colorFondo);
			bit = bit >> 1;
		}
		data++;
	}
}
