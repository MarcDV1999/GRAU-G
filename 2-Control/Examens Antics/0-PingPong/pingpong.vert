#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 vfrontColor;

uniform mat3 normalMatrix;
uniform float time;
uniform float n = 1; // temps de caiguda lliure, en segons

const float a = -9.8;

void main(){
    vec3 N = normalize(normalMatrix * normal);
    vfrontColor = vec4(color,1.0) * N.z;
    vec3 posicio = vertex;
    
    float v0,y0;
    float t = mod(time,2*n);
   
    
    if(t < n){
        v0 = y0 = 0;
        posicio.y += y0 + v0*t + 0.5*a*(t*t); 
    }
    else if(n < t && t < 2*n){
        v0 = -a*n;
        y0 = 0.5*a*(n*n);
        posicio.y += y0 + v0*(t-n) + 0.5*a*(pow(t-n,2));
    }
    
    
    
    
    
    gl_Position = vec4(posicio, 1.0);
}
