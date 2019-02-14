// HTTPInputPlugin.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include <cassert>
#include "HTTPInputPlugin.h"

#include <vector>

#include "crow_all.h"
#include "../core/util/json.hpp"

SDLKey HTTPInputPlugin::g_keyMapping[END_OF_INPUTS];

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

HTTPInputPlugin::HTTPInputPlugin()
{
	_errorMsg = "";

	initRemapTable();
// TODO: en vez de compilando cada versión
// usando setProperty se puede poner modo 
// grabar o en modo reproducir
// aunque siendo un plugin
// pues es cuestión de cargar un plugin  u otro
// pueden ser la misma lib, aunque con distinto
// nombre de plugin a seleccionar en PluginMain
#ifdef __abadIA_REPLAY__
        replayFile.open("abadIA.rec",std::ifstream::in);
#else
        replayFile.open("abadIA.rec",std::ofstream::out|std::ofstream::trunc); //|std::ofstream::app);
#endif
}

HTTPInputPlugin::~HTTPInputPlugin()
{
}


std::string HTTPInputPlugin::atenderComando(const std::string&comando, const std::string& data)
{

	//TODO cambiar res a un JSON indicando resultado, número de partida y número de paso
	std::string res="{ \"resultado\": \"OK\" }"; // TODO: usar raw string de C++ para quitar las secuencias de escape y usar _json de nlohmann en vez de llamar luego explicitamente a ::parse
	bool peticionValida=true;
	CROW_LOG_DEBUG << "atenderComando(" << comando << "," << data <<")";
	CROW_LOG_DEBUG << "Estado antes de lock atenderMensaje: " << estado;

	std::unique_lock<std::mutex> lcx(mtx);
	condVar.wait(lcx,[this]{return estado==ATENDER_MENSAJE_EN_EL_HTTPINPUTPLUGIN;});
	estado=ATENDIENDO_MENSAJE_EN_EL_HTTPINPUTPLUGIN;

	CROW_LOG_DEBUG << "Estado despues de lock atenderMensaje: " << estado;

	memset((void *)keystate,0,sizeof(keystate)); // esto solo deberÃa hacerse despues de ver que el comando es valido
	if (comando=="QR") { // TODO: esto es mucha ayuda para el agente, quizás poner interfaz para enviar
			     // cualquier combinación de teclas posibles en un CPC464
		HTTPInputPlugin::keystate[SDLK_q]=true;
		HTTPInputPlugin::keystate[SDLK_r]=true;
	} else 
	if (comando=="NOP") {
		;
	} else 
	if (comando=="SI") {
		HTTPInputPlugin::keystate[SDLK_s]=true;
	} else 
	if (comando=="NO") {
		HTTPInputPlugin::keystate[SDLK_n]=true;
	} else 
	if (comando=="RIGHT") {
		HTTPInputPlugin::keystate[SDLK_RIGHT]=true;
	} else 
	if (comando=="LEFT") {
		HTTPInputPlugin::keystate[SDLK_LEFT]=true;
	} else 
	if (comando=="UP") {
		HTTPInputPlugin::keystate[SDLK_UP]=true;
	} else
	if (comando=="DOWN") {
		HTTPInputPlugin::keystate[SDLK_DOWN]=true;
	} else
	if (comando=="SPACE") {
		HTTPInputPlugin::keystate[SDLK_SPACE]=true;
	} else
	if (comando=="DUMP") {
		HTTPInputPlugin::keystate[SDLK_d]=true;
		CROW_LOG_DEBUG << "dejo seguir al juego para que VUELQUE: " << comando << " estado " << estado;
		estado=AVANZAR_UNA_INTERRUPCION_EN_EL_JUEGO;
		condVar.notify_one();
		CROW_LOG_DEBUG << "fin dejo seguir al juego para que VUELQUE: " << comando << " estado " << estado;
		// Espero otra vez a que el juego me de paso 
		condVar.wait(lcx,[this]{return estado==ATENDER_MENSAJE_EN_EL_HTTPINPUTPLUGIN;});
		estado=ATENDIENDO_MENSAJE_EN_EL_HTTPINPUTPLUGIN;


		res=getStringProperty("DUMP");
	} else  /*
	if (comando=="DUMP") {
		HTTPInputPlugin::keystate[SDLK_d]=true;
		std::ifstream dumpfile("abadIA.dump");
		CROW_LOG_INFO << "vuelco dump: " << data;
		char dump[8192];
		memset(dump,'\0',sizeof(dump));
		dumpfile.read(dump,sizeof(dump));
		res=dump;
		CROW_LOG_INFO << "fin vuelco dump: " << data;
	} else */
	if (comando=="RESET"||comando=="REINICIO") {
		HTTPInputPlugin::keystate[SDLK_e]=true; // E de rEset
	} else
	if (comando=="SAVEJSON") {
		std::stringstream json;
		HTTPInputPlugin::keystate[SDLK_g]=true; // g de Grabar
		HTTPInputPlugin::keystate[SDLK_s]=true; // s de Si, para confirmar la carga
		// uhm, para que esto funcione NO puede entrar ningún otro comando (websocket o http) mientras
		// y eso está pendiente ... TODO 
		CROW_LOG_DEBUG << "dejo seguir al juego para que GRABE: " << comando << " estado " << estado;
		estado=AVANZAR_UNA_INTERRUPCION_EN_EL_JUEGO;
		condVar.notify_one();
		CROW_LOG_DEBUG << "fin dejo seguir al juego para que GRABE: " << comando << " estado " << estado;
		// Espero otra vez a que el juego me de paso 
		condVar.wait(lcx,[this]{return estado==ATENDER_MENSAJE_EN_EL_HTTPINPUTPLUGIN;});
		estado=ATENDIENDO_MENSAJE_EN_EL_HTTPINPUTPLUGIN;

		char dump[8192]; //TODO: intentar que sea dinamico
		memset(dump,'\0',sizeof(dump));
		std::ifstream savefile("abadia0.save");
		savefile.read(dump,8192);
		
		json << "{\"snapshot\":\"" << dump << "\"}";
		res=json.str();
	} else
	if (comando=="SAVE") {
		HTTPInputPlugin::keystate[SDLK_g]=true; // g de Grabar
		HTTPInputPlugin::keystate[SDLK_s]=true; // s de Si, para confirmar la carga
		// uhm, para que esto funcione NO puede entrar ningún otro comando (websocket o http) mientras
		// y eso está pendiente ... TODO 
		CROW_LOG_DEBUG << "dejo seguir al juego para que GRABE: " << comando << " estado " << estado;
		estado=AVANZAR_UNA_INTERRUPCION_EN_EL_JUEGO;
		condVar.notify_one();
		CROW_LOG_DEBUG << "fin dejo seguir al juego para que GRABE: " << comando << " estado " << estado;
		// Espero otra vez a que el juego me de paso 
		condVar.wait(lcx,[this]{return estado==ATENDER_MENSAJE_EN_EL_HTTPINPUTPLUGIN;});
		estado=ATENDIENDO_MENSAJE_EN_EL_HTTPINPUTPLUGIN;

		char dump[8192]; //TODO: intentar que sea dinamico
		memset(dump,'\0',sizeof(dump));
		std::ifstream savefile("abadia0.save");
		savefile.read(dump,8192);

		res=dump;
	} else
	if (comando.find("LOADJSON")==0) {
		CROW_LOG_INFO << "LOADJSON***" << data << "***";
		auto x=crow::json::load(data);
if (!x) return "ERROR LOADJSON"; // conn.send_text("ERROR LOADJSON");
		CROW_LOG_INFO << "LOADJSON***" << x["snapshot"].s() << "***";
		std::ofstream savefile("abadia0.save");
		savefile << x["snapshot"].s();
		savefile.close();
	} else
	if (comando.find("LOAD")==0) {
		std::ofstream savefile("abadia0.save");
		CROW_LOG_INFO << "LOAD***" << data << "***";
		savefile << data;
		savefile.close();
		HTTPInputPlugin::keystate[SDLK_c]=true; // c de Cargar
		HTTPInputPlugin::keystate[SDLK_s]=true; // s de Si, para confirmar la carga
	} else
	if (comando=="FIN"||comando=="END"||comando=="GAMEOVER"||comando=="GAME OVER") {
		SDL_Event sdlevent = {};
		sdlevent.type = SDL_QUIT;
		SDL_PushEvent(&sdlevent);					
	} else peticionValida=false;


	if (peticionValida) {
#ifndef __abadIA_REPLAY__
	nlohmann::json accion;
	accion["comando"] = comando;
	accion["data"] = data;
	acciones.push_back(accion);
#endif
		CROW_LOG_DEBUG << "dejo seguir al juego: " << comando << " estado " << estado;
		estado=AVANZAR_UNA_INTERRUPCION_EN_EL_JUEGO;
		CROW_LOG_DEBUG << "dejo seguir al juego antes de notify_one: " << comando << " estado " << estado << "literal " << AVANZAR_UNA_INTERRUPCION_EN_EL_JUEGO;
		condVar.notify_one();
		CROW_LOG_DEBUG << "fin dejo seguir al juego: " << comando << " estado " << estado;
	} else {
		estado=ATENDER_MENSAJE_EN_EL_HTTPINPUTPLUGIN;
		//res="COMANDO DESCONOCIDO"; // TODO: no hay que devolver 200 en la interfaz http
		res="{ \"resultado\": \"COMANDO DESCONOCIDO\" }";// TODO: no hay que devolver 200 en la interfaz http
	}

	return res;
}


bool HTTPInputPlugin::init()
{
#ifndef __abadIA_REPLAY__
	std::thread webThread([this]() {
		crow::SimpleApp app;

//		CROW_ROUTE(app, "/status")([]{
//		 // TODO: cambiar a JSON con el mismo formato del 
//		 return "OK";
//		});

		CROW_ROUTE(app,"/abadIA/game").methods("POST"_method)([this](const crow::request& req) {
			
			return crow::response(200, this->atenderComando("RESET",req.body));
		});

// TODO: ver si añadir el charset al final del accept y content-type ; charset=UTF-8
// TODO: añadir método delete equivalente a QUIT o GAME_OVER para salir del juego actual
		CROW_ROUTE(app, "/abadIA/game/current").methods("GET"_method,"PUT"_method,"DELETE"_method)([this](const crow::request& req) {
			if (req.method=="GET"_method) {
				std::string accept = req.get_header_value("Accept");
				if (accept=="application/json") {
					crow::response response = 
						crow::response(200, this->atenderComando("DUMP",req.body));
					response.set_header("Content-Type", "application/json");
					return response;
				} else
					if (accept=="text/x.abadIA+plain") {
						crow::response response = 
							crow::response(200, this->atenderComando("SAVE",""));
						response.set_header("Content-Type", "text/x.abadIA+plain");
						return response;
					} else 
					if (accept=="text/x.abadIA+json") {
						crow::response response = 
							crow::response(200, this->atenderComando("SAVEJSON",""));
						response.set_header("Content-Type", "text/x.abadIA+json");
						return response;
					} 
					else return crow::response(400,"{ \"resultado\": \"KO\" , \"descripcion\": \"Unsupported type\" }");
			} else 
				if (req.method == "PUT"_method) {
					return crow::response(200,this->atenderComando("LOAD",req.body));
				} else
					if (req.method == "DELETE"_method) {
						return crow::response(200,this->atenderComando("FIN",""));
					} else  return crow::response(500,"{ \"resultado\": \"KO\" , \"descripcion\": \"crow debería haber rechazado previamente esta petición porque el método no está implementado para el recurso\" }");
		});

//		CROW_ROUTE(app,"/abadIA/game/current").methods("PUT"_method)([this](const crow::request& req) {
//			return crow::response(200,this->atenderComando("LOAD",req.body));
//		});


//TODO ,cargar el body en nlohmann::json
// usar is_array para comprobar que llega un array
// usar un iterador o for  auto ( ver https://github.com/nlohmann/json#examples ) para recorrerlo
// ver si merece la pena aplicar https://github.com/pboettch/json-schema-validator
// ver si es un objeto con 2 objetos dentro , el comando y el número de repeticiones
//  en plan if (o.count("comando")) ...
// ?y si queremos pulsar varias teclas y que sea genérico y no la ñapa del comando QR actual?
// habría que cambiar el atenderComando o crear un comando generico que acepte lista de pulsaciones
// ?que pasa si le das a girar y avanzar a la vez?
// bucle repetir para ese comadndo
//	lanzar comando
//						nlohmann::json::parse(this->atenderComando(command,req.body))); // TODO, quitar el parse haciendo que la función devuelva directamente un json en plan 
/*
auto j2 = R"(
  {
    "resultado": "OK",
    "descripcion": "Todo ok",
    "id": 3
  }
)"_json;
*/
//			else return crow::response(400,"{ \"resultado\": \"KO\" , \"descripcion\": \"Comando desconocido\" }"); // TODO, usar raw string 

		CROW_ROUTE(app,"/abadIA/game/current/actions").methods("POST"_method)([this](const crow::request& req) {
			if ( nlohmann::json::accept(req.body) ) { // TODO, ver si es mejor hacer el parse directamente y hacer un catch de las excepciones
				auto peticionJSON = nlohmann::json::parse(req.body);

				if (peticionJSON.is_array()) { 
					nlohmann::json resultados = nlohmann::json::array();
					for (auto& element : peticionJSON) {
						if (element.is_object()) {
							std::cout << element << std::endl;
							if (element.count("command")!=1) 
								return crow::response(500,
									R"({ "resultado": "KO" , "descripcion": "Falta el comando en un action recibida" })");

							std::string command=element["command"];
							std::cout << "comando " << command << std::endl;
							if (	command=="NOP" ||
								command=="QR" || // TODO: mucha ayuda para la IA. Ver alternativas para esto
								command=="RIGHT" ||
								command=="LEFT" ||
								command=="UP" ||
								command=="DOWN" ||
								command=="SPACE" ||
								command=="DUMP" ||
								command=="RESET" ||
								command=="SAVEJSON" ||
								command=="SAVE" ||
								command=="LOADJSON" ||
								command=="LOAD" ||
								command=="FIN" ||
								command=="END" ||
								command=="GAME OVER" ||
								command=="GAMEOVER" ||
								command=="SI" ||
								command=="NO"
							   ) {
								signed int repeat=1;
								if (element.count("repeat")==1) repeat=element["repeat"];
								std::cout << "repeat "  << repeat << std::endl;
								while (repeat--) {
									resultados.push_back(
										nlohmann::json::parse(
 									this->atenderComando(command,req.body)));
								} 
							}
						} else break;
					}		
					return crow::response(200,resultados.dump());
//					return crow::response(500,
//						  R"({ "resultado": "KO" , "descripcion": "No implementado" })");
				}
			}
			return crow::response(500,R"({ "resultado": "KO" , "descripcion": "No me gusta el JSON recibido" })");
		});

		CROW_ROUTE(app,"/abadIA/game/current/actions/<string>").methods("POST"_method)([this](const crow::request& req, std::string command) {
			CROW_LOG_INFO << "action " << command;
			// TODO: comprobar que el comando es valido antes 
			if (	command=="NOP" ||
				command=="QR" || // TODO: mucha ayuda para la IA. Ver alternativas para esto
				command=="RIGHT" ||
				command=="LEFT" ||
				command=="UP" ||
				command=="DOWN" ||
				command=="SPACE" ||
				command=="DUMP" ||
				command=="RESET" ||
				command=="SAVEJSON" ||
				command=="SAVE" ||
				command=="LOADJSON" ||
				command=="LOAD" ||
				command=="FIN" ||
				command=="END" ||
				command=="GAME OVER" ||
				command=="GAMEOVER" ||
				command=="SI" ||
				command=="NO"
			) {
				nlohmann::json resultados = nlohmann::json::array();
				signed int repeat=1;
				if ( req.url_params.get("repeat") != nullptr ) {
					repeat=boost::lexical_cast<int>(req.url_params.get("repeat"));
				}

				while (repeat--) {
					resultados.push_back(
						nlohmann::json::parse(this->atenderComando(command,req.body)));
				} 
				return crow::response(200,resultados.dump());
			}
			else return crow::response(400,"{ \"resultado\": \"KO\" , \"descripcion\": \"Comando desconocido\" }");
//			return crow::response(200,this->atenderComando("LOAD",req.body));
//			return crow::response(200,command);
//TODO: comprobar que pasa cuando mandas .../actions/LOAD con un body vacio, sale lo de pulsar espacio
// y creo que se queda en juego y no vuelve el control a la interfaz web
		});

#ifdef DEFINICION_INVENTADA_PARA_QUE_ESTO_NO_COMPILE
		CROW_ROUTE(app,"/load").methods("POST"_method)([this](const crow::request& req) {
			return crow::response(200,this->atenderComando("LOAD",req.body));
		});

		CROW_ROUTE(app,"/cmd/NOP").methods("POST"_method)([this](const crow::request& req) {
			return crow::response(200,this->atenderComando("NOP",req.body));
		});

		CROW_ROUTE(app,"/cmd/RIGHT").methods("POST"_method)([this](const crow::request& req) {
			return crow::response(200, this->atenderComando("RIGHT",req.body));
		});

		CROW_ROUTE(app,"/cmd/LEFT").methods("POST"_method)([this](const crow::request& req) {
			return crow::response(200, this->atenderComando("LEFT",req.body));
		});

		CROW_ROUTE(app,"/cmd/UP").methods("POST"_method)([this](const crow::request& req) {
			return crow::response(200, this->atenderComando("UP",req.body));
		});

		CROW_ROUTE(app,"/cmd/DOWN").methods("POST"_method)([this](const crow::request& req) {
			return crow::response(200, this->atenderComando("DOWN",req.body));
		});

		CROW_ROUTE(app,"/cmd/SPACE").methods("POST"_method)([this](const crow::request& req) {
			return crow::response(200, this->atenderComando("SPACE",req.body));
		});

		CROW_ROUTE(app,"/cmd/DUMP").methods("POST"_method)([this](const crow::request& req) {
			return crow::response(200, this->atenderComando("DUMP",req.body));
		});

		CROW_ROUTE(app,"/cmd/RESET").methods("POST"_method)([this](const crow::request& req) {
			return crow::response(200, this->atenderComando("RESET",req.body));
		});
#endif

		CROW_ROUTE(app,"/ws")
		.websocket()
		.onopen([&](crow::websocket::connection& conn){
				CROW_LOG_INFO << "new websocket connection";
				})
		.onclose([&](crow::websocket::connection& conn, const std::string& reason){
				CROW_LOG_INFO << "websocket connection closed: " << reason;
				})
		.onmessage([this](crow::websocket::connection& conn, const std::string& data, bool is_binary){
				CROW_LOG_INFO << "websocket onmessage: " << data;
				std::string res="OK";
				std::string::size_type pos=data.find(" ");
				if (pos==std::string::npos) {
					res=this->atenderComando(data,"");
				} else {
					res=this->atenderComando(
						data.substr(0,pos),
						data.substr(pos+1,std::string::npos)
					);
				}
				CROW_LOG_INFO << "websocket res: " << res;
				conn.send_text(res);
		}); 

		// no queremos que sea multithreaded para que se atienda
		// solo un comando a la vez
		app.port(4477).run();
        });
        webThread.detach(); 
        return true;
#else
	std::thread replayThread([this]() {

	std::string res="OK";
	replayJSON = nlohmann::json::parse(replayFile); // TODO: controlar excepciones
	nlohmann::json accionesJSON = replayJSON["acciones"]; // ?usar variable acciones declarado en .h
	for (nlohmann::json::iterator it = accionesJSON.begin(); it != accionesJSON.end(); ++it) {
		// std::cout << (*it)["comando"] << " : " << (*it)["data"] << "\n*****\n";
		// TODO: comprobar los resultados de atenderComando 
		res = this->atenderComando((*it)["comando"],(*it)["data"]); 
	}

		
/*
	std::string line;
	std::string res="OK";
	// TODO: falta control errores al leer
	// ver https://gehrcke.de/2011/06/reading-files-in-c-using-ifstream-dealing-correctly-with-badbit-failbit-eofbit-and-perror/
	// TODO: comprobar los resultados de atenderComando 
	// TODO: este bucle en vez de en ::init en un hilo desacoplado
	// debería ir en ::process
	// que se llama desde fuera del bucle principal de juego
	// TODO: esto no funciona en comandos multilínea como LOAD
	while(getline(replayFile, line)) {
		std::string::size_type pos=line.find(" ");
		if (pos==std::string::npos) {
			res=this->atenderComando(line,"");
		} else {
			res=this->atenderComando(
					line.substr(0,pos),
					line.substr(pos+1,std::string::npos)
					);
		}
	} */
        });
        replayThread.detach(); 
        return true;
#endif
}

void HTTPInputPlugin::end()
{
#ifndef __abadIA_REPLAY__
	replayJSON["acciones"] = acciones;
	replayFile << replayJSON;
#endif
}

void HTTPInputPlugin::acquire()
{
	std::unique_lock<std::mutex> lcx(mtx);
	CROW_LOG_DEBUG << "HTTPInputPlugin::acquire inicio estado " << estado;
	condVar.wait(lcx,[this]{return estado==AVANZAR_UNA_INTERRUPCION_EN_EL_JUEGO;});
	estado=AVANZANDO_UNA_INTERRUPCION_EN_EL_JUEGO;
	CROW_LOG_DEBUG << "HTTPInputPlugin::acquire fin estado " << estado;
}

void HTTPInputPlugin::unAcquire()
{
	CROW_LOG_DEBUG << "antes mutex HTTPInputPlugin::unacquire inicio ngi " << estado;
	std::lock_guard<std::mutex> _(mtx);
	CROW_LOG_DEBUG << "HTTPInputPlugin::unacquire inicio ngi " << estado;
	memset((void *)keystate,0,sizeof(keystate));
	estado=ATENDER_MENSAJE_EN_EL_HTTPINPUTPLUGIN;
	condVar.notify_one();
	CROW_LOG_DEBUG << "HTTPInputPlugin::unacquire fin ngi " << estado;
}

/////////////////////////////////////////////////////////////////////////////
// input processing
/////////////////////////////////////////////////////////////////////////////

void HTTPInputPlugin::process(int *inputs)
{
	std::lock_guard<std::mutex> _(mtx);
	// iterate through the inputs checking associated keys
	for (int i = 0; i < END_OF_INPUTS; i++){
		// if we're interested in that input, check it's value
		if (inputs[i] >= 0){
			// if the input is mapped and the key is pressed,
			// update inputs
			if (g_keyMapping[i] != 0){
				if (keystate[g_keyMapping[i]] ){
					inputs[i]++;
				}
			}
		}
	}
}

/////////////////////////////////////////////////////////////////////////////
// helper methods
/////////////////////////////////////////////////////////////////////////////

void HTTPInputPlugin::initRemapTable()
{
	memset(g_keyMapping, 0, sizeof(g_keyMapping));

	// game driver inputs

	g_keyMapping[P1_UP] = SDLK_UP;
	g_keyMapping[P1_LEFT] = SDLK_LEFT;
	g_keyMapping[P1_DOWN] = SDLK_DOWN;
	g_keyMapping[P1_RIGHT] = SDLK_RIGHT;

	g_keyMapping[P1_BUTTON1] = SDLK_LCTRL;
	g_keyMapping[P1_BUTTON1] = SDLK_SPACE;
	g_keyMapping[P1_BUTTON2] = SDLK_LSUPER;

	g_keyMapping[P2_UP] = SDLK_w;
	g_keyMapping[P2_LEFT] = SDLK_a; 
	g_keyMapping[P2_DOWN] = SDLK_s;
	g_keyMapping[P2_RIGHT] = SDLK_d;
	g_keyMapping[P2_BUTTON1] = SDLK_y;
	g_keyMapping[P2_BUTTON2] = SDLK_u;

	g_keyMapping[START_1] = SDLK_1;
	g_keyMapping[START_2] = SDLK_2;
	g_keyMapping[COIN_1] = SDLK_5;
	g_keyMapping[COIN_2] = SDLK_6;
	g_keyMapping[SERVICE_1] = SDLK_9;
	g_keyMapping[SERVICE_2] = SDLK_0;

	// keyboard inputs
	g_keyMapping[KEYBOARD_A] = SDLK_a;
	g_keyMapping[KEYBOARD_B] = SDLK_b;
	g_keyMapping[KEYBOARD_C] = SDLK_c;
	g_keyMapping[KEYBOARD_D] = SDLK_d;
	g_keyMapping[KEYBOARD_E] = SDLK_e;
	g_keyMapping[KEYBOARD_F] = SDLK_f;
	g_keyMapping[KEYBOARD_G] = SDLK_g;
	g_keyMapping[KEYBOARD_H] = SDLK_h;
	g_keyMapping[KEYBOARD_I] = SDLK_i;
	g_keyMapping[KEYBOARD_J] = SDLK_j;
	g_keyMapping[KEYBOARD_K] = SDLK_k;
	g_keyMapping[KEYBOARD_L] = SDLK_l;
	g_keyMapping[KEYBOARD_M] = SDLK_m;
	g_keyMapping[KEYBOARD_N] = SDLK_n;
	g_keyMapping[KEYBOARD_O] = SDLK_o;
	g_keyMapping[KEYBOARD_P] = SDLK_p;
	g_keyMapping[KEYBOARD_Q] = SDLK_q;
	g_keyMapping[KEYBOARD_R] = SDLK_r;
	g_keyMapping[KEYBOARD_S] = SDLK_s;
	g_keyMapping[KEYBOARD_T] = SDLK_t;
	g_keyMapping[KEYBOARD_U] = SDLK_u;
	g_keyMapping[KEYBOARD_V] = SDLK_v;
	g_keyMapping[KEYBOARD_W] = SDLK_w;
	g_keyMapping[KEYBOARD_X] = SDLK_x;
	g_keyMapping[KEYBOARD_Y] = SDLK_y;
	g_keyMapping[KEYBOARD_Z] = SDLK_z;
	g_keyMapping[KEYBOARD_0] = SDLK_0;
	g_keyMapping[KEYBOARD_1] = SDLK_1;
	g_keyMapping[KEYBOARD_2] = SDLK_2;
	g_keyMapping[KEYBOARD_3] = SDLK_3;
	g_keyMapping[KEYBOARD_4] = SDLK_4;
	g_keyMapping[KEYBOARD_5] = SDLK_5;
	g_keyMapping[KEYBOARD_6] = SDLK_6;
	g_keyMapping[KEYBOARD_7] = SDLK_7;
	g_keyMapping[KEYBOARD_8] = SDLK_8;
	g_keyMapping[KEYBOARD_9] = SDLK_9; 
	g_keyMapping[KEYBOARD_SPACE] = SDLK_SPACE;
	g_keyMapping[KEYBOARD_INTRO] = SDLK_RETURN; // SDLK_KP_ENTER;
	g_keyMapping[KEYBOARD_SUPR] = SDLK_DELETE;

	// core inputs
	g_keyMapping[FUNCTION_1] = SDLK_F1;
	g_keyMapping[FUNCTION_2] = SDLK_F2;
	g_keyMapping[FUNCTION_3] = SDLK_F3;
	g_keyMapping[FUNCTION_4] = SDLK_F4;
	g_keyMapping[FUNCTION_5] = SDLK_F5;
	g_keyMapping[FUNCTION_6] = SDLK_F6;
	g_keyMapping[FUNCTION_7] = SDLK_F7;
	g_keyMapping[FUNCTION_8] = SDLK_F8;
	g_keyMapping[FUNCTION_9] = SDLK_F9;
	g_keyMapping[FUNCTION_10] = SDLK_F10;
	g_keyMapping[FUNCTION_11] = SDLK_F11;
	g_keyMapping[FUNCTION_12] = SDLK_F12;

	// check that all inputs have been mapped (for safety)
	for (int i = 0; i < END_OF_INPUTS; i++){
		assert(g_keyMapping[i] != 0);
	}
}

/////////////////////////////////////////////////////////////////////////////
// Custom plugin properties
/////////////////////////////////////////////////////////////////////////////

const std::string HTTPInputPlugin::g_properties[] = {
	"keyConfig"
};

const unsigned int HTTPInputPlugin::g_paramTypes[] = {
	(PARAM_ARRAY | PARAM_INPUT)
};

const unsigned int * HTTPInputPlugin::getPropertiesType() const
{
	return HTTPInputPlugin::g_paramTypes;
}

const std::string * HTTPInputPlugin::getProperties(int *num) const 
{
	*num = sizeof(g_paramTypes)/sizeof(g_paramTypes[0]);
	return HTTPInputPlugin::g_properties;
}

void HTTPInputPlugin::setStringProperty(std::string prop, std::string data)
{
	if (prop=="DUMP") dump=data;
}


void HTTPInputPlugin::setProperty(std::string prop, int data)
{
}

void HTTPInputPlugin::setProperty(std::string prop, int index, int data)
{
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			g_keyMapping[index] = (SDLKey)data;
		}
	}
}

std::string HTTPInputPlugin::getStringProperty(std::string prop) const
{
	if (prop=="DUMP") {
		return dump;
	} else
	return "ERR: unknown property";
};


int HTTPInputPlugin::getProperty(std::string prop) const
{
	return -1;
};

int HTTPInputPlugin::getProperty(std::string prop, int index) const
{
	if (prop == "keyConfig"){
		if ((index >= 0) && (index < END_OF_INPUTS)){
			return g_keyMapping[index];
		}
	} 
	return -1; 
};
