// Paleta.cpp
/////////////////////////////////////////////////////////////////////////////

#include "../systems/cpc6128.h"
#include "../Vigasoco.h"

#include "Juego.h"
#include "Paleta.h"

using namespace Abadia;

/////////////////////////////////////////////////////////////////////////////
// paletas del juego
/////////////////////////////////////////////////////////////////////////////

int Paleta::introPalette[16] = { 07, 20, 11, 03, 06, 12, 04, 21, 13, 05, 14, 29, 00, 28, 31, 27 };

int Paleta::palettes[4][4] = {
	{ 20, 20, 20, 20 },		// paleta negra
	{ 07, 28, 20, 12 },		// paleta del pergamino
	{ 06, 14, 03, 20 },		// paleta de día durante el juego
	{ 04, 29, 00, 20 }		// paleta de noche durante el juego
};


// 
int Paleta::despPaletasVGA[6] = {
	-1,		// paleta negra , en realidad no la tenemos en fichero y la generamos en codigo
	0xC00,		// paleta del pergamino TODO: FALTA POR COMPROBAR QUE ESTA PALETA ES PARA EL PERGAMINO
	0,		// paleta de día durante el juego
	0x400,		// paleta de noche durante el juego
	0x800,		// paleta lampara TODO: FALTA HACER CAMBIOS EN EL CODIGO PARA QUE LA USE
	0x1000		// paleta introduccion
};


/////////////////////////////////////////////////////////////////////////////
// inicialización y limpieza
/////////////////////////////////////////////////////////////////////////////

Paleta::Paleta(UINT8 *gfxVGA)
{
	paleta = VigasocoMain->getPalette();
	cpc6128 = elJuego->cpc6128;
	PaletasVGA = gfxVGA;
}

Paleta::~Paleta()
{
}

/////////////////////////////////////////////////////////////////////////////
// métodos
/////////////////////////////////////////////////////////////////////////////

// coloca la paleta de la introducción
void Paleta::setIntroPalette()
{
/* CPC
	for (int i = 0; i < 16; i++){
		cpc6128->setHardwareColor(paleta, i, introPalette[i]);
	}


	cpc6128->markAllPixelsDirty();
*/

// VGA
	setGamePalette(5);
}


// coloca una paleta
void Paleta::setGamePalette(int pal)
{
/* CPC
	for (int i = 0; i < 4; i++){
		cpc6128->setHardwareColor(paleta, i, palettes[pal][i]);
	}

	cpc6128->markAllPixelsDirty();
*/

	// VGA
	if ( pal==0 )
	{
		for (int i = 0; i < 256; i++)
		{
			paleta->setColor(i,0,0,0);
		}
	}
	else
	{
		UINT8 *p=PaletasVGA; 
		p+=despPaletasVGA[pal];
		for (int i = 0; i < 256; i++)
		{
			UINT8 r=*p++;
			UINT8 g=*p++;
			UINT8 b=*p++;
			UINT8 a=*p++;
			paleta->setColor(i,r,g,b);
		}
	}
}
