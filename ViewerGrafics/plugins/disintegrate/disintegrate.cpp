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

#include "disintegrate.h"

void Disintegrate::onPluginLoad(){

    GLWidget & g = *glwidget();
    g.makeCurrent();
    
    // Carregar shader, compile & link 
    vs = new QOpenGLShader(QOpenGLShader::Vertex, this);
    vs->compileSourceFile(g.getPluginPath()+"/../disintegrate/disintegrate.vert");
    cout << "VS log:" << vs->log().toStdString() << endl;
    
    // Carregar shader, compile & link 
    gs = new QOpenGLShader(QOpenGLShader::Geometry, this);
    gs->compileSourceFile(g.getPluginPath()+"/../disintegrate/disintegrate.geom");
    cout << "GS log:" << gs->log().toStdString() << endl;

    // Carregar shader, compile & link 
    fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
    fs->compileSourceFile(g.getPluginPath()+"/../disintegrate/disintegrate.frag");
    cout << "FS log:" << fs->log().toStdString() << endl;

    program = new QOpenGLShaderProgram(this);
    program->addShader(vs);
    program->addShader(gs);
    program->addShader(fs);
    program->link();
    cout << "Link log:" << program->log().toStdString() << endl;
    elapsedTimer.start();
}

void Disintegrate::preFrame() 
{
    // bind shader and define uniforms
    program->bind();
    program->setUniformValue("time", float(elapsedTimer.elapsed()/1000.0f));
    QMatrix4x4 MVP = camera()->projectionMatrix() * camera()->viewMatrix();
    program->setUniformValue("modelViewProjectionMatrix", MVP); 
}

void Disintegrate::postFrame() {
    // unbind shader
    //program->release();
}



void Disintegrate::keyPressEvent(QKeyEvent *e){
	if(e -> key() == Qt::Key_R) elapsedTimer.start();
}











