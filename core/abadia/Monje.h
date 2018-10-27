// Monje.h
//
//	Clase que representa a un monje del juego
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _MONJE_H_
#define _MONJE_H_


#include "PersonajeConIA.h"

namespace Abadia {

class SpriteMonje;								// definido en SpriteMonje.h

class Monje : public PersonajeConIA
{
// campos
protected:
#ifndef __abadIA__
	int datosCara[2];							// dirección de los gráficos de la cara
#endif
	SpriteMonje *sprMonje;						// sprite del monje

	static DatosFotograma tablaAnimacion[8];	// tabla con los distintos fotogramas de animación

// métodos
public:
#ifdef __abadIA__
// TODO, arreglar para que no sea publico y estÃ© expuesto
        // En abadIA es publico para que en el dump (InfoJuego.cpp) se pueda saber si
        // Berengario es el encapuchado
        int datosCara[2];                                                       // direcciï¿½n de los grï¿½ficos de la cara
#endif

	virtual DatosFotograma *calculaFotograma();

	// inicialización y limpieza
	Monje(SpriteMonje *spr);
	virtual ~Monje();
};


}

#endif	// _MONJE_H_
