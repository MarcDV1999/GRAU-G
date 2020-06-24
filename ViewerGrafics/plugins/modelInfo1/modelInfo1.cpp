#include "modelInfo1.h"
#include "glwidget.h"

void ModelInfo1::onPluginLoad()
{
	
}

void ModelInfo1::preFrame()
{
	
}

void ModelInfo1::postFrame(){
    Scene* escena = scene();
    int numeroCares = 0;
    int numeroPoligons = 0;
    int numeroVertex = 0;
    int numeroTriangles = 0;

    int numeroObjectes = scene() -> objects().size();

    // Per cada objecte, extraiem les cares que te
    for (int i = 0; i< numeroObjectes; ++i){
	        const Object& obj = escena -> objects()[i];
	        numeroCares = obj.faces().size();
	        numeroPoligons += numeroCares;
      		// Per cada cara extraiem els vertex que te
      		for(int j = 0; j < numeroCares; ++j){
	            const Face& face = obj.faces()[j];
	            numeroVertex += face.numVertices();
	            if(face.numVertices() % 3 == 0) numeroTriangles++;
	        }
	        

     cout << "INFO:" << endl;
     cout << " - Num objectes: " << numeroObjectes << endl;
     cout << " - Num polígons: " << numeroPoligons << endl;
     cout << " - Num vèrtexs: " << numeroVertex << endl;
     cout << " - Num triangles: " << numeroTriangles << endl;
     if (numeroPoligons!=0) cout << " - Percentatge de triangles: " << double(numeroTriangles/numeroPoligons) * 100 << '%' << endl;
     else cout << " - Percentatge de triangles: NULL" << endl;
    }
}
void ModelInfo1::onObjectAdd()
{
	
}

bool ModelInfo1::drawScene()
{
	return false; // return true only if implemented
}

bool ModelInfo1::drawObject(int)
{
	return false; // return true only if implemented
}

bool ModelInfo1::paintGL()
{
	return false; // return true only if implemented
}

void ModelInfo1::keyPressEvent(QKeyEvent *)
{
	
}

void ModelInfo1::mouseMoveEvent(QMouseEvent *)
{
	
}

