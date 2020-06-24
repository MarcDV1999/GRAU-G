#include "volume.h"
#include "glwidget.h"
#include <QVector3D>

void Volume::updateInfo(){
    Scene* scn = scene();
	nObj = scn->objects().size();
    
    const Object& obj = scn->objects()[0];
    int nfaces = obj.faces().size();
    const vector<Vertex>& vertexs = obj.vertices();
    
    for (int j = 0; j<nfaces; ++j) {
        const Face& face = obj.faces()[j];
        int v0 = face.vertexIndex(0);
        int v1 = face.vertexIndex(1);
        int v2 = face.vertexIndex(2);
        
        Point a = vertexs[v0].coord();
        Point b = vertexs[v1].coord();
        Point c = vertexs[v2].coord();
        
        Vector N = face.normal();
        Point C = (a + b + c)/3;
        float A = calcularArea(a,b,c);
        
        volum += (C[2] * N[2] * A);
        
    }
    
}



void Volume::onPluginLoad(){
    updateInfo();
    cout << "Volume: " << volum << endl;
}

float Volume::calcularArea(Point a, Point b, Point c){
    Vector ab = a-b;
    Vector ac = a-c;
    Vector w = Vector::crossProduct(ab, ac);
    return w.length()/2.0;

}
