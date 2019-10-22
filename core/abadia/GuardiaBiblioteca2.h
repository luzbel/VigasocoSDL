//	Guardia biblioteca 2.h
//
//	Clase que representa al segundo sectario que custodia la entrada a la
//	biblioteca. 
//	TODO: Hacer una clase común entre este y el otro guardia
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _GUARDIABIBLIOTECA2_H_
#define _GUARDIABIBLIOTECA2_H_


#include "Monje.h"

namespace Abadia {


class GuardiaBiblioteca2: public Monje
{
// campos
public:
//	bool estaActivo;							// indica si el personaje está activo o no
//	int contadorHuida;							// contador usado para la huida

protected:
	static PosicionJuego posicionesPredef[2];	// posiciones a las que puede ir el personaje según el estado

// métodos
public:
	virtual void piensa();

	// inicialización y limpieza
	GuardiaBiblioteca2(SpriteMonje *spr);
	virtual ~GuardiaBiblioteca2();
};


}

#endif	// _GUARDIABIBLIOTECA2_H_
