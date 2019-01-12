// YA NO SE USA, SE INICIALIZA TODO EN SDL_Main por defecto 
// SOLO HAY QUE MONTAR EL DIRECTORIO SAVE CON HTTP5FS


#include <sys/mount.h>
#include <errno.h>

#include <ppapi/c/pp_errors.h>
#include <ppapi/c/pp_instance.h>
#include <ppapi/c/ppb_instance.h>
#include <ppapi/utility/completion_callback_factory.h>
#include <ppapi/cpp/instance.h>
#include <ppapi/cpp/module.h>
#include <ppapi/cpp/url_loader.h>
#include <ppapi/cpp/url_request_info.h>
#include <ppapi/cpp/url_response_info.h>
#include <ppapi/cpp/var.h>
#include "nacl_io/nacl_io.h"

#include <SDL/SDL_nacl.h>
#include "SDL.h"


//extern "C" int game_main(void *ptr);
int game_main(void *ptr);

class VigasocoSDL_PNACL_Instance : public pp::Instance {
private:
  SDL_Thread *thread;
  int num_changed_view_;           // Ensure we initialize an instance only once.
  int width_; int height_;         // Dimension of the SDL video screen.

  // This function allows us to delay game start until all
  // resources are ready.
  void StartGameInNewThread(int32_t dummy) {
//        printf("StartGameInNewThread....\n");
	thread=SDL_CreateThread(game_main,(void *)NULL);	
}


 public:
  explicit VigasocoSDL_PNACL_Instance(PP_Instance instance)
      : pp::Instance(instance) {
	RequestInputEvents(PP_INPUTEVENT_CLASS_MOUSE|
                       PP_INPUTEVENT_CLASS_KEYBOARD);

	nacl_io_init_ppapi(pp_instance(), pp::Module::Get()->get_browser_interface());
}
  virtual ~VigasocoSDL_PNACL_Instance() {
    // Wait for game thread to finish.
	int res;
	SDL_WaitThread(thread,&res);
}

  // This function is called with the HTML attributes of the embed tag,
  // which can be used in lieu of command line arguments.
  virtual bool Init(uint32_t argc, const char* argn[], const char* argv[]) {
    //[Process arguments and set width_ and height_]
    //$[Initiate the loading of resources]
	// [TODO][FIXME] no lo leo del nmf o del embed tag
	// e inicializo los valores por codigo
	width_=640;
	height_=480;
    return true;
  }

  // This crucial function forwards PPAPI events to SDL.
  virtual bool HandleInputEvent(const pp::InputEvent& event) {
    SDL_NACL_PushEvent(event);
    return true;
  }

  // This function is called for various reasons, e.g. visibility and page
  // size changes. We ignore these calls except for the first
  // invocation, which we use to start the game.
  virtual void DidChangeView(const pp::Rect& position, const pp::Rect& clip) {
    ++num_changed_view_;
    if (num_changed_view_ > 1) return;
    // NOTE: It is crucial that the two calls below are run here
    // and not in a thread.
    SDL_NACL_SetInstance(pp_instance(), width_, height_);
    // This is SDL_Init call which used to be in game_main()
    SDL_Init(SDL_INIT_TIMER|SDL_INIT_AUDIO|SDL_INIT_VIDEO);
    StartGameInNewThread(0);
  }

};


class VigasocoSDL_PNACL_Module : public pp::Module {
 public:
  VigasocoSDL_PNACL_Module() : pp::Module() {}
  virtual ~VigasocoSDL_PNACL_Module() {}

  virtual pp::Instance* CreateInstance(PP_Instance instance) {
    return new VigasocoSDL_PNACL_Instance(instance);
  }

};

namespace pp {

Module* CreateModule() {
  return new VigasocoSDL_PNACL_Module();
}

}  // namespace pp
