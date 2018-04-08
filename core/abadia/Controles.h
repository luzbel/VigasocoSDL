// Controles.h
//
//	Clase para leer los controles del juego
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _CONTROLES_H_
#define _CONTROLES_H_


#include "../InputHandler.h"
#include "../util/Singleton.h"

namespace Abadia {

#define losControles Controles::getSingletonPtr()

class Controles : public Singleton<Controles>
{
// campos
protected:
	InputHandler *ih;							// manejador de los controles

	int _controles[END_OF_INPUTS];				// datos sobre los controles
	int _oldControles[END_OF_INPUTS];			// datos anteriores sobre los controles
	// TODO: revisar no creo que este sea un buen sitio para meterlo JT 
	char pathDump[200];
	
// m�todos
public:
	void init(InputHandler *input);
	void actualizaEstado();

	bool estaSiendoPulsado(Inputs input) const { return (_controles[input] > 0); }
	bool seHaPulsado(Inputs input);

	// inicializaci�n y limpieza
	Controles();
	~Controles();
};


}

#endif	// _CONTROLES_H_
