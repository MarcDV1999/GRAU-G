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


	float min = boundingBoxMin.y;
	float max = boundingBoxMax.y;
	float altura = max-min;
	float y = (vertex.y - min)/altura; // Normalitzem la y per a que vagi de 0 a 1
	
	// Partim les 4 franges i fem els mix. A cada mix multipliquem per a que la y de cada moment vagi de 0 a 1(sino nomes aniria de 0 a 0.25 per exeple) i restem perque sino al multiplicar pot ser que el valor sigui mes gran a 1.
	if(y < 0.25) color = mix(vec3(1,0,0), vec3(1,1,0),4*y);
	else if(y < 0.5) color = mix(vec3(1,1,0), vec3(0,1,0),(4*y)-1);
	else if(y < 0.75) color = mix(vec3(0,1,0), vec3(0,1,1),(4*y)-2);
	else color = mix(vec3(0,1,1), vec3(0,0,1),(4*y)-3);

	
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
