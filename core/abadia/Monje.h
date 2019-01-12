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
<<<<<<< HEAD
	int datosCara[2];							// direcci�n de los gr�ficos de la cara
=======
	int datosCara[2];							// dirección de los gráficos de la cara
>>>>>>> luzbel/abadIA-timing-by-webserver
#endif
	SpriteMonje *sprMonje;						// sprite del monje

	static DatosFotograma tablaAnimacion[8];	// tabla con los distintos fotogramas de animación

// métodos
public:
#ifdef __abadIA__
<<<<<<< HEAD
	// En abadIA es publico para que en el dump (InfoJuego.cpp) se pueda saber si 
	// Berengario es el encapuchado
	int datosCara[2];							// direcci�n de los gr�ficos de la cara
#endif
=======
// TODO, arreglar para que no sea publico y estÃ© expuesto
        // En abadIA es publico para que en el dump (InfoJuego.cpp) se pueda saber si
        // Berengario es el encapuchado
        int datosCara[2];                                                       // direcciï¿½n de los grï¿½ficos de la cara
#endif

>>>>>>> luzbel/abadIA-timing-by-webserver
	virtual DatosFotograma *calculaFotograma();

	// inicialización y limpieza
	Monje(SpriteMonje *spr);
	virtual ~Monje();
};


}

#endif	// _MONJE_H_
