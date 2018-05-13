// HTTPInputPluginV2.h
//
//	Class that handles input using crow
//	New interface. V1 is deprecated
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _HTTP_INPUT_PLUGIN_V2_H_
#define _HTTP_INPUT_PLUGIN_V2_H_

#include "IInputPlugin.h"
// Por usar las definiciones de teclas de SDL
#include "SDL.h"

#include <vector>

class HTTPInputPluginV2: public IInputPlugin
{
// fields
protected:
	static const std::string g_properties[];
	static const int g_paramTypes[];

// methods
public:
	// initialization and cleanup
	HTTPInputPluginV2();
	virtual ~HTTPInputPluginV2();
	virtual bool init();
	virtual void end();

	virtual void acquire();
	virtual void unAcquire();

	virtual bool process(int *inputs);

	// custom properties
	virtual const std::string *getProperties(int *num) const;
	virtual const int *getPropertiesType() const;
	virtual void setProperty(std::string prop, int data);
	virtual void setProperty(std::string prop, int index, int data);
	virtual int getProperty(std::string prop) const;
	virtual int getProperty(std::string prop, int index) const;

protected:
	void initRemapTable();
private:
	void simulateKeys(int repeat, int interval, std::vector<char *> keys);
};

#endif	// _HTTP_INPUT_PLUGIN_V2_H_
