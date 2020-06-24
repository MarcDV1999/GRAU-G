#include "animateVerticesPlugin.h"
#include "glwidget.h"

void AnimateVerticesPlugin::onPluginLoad(){
	// Definim VS
    QString VS =
    "#version 330 core\n"
    "layout (location = 0) in vec3 vertex;"
    "layout (location = 1) in vec3 normal;"
    "out vec4 frontColor;"
    "out vec2 vtexCoord;"
    "uniform mat4 modelViewProjectionMatrix;"
    "uniform mat3 normalMatrix;"
    "uniform float amplitude=0.1;" 
    "uniform float freq = 2.5;"
    "uniform float time;"
    "const float PI = 3.141592;"
    "void main() {"
    "   vec3 N = normalize(normalMatrix * normal);"
    "   frontColor = vec4(vec3(N.z),1.0);"
    "   float d = amplitude * sin(2*PI*freq*time);"
    "   gl_Position = modelViewProjectionMatrix * vec4(vertex+normal*d, 1.0);"
    "}";
    
    // Afegim el VS
    vs = new QOpenGLShader(QOpenGLShader::Vertex, this);
    vs->compileSourceCode(VS);
    cout << "VS log:" << vs->log().toStdString() << endl;

    // Definim FS
    QString fs_src =
    "#version 330 core\n"
    "in vec4 frontColor;"
    "out vec4 fragColor;"
    "void main() {"
    "    fragColor = frontColor;"
    "}";
    
    // Afegim el FS
    fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
    fs->compileSourceCode(fs_src);
    cout << "FS log:" << fs->log().toStdString() << endl;

    // Linkem els Shaders
    program = new QOpenGLShaderProgram(this);
    program->addShader(vs);
    program->addShader(fs);
    program->link();
    cout << "Link log:" << program->log().toStdString() << endl;
    
    elapsedTimer.start();

}

void AnimateVerticesPlugin::preFrame(){
    // Activem els shaders
    program-> bind();
    
    // Assignem valors al uniform time
    program->setUniformValue("time", float(elapsedTimer.elapsed()/1000.0f));
    
    // Assignem valors al uniform normalMatrix
    QMatrix3x3 NM=camera() -> viewMatrix().normalMatrix();
    program->setUniformValue("normalMatrix", NM); 
    
    // Assignem valors al uniform modelViewProjectionMatrix
    QMatrix4x4 MVP=camera()->projectionMatrix()*camera()->viewMatrix();
    program->setUniformValue("modelViewProjectionMatrix", MVP); 
	
}

void AnimateVerticesPlugin::postFrame(){
    // Desactivem els shaders
	program->release();
}


