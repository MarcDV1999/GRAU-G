#ifndef _BASE_H
#define _BASE_H

#include "plugin.h" 
#include <QPainter>
#include "point.h"
#include "vector.h"
#include <QVector3D>
class Base: public QObject, public Plugin{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)
    

  public:
	 void onPluginLoad();
     void postFrame();
  private:
	// add private methods and attributes here
      void updateModelInfo();
      float calcularArea(Point a, Point b, Point c);
      QPainter painter;
      int nObj, nPol, nVer, nTri;
      float area = 0;
      
};
#endif

