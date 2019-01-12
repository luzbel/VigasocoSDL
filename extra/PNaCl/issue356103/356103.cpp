// Chromium TEST issue 356103
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
#include <stdio.h>
#include <string.h>
#include <fstream>
#include "iostream"
#include <sys/mount.h>
#include <errno.h>
#include <pthread.h>

void *
threadTWO (void *ptr)
{
  const char *savefile = "/save/abadia.save";

  std::ofstream out (savefile, std::ofstream::out | std::ofstream::app);

  if (out.is_open ())
    {
      printf ("of open OK\n");
      fflush (stdout);
    }
  else
    {
      printf ("of open KO\n");
      fflush (stdout);
    }

  out << "test";

  if (out.fail ())
    {
      printf ("of << test fail \n");
    }

  out << "Some text\n";

  if (out.fail ())
    {
      printf ("of << some text fail\n");
    }


  out << std::endl;

  if (out.fail ())
    {
      printf ("of endl fail\n");
      printf ("*%s*\n", strerror (errno));
    }

  out.flush ();
  if (out.fail ())
    {
      printf ("of flush fail\n");
    }


  out.close ();
  if (out.fail ())
    {
      printf ("of close fail\n");
    }


  printf ("END\n");

  fflush (stdout);

  return 0;
}

void *
threadONE (void *ptr)
{
  pthread_t thread_TWO_id;

  int result =
    mount ("", "/save", "html5fs", 0, "type=PERSISTENT,expected_size=20480");
  printf ("result mount html5fs =%d %d %s\n", result, errno,
	  strerror (errno));

  if (pthread_create (&thread_TWO_id, NULL, &threadTWO, NULL) != 0)
    printf ("ERR pthread_create\n");
  else
    {
	pthread_join(thread_TWO_id,NULL);
    }
 return 0;
}

class issue356103_Instance:public
  pp::Instance
{
private:
  pthread_t thread_ONE_id;
  int
    num_changed_view_;		// Ensure we initialize an instance only once.

  // This function allows us to delay game start until all
  // resources are ready.
  void
  StartInNewThread (int32_t dummy)
  {
    if (pthread_create(&thread_ONE_id,NULL,&threadONE,NULL)!=0) printf("ERR pthread_create ONE\n");
  }


public:
  explicit
  issue356103_Instance (PP_Instance instance):
  pp::Instance (instance)
  {
    //RequestInputEvents (PP_INPUTEVENT_CLASS_MOUSE |
    //			PP_INPUTEVENT_CLASS_KEYBOARD);

    nacl_io_init_ppapi (pp_instance (),
			pp::Module::Get ()->get_browser_interface ());
  }
  virtual ~ issue356103_Instance ()
  {
    // Wait for thread ONE to finish.
    pthread_join(thread_ONE_id,NULL);
  }

  // This function is called with the HTML attributes of the embed tag,
  // which can be used in lieu of command line arguments.
  virtual bool
  Init (uint32_t argc, const char *argn[], const char *argv[])
  {
    //[Process arguments and set width_ and height_]
    //$[Initiate the loading of resources]
    return true;
  }

  // This crucial function forwards PPAPI events to SDL.
  virtual bool
  HandleInputEvent (const pp::InputEvent & event)
  {
    return true;
  }

  // This function is called for various reasons, e.g. visibility and page
  // size changes. We ignore these calls except for the first
  // invocation, which we use to start the game.
  virtual void
  DidChangeView (const pp::Rect & position, const pp::Rect & clip)
  {
    ++num_changed_view_;
    if (num_changed_view_ > 1)
      return;
    // NOTE: It is crucial that the two calls below are run here
    // and not in a thread.
    StartInNewThread (0);
  }

};


class
  issue356103_Module:
  public
  pp::Module
{
public:
  issue356103_Module ():
  pp::Module ()
  {
  }
  virtual ~
  issue356103_Module ()
  {
  }

  virtual
    pp::Instance *
  CreateInstance (PP_Instance instance)
  {
    return new issue356103_Instance (instance);
  }

};

namespace
  pp
{

  Module *
  CreateModule ()
  {
    return new issue356103_Module ();
  }

}				// namespace pp
