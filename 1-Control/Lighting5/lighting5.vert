#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

// Passsarem els parametres al FS en Eye Space
out vec3 NE;
out vec3 VE;
out vec3 LE;

// Passsarem els parametres al FS en World Space
out vec3 NW;
out vec3 VW;
out vec3 LW;

uniform vec4 lightPosition;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrixInverse;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;


void main(){
    vec3 P=(modelViewMatrix*vec4(vertex.xyz, 1)).xyz;
    
    // Eye Space
    NE = normalMatrix*normal;
    VE = -P;
    LE = lightPosition.xyz - P;
    
    //World Space
    NW = normal;
    VW = (modelViewMatrixInverse*vec4(0,0,0,1)).xyz-vertex.xyz;
    LW=(modelViewMatrixInverse*lightPosition).xyz-vertex.xyz;
    
  	//frontColor=light(N, V, L);
  	gl_Position = modelViewProjectionMatrix*vec4(vertex.xyz, 1.0);
}
