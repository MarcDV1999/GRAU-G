#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix; // Per passar a eye Space
uniform mat4 modelMatrix; // Per passar a eye Space
uniform mat3 normalMatrix;

uniform float M_PI;
uniform float time;
uniform bool eyespace = false;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;


vec4 origen = vec4(0,0,0,1);
vec4 blanc = vec4(1);


void main(){
	float radi = distance(boundingBoxMax, boundingBoxMin)/2;
	vec3 pos;
	float freq = 3.5;
	float t = mod(time,freq);
	vec4 posMS = modelMatrix * vec4(vertex,1);

	if(t <= 0.5){
	    pos = mix(origen,posMS,pow(t/0.5,3)).xyz;
	}
	else if(t > 0.5 && t <= 3.5){
	    pos = mix(posMS,origen,t/3.5).xyz;
	}
    
    vec3 N = normalMatrix * normalize(normal);
    frontColor = blanc * N.z;

    gl_Position=modelViewProjectionMatrix*vec4(pos, 1);
}
