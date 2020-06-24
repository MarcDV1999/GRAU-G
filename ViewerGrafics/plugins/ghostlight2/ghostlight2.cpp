// GLarena, a plugin based platform to teach OpenGL programming
// © Copyright 2012-2018, ViRVIG Research Group, UPC, https://www.virvig.eu
// 
// This file is part of GLarena
//
// GLarena is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

#include "ghostlight2.h"
#include "glwidget.h"


void Ghostlight2::onPluginLoad(){

    GLWidget & g = *glwidget();
    g.makeCurrent();
    
    // VS
    QString vs_src = \
      "#version 330 core\n"
      "uniform float radius = 1.0;"
      "uniform mat4 modelViewProjectionMatrix;"
      "layout (location = 0) in vec3 vertex;"
      "out vec2 vtexCoord;"
      "void main() {"
      "  gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.);"
      "  vtexCoord = (4.0/radius)*(vertex.xy+vertex.zx);"
      "}";
    vs = new QOpenGLShader(QOpenGLShader::Vertex, this);
    vs->compileSourceCode(vs_src);

	// FS
    QString fs_src =
      "#version 330 core\n"
      "uniform sampler2D sampler0;"
      "uniform sampler2D sampler1;"
      "in vec2 vtexCoord;"
      "out vec4 fragColor;"
      "uniform int distanciaX;"
      "uniform int distanciaY;"
      "void main() {"
      "fragColor =  mix(texture(sampler0, vtexCoord),"
      "                 texture(sampler1, vtexCoord), 0.5); }";
    fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
    fs->compileSourceCode(fs_src);

    program = new QOpenGLShaderProgram(this);
    program->addShader(vs);
    program->addShader(fs);
    program->link();
    cout << "Link log:" << program->log().toStdString() << endl;
}


void Ghostlight2::preFrame() {
    glDisable(GL_DEPTH_TEST);
    glBlendEquation(GL_FUNC_ADD);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE);
    glEnable(GL_CULL_FACE);
    glEnable(GL_BLEND);
    
    int distanciaX = pxClick;
    int distanciaY = pyClick;
    program->setUniformValue("distanciaX", distanciaX);
    program->setUniformValue("distanciaY", distanciaY); 
}

void Ghostlight2::postFrame() {
    glEnable(GL_DEPTH_TEST);
    glDisable(GL_BLEND);
}


void Ghostlight2::mouseMoveEvent(QMouseEvent *e){

    pxClick=e->x();
    pyClick=e->y();

    glwidget()->update();
}





