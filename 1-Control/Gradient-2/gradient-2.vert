#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

vec3 color;

void main(){

	vec4 v = modelViewProjectionMatrix * vec4(vertex, 1.0); // Coordenades que van de -1 a 1.(viewport)
	float min = boundingBoxMin.y;
	float max = boundingBoxMax.y;
	float altura = max-min;
	float y = ((v.y/v.w)+1)/2; // Normalitzem la y per a que vagi de 0 a 1. Dividim entre w perque volem saber una coordenada de un vec4
	
	// Partim les 4 franges i fem els mix4*y
	if(y < 0.25) color = mix(vec3(1,0,0), vec3(1,1,0),4*y);
	else if(y < 0.5) color = mix(vec3(1,1,0), vec3(0,1,0),(4*y)-1);
	else if(y < 0.75) color = mix(vec3(0,1,0), vec3(0,1,1),(4*y)-2);
	else color = mix(vec3(0,1,1), vec3(0,0,1),(4*y)-3);
	 
	
    frontColor = vec4(color,1.0);
    gl_Position = v;
}
