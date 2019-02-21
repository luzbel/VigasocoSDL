// NULLAudioPlugin.h
//
//	Class that handles audio using SDL
//
/////////////////////////////////////////////////////////////////////////////

#ifndef _NULL_VIDEO_PLUGIN_H_
#define _NULL_VIDEO_PLUGIN_H_

#include "IDrawPlugin.h"

#include <vector>

class NULLVideoPlugin: public IDrawPlugin
{
// fields
private:
protected:
	bool _isInitialized;

// methods
public:
	// initialization and cleanup
	NULLVideoPlugin();
	virtual ~NULLVideoPlugin();
	virtual bool init(const VideoInfo *vi, IPalette *pal);
	virtual void end();

	// getters
	virtual bool isInitialized(void) const { return _isInitialized; };

	virtual bool isFullScreen() const  { return false; };
        // bitmap creation/destruction
         virtual int createBitmap(int width, int height)  { return 0; };
         virtual void destroyBitmap(int bitmap)  {};

        // bitmap methods
         virtual void setActiveBitmap(int bitmap) {};
         virtual void compose(int bitmap, int mode, int attr) {};
         virtual void getDimensions(int &width, int &height) const {};

        // clipping methods
         virtual const Rect *getClipArea() const {};
         virtual void setClipArea(int x, int y, int width, int height) {};
         virtual void setNoClip() {};

        // drawing methods
         virtual void render(bool throttle);
        virtual void setPixel(int x, int y, int color);

         virtual void drawLine(int x0, int y0, int x1, int y1, int color) {};
         virtual void drawRect(Rect *rect, int color) {};
         virtual void drawRect(int x0, int y0, int width, int height, int color) {};
         virtual void drawCircle(int x, int y, int radius, int color) {};
         virtual void drawEllipse(int x, int y, int a, int b, int color) {};

         virtual void fillRect(Rect *rect, int color) {};

         virtual void fillRect(int x0, int y0, int width, int height, int color) {};
         virtual void fillCircle(int x, int y, int radius, int color) {};
         virtual void fillEllipse(int x, int y, int a, int b, int color) {};

         virtual void drawGfx(GfxElement *gfx, int code, int color, int x, int y, int attr) {};
         virtual void drawGfxClip(GfxElement *gfx, int code, int color, int x, int y, int attr) {};
         virtual void drawGfxTrans(GfxElement *gfx, int code, int color, int x, int y, int attr, int transData) {};
         virtual void drawGfxClipTrans(GfxElement *gfx, int code, int color, int x, int y, int attr, int transData) {};

	// custom properties
	virtual const std::string *getProperties(int *num) const;
	virtual const unsigned int *getPropertiesType() const;
	virtual void setProperty(std::string prop, int data);
	virtual void setProperty(std::string prop, int index, int data);
	virtual int getProperty(std::string prop) const;
	virtual int getProperty(std::string prop, int index) const;

protected:
	void initRemapTable();
private:
};


#endif	// _NULL_VIDEO__PLUGIN_H_
