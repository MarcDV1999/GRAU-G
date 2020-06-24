#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D noise0;
uniform sampler2D rock1;
uniform sampler2D grass2;

void main(){
	
	vec4 fColorN = texture(noise0, vtexCoord); // Retorna color
	vec4 fColorR = texture(rock1, vtexCoord);
	vec4 fColorG = texture(grass2, vtexCoord);
	
    fragColor = mix(fColorR, fColorG, fColorN); // Barregem els colors en base al color que te noise
}
