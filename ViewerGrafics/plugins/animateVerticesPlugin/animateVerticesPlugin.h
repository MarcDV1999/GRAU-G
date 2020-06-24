#ifndef _ANIMATEVERTICESPLUGIN_H
#define _ANIMATEVERTICESPLUGIN_H

#include "plugin.h" 
#include <QElapsedTimer>

class AnimateVerticesPlugin: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 void onPluginLoad();
	 void preFrame();
	 void postFrame();

  private:
	// add private methods and attributes here
	QOpenGLShaderProgram* program;
    QOpenGLShader *fs, *vs;
    QElapsedTimer elapsedTimer;
};

#endif
