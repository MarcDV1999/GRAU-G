#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time;

float A;
mat4 translacio = mat4(vec4(1,0,0,0), vec4(0,1,0,0), vec4(0,0,1,0), vec4(0,1,0,1));
mat4 translacioI = mat4(vec4(1,0,0,0), vec4(0,1,0,0), vec4(0,0,1,0), vec4(0,-1,0,1));

void main(){
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    
    // Calculem angle
    if(vertex.y >= 0.5)A = (vertex.y-0.5)*sin(time);
    else A = 0;
    
    //Calculo la rotacio
    mat4 rotacio = mat4(vec4(1,0,0,0),vec4(0, cos(A),sin(A),0),vec4(0, -sin(A), cos(A),0), vec4(0,0,0,1));

    // Traslado - Roto i traslado
    gl_Position = modelViewProjectionMatrix * translacio * rotacio * translacioI * vec4(vertex,1);
}
