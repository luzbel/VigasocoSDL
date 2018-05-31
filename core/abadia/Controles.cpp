// Controles.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include "Controles.h"

// para memset
#include <string.h>

using namespace Abadia;

/////////////////////////////////////////////////////////////////////////////
// inicialización y limpieza
/////////////////////////////////////////////////////////////////////////////

Controles::Controles()
{
	ih = 0;
}

Controles::~Controles()
{
	replayFile.close();
}

/////////////////////////////////////////////////////////////////////////////
// métodos
/////////////////////////////////////////////////////////////////////////////

// inicia los controles para el juego
void Controles::init(InputHandler *input)
{
	ih = input;
	memset(_oldControles, 0, END_OF_INPUTS);
	// TODO: Controlar errores
#ifdef __abadIA__
#ifdef __abadIA_REPLAY__
	replayFile.open("abadIA.rec",std::ifstream::in);
#else
	replayFile.open("abadIA.rec",std::ofstream::out|std::ofstream::trunc); //|std::ofstream::app);
#endif
#endif
}

// actualiza el estado de los controles
void Controles::actualizaEstado()
{
	// obtiene el estado de los controles
#ifndef __abadIA_REPLAY__
	// TODO: por ahora , ignorar lo que llega de los input plugins
	// en el futuro, se podrÃan mezclar ambos arrays
	// usando una variable controles temporal
	// QuizÃs en vez de meclar, tener variables exclusivas
	// para los input plugins, que no afecten al replay del juego
	// es decir, no dejar mover, soltar objetos, etc.
	// pero si afectar a la reproducciÃn, pausa, un paso atrÃs
	// un paso adelante ...
	// se tendrÃa que guardar array con la serializacion (Âcomprimida?)
	// para que funcione el volver atrÃs, ya que no hay "undo" sencillo
	// mandando la orden contraria
	// revisar los patrones que hay para ello
	ih->copyInputsState(_controles);
#endif
	// combina el estado actual de los controles con el anterior para poder detectar pulsaciones
	for (int i = 0; i < END_OF_INPUTS; i++){
		_oldControles[i] = (_oldControles[i] << 1) & 0x03;
		if (_controles[i] > 0){
			_oldControles[i] |= 1;
		}
	}
}

// comprueba si se acaba de pulsar una tecla
bool Controles::seHaPulsado(Inputs input)
{
	// detecta transiciones de 0 a 1
	return _oldControles[input] == 0x01;
}

#ifdef __abadIA__
// save replay file
bool Controles::saveReplay(void) 
{
//	replayFile << _controles;
//	replayFile << _oldControles;
//	replayFile << "test\n";
//	replayFile.write((char *)_controles,sizeof(_controles));
//	replayFile.write((char *)_oldControles,sizeof(_oldControles));
	for (int i=0;i<END_OF_INPUTS;i++) {
		replayFile<<_controles[i]<<std::endl;
		if (replayFile.eof()) {
			// TODO: Â¿ mandar evento SDL_QUI ?
			// no podemos hacer pausa, porque la tecla SUPR
			// la controla el bucle de Vigasoco y no el de Juego
			// se podrÃa enviar evento, pero no parece muy limpio
			break;
		}
//		replayFile<<_oldControles[i]<<std::endl;
	}
	return !replayFile.fail();
}

// load one line of replay file
bool Controles::loadReplay(void) 
{
	for (int i=0;i<END_OF_INPUTS;i++) {
//fprintf(stderr,"%d\n",i);
		replayFile >> _controles[i];
//if (_controles[i]) fprintf(stderr,"yujuu el control %d estÃ¡ a %d\n",i,_controles[i]);
//		replayFile >> _oldControles[i];
	}
// TODO: falta controlar EOF y avisar a Juego para que salga
	return !replayFile.fail();
}
#endif
