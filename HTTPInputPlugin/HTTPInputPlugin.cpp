// HTTPInputPlugin.cpp
//
/////////////////////////////////////////////////////////////////////////////

#include <cassert>
#include "HTTPInputPlugin.h"

#include <vector>

#include "crow_all.h"

SDLKey HTTPInputPlugin::g_keyMapping[END_OF_INPUTS];

#include "/abadIA/VigasocoSDL/core/Vigasoco.h"

//std::mutex mtx;

/////////////////////////////////////////////////////////////////////////////
// initialization and cleanup
/////////////////////////////////////////////////////////////////////////////

HTTPInputPlugin::HTTPInputPlugin()
{
	_errorMsg = "";

	initRemapTable();
}

HTTPInputPlugin::~HTTPInputPlugin()
{
}


std::string HTTPInputPlugin::atenderComando(const std::string&comando, const std::string& data)
{
//crow::websocket::connection conn; // 666 tmp para pruebaas compilacion, falta recibirlo y tener alternativa para 
// cuando no es websocket
	std::string res="OK";
	bool peticionValida=true;
	CROW_LOG_INFO << "atenderComando(" << comando << "," << data <<")";
	CROW_LOG_INFO << "atenderComando antes de lock atenderMensaje: " << atenderMensaje;

	std::unique_lock<std::mutex> lcx(mtx);
	condVar.wait(lcx,[this]{return atenderMensaje;});
	atenderMensaje=false;

	CROW_LOG_INFO << "atenderComando despues de lock atenderMensaje: " << atenderMensaje;

	memset((void *)keystate,0,sizeof(keystate)); // esto solo deberÃa hacerse despues de ver que el comando es valido
	if (comando=="NOP") {
		;
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
		std::ifstream dumpfile("abadIA.dump");
		CROW_LOG_INFO << "vuelco dump: " << data;
		char dump[8192];
		memset(dump,'\0',sizeof(dump));
		dumpfile.read(dump,sizeof(dump));
res=dump;
//666conn.send_text(dump);
		CROW_LOG_INFO << "fin vuelco dump: " << data;
	} else
	if (comando=="RESET"||comando=="REINICIO") {
		HTTPInputPlugin::keystate[SDLK_e]=true; // E de rEset
	} else
	if (comando=="SAVEJSON") {
		std::stringstream json;
		char dump[8192]; //TODO: intentar que sea dinamico
		memset(dump,'\0',sizeof(dump));
		std::ifstream savefile("abadia0.save");
		savefile.read(dump,8192);
		json << "{\"snapshot\":\"" << dump << "\"}";
res=dump;
//666conn.send_text(json.str());
	} else
	if (comando=="SAVE") {
		char dump[8192]; //TODO: intentar que sea dinamico
		memset(dump,'\0',sizeof(dump));
		std::ifstream savefile("abadia0.save");
		savefile.read(dump,8192);
res=dump;
//666conn.send_text(dump);
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
	} else
	if (comando=="FIN"||comando=="END"||comando=="GAMEOVER"||comando=="GAME OVER") {
		SDL_Event sdlevent = {};
		sdlevent.type = SDL_QUIT;
		SDL_PushEvent(&sdlevent);					
	} else peticionValida=false;


	if (peticionValida) {
		CROW_LOG_INFO << "dejo seguir al juego: " << comando << " nextGI " << nextGameInterrupt;
		nextGameInterrupt=true;
		condVar.notify_one();
		CROW_LOG_INFO << "fin dejo seguir al juego: " << comando << " next GI " << nextGameInterrupt;
	} else atenderMensaje=true;

	return res;
}


bool HTTPInputPlugin::init()
{
fprintf(stderr,"HTTPInputPlugin::init entro \n");
	std::thread webThread([this]() {
		crow::SimpleApp app;

		CROW_ROUTE(app, "/")([]{
		 return "Hola mundo";
		});

		CROW_ROUTE(app, "/status")([]{
		 return "OK";
		});

		CROW_ROUTE(app,"/loadOLD").methods("POST"_method)([this](const crow::request& req) {
					std::ofstream savefile("abadia0.save");
CROW_LOG_INFO << "LOAD***" << req.body << "***";
std::unique_lock<std::mutex> lcx(mtx);
condVar.wait(lcx,[this]{return atenderMensaje;});
atenderMensaje=false;
CROW_LOG_INFO << "load despues de lock nextGameInterrup: " << nextGameInterrupt;
memset((void *)keystate,0,sizeof(keystate)); // esto solo deberÃa hacerse despues de ver que el comando es valido
					savefile << req.body;
					savefile.close();
HTTPInputPlugin::keystate[SDLK_c]=true;
HTTPInputPlugin::keystate[SDLK_s]=true;
CROW_LOG_INFO << "load-dejo seguir al juego: " << "nextGI " << nextGameInterrupt;
nextGameInterrupt=true;
condVar.notify_one();
CROW_LOG_INFO << "load-fin dejo seguir al juego: " << " next GI " << nextGameInterrupt;
			return crow::response(200);
		});

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
						data.substr(0,pos-1),
						data.substr(pos+1,std::string::npos)
					);
				}
				CROW_LOG_INFO << "websocket res: " << res;
				conn.send_text(res);
		}); 

		app.port(4477).run();
        });
        webThread.detach(); 
        return true;
}

void HTTPInputPlugin::end()
{
}

void HTTPInputPlugin::acquire()
{
std::unique_lock<std::mutex> lcx(mtx);
fprintf(stderr,"HTTPInputPlugin::acquire inicio ngi %d\n",nextGameInterrupt);
//	memset((void *)keystate,0,sizeof(keystate));
condVar.wait(lcx,[this]{return nextGameInterrupt;});
nextGameInterrupt=false;
atenderMensaje=false;
fprintf(stderr,"HTTPInputPlugin::acquire fin ngi %d\n",nextGameInterrupt);
//atendiendoMensaje=false;
//condVar2.notify_one();
}

void HTTPInputPlugin::unAcquire()
{ 
//std::lock_guard<std::mutex> _(VigasocoMain->mtx);
fprintf(stderr,"antes mutex HTTPInputPlugin::unacquire inicio ngi %d\n",nextGameInterrupt);
std::lock_guard<std::mutex> _(mtx);
fprintf(stderr,"HTTPInputPlugin::unacquire inicio ngi %d\n",nextGameInterrupt);
//fprintf(stderr,"HTTPInputPlugin::unAcquire tecla derecha %d\n",keystate[SDLK_RIGHT]);
	// temporal para borrar pulsaciones anteriores
	memset((void *)keystate,0,sizeof(keystate));
//	keystate[SDLK_DELETE]=true;
//fprintf(stderr,"HTTPInputPlugin::unAcquire tecla derecha %d\n",keystate[SDLK_RIGHT]); 
nextGameInterrupt=false;
atenderMensaje=true;
condVar.notify_one();
fprintf(stderr,"HTTPInputPlugin::unacquire fin ngi %d\n",nextGameInterrupt);
//atendiendoMensaje=false;
//condVar2.notify_one();
}

/////////////////////////////////////////////////////////////////////////////
// input processing
/////////////////////////////////////////////////////////////////////////////

void HTTPInputPlugin::process(int *inputs)
{
//std::lock_guard<std::mutex> _(VigasocoMain->mtx);
std::lock_guard<std::mutex> _(mtx);
//fprintf(stderr,"HTTPInputPlugin::process inicio\n");
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
//atendiendoMensaje=false;
//condVar2.notify_one();
//fprintf(stderr,"HTTPInputPlugin::process fin\n");
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

const int HTTPInputPlugin::g_paramTypes[] = {
	(int)(PARAM_ARRAY | PARAM_INPUT)
};

const int * HTTPInputPlugin::getPropertiesType() const
{
	return HTTPInputPlugin::g_paramTypes;
}

const std::string * HTTPInputPlugin::getProperties(int *num) const 
{
	*num = sizeof(g_paramTypes)/sizeof(g_paramTypes[0]);
	return HTTPInputPlugin::g_properties;
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
