#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform float n=8;

void main(){
	
	fragColor = vec4(1,0,0,1);
	if(mod(vtexCoord.x*n*8,8) >= 1 && mod(vtexCoord.y*n*8,8) >= 1) discard;
} 
