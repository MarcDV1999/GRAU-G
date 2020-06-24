#include "base.h"
#include "glwidget.h"
#include <QVector3D>

void Base::updateModelInfo(){
    Scene* scn = scene();
	nObj = scn->objects().size();
    nPol = 0, nVer = 0, nTri = 0;
    
    const Object& obj = scn->objects()[0];
    int nfaces = obj.faces().size();
    nPol += nfaces;
    const vector<Vertex>& vertexs = obj.vertices();
    float yMin = obj.boundingBox().center().y();
    
    for (int j = 0; j<nfaces; ++j) {
        const Face& face = obj.faces()[j];
        int v0 = face.vertexIndex(0);
        int v1 = face.vertexIndex(1);
        int v2 = face.vertexIndex(2);
        
        Point a = vertexs[v0].coord();
        Point b = vertexs[v1].coord();
        Point c = vertexs[v2].coord();
        if(a.y() < yMin || b.y() < yMin || c.y() < yMin) area += calcularArea(a,b,c);
        
    }
    
}



void Base::postFrame(){
    painter.begin(glwidget());
    QFont font;
    font.setPixelSize(15);
    painter.setFont(font);
    //painter.setPen(QColor(255,0,0));
    int x = 20;
    int y = 350;

    painter.drawText(x, y, QString("INFO:"));
    painter.drawText(x, y+20, QString(" - Objectes: %1").arg(nObj));
    painter.drawText(x, y+40, QString(" - Area: %1").arg(area));
    painter.end();
}

void Base::onPluginLoad(){
    updateModelInfo();
}

float Base::calcularArea(Point a, Point b, Point c){
    Vector u = Vector(0.0, 0.0, 0.0);
    Vector v = Vector(1.0, 0.0, 0.0);
    
    Vector ab = a-b;
    Vector ac = a-c;
    Vector w = Vector::crossProduct(ab, ac);
    return w.length()/2.0;
    
    //return 2.0;

}
