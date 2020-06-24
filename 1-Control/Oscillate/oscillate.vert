#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix; // Per passar a eye Space
uniform mat3 normalMatrix;

uniform float M_PI;
uniform float time;
uniform bool eyespace = false;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;





void main(){
	float radi = distance(boundingBoxMax, boundingBoxMin)/2;
	float d;
	float y = vertex.y;
	float moviment;
	vec3 v;
	if(eyespace) y = (modelViewMatrix * vec4(vertex,1)).y;
	
	d = (radi/10.0)*y;
	v = vertex + normal * d * sin(time); 
    
    frontColor = vec4(color,1.0);

    gl_Position=modelViewProjectionMatrix*vec4(v, 1);
}
