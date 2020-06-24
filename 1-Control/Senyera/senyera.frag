#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

vec4 yellow = vec4(1,1,0,1);
vec4 red = vec4(1,0,0,1);
vec4 color;

void main(){ 
	float a = 1/9.0;
	float s = vtexCoord.x;
	float f = fract(s);
	
	if((f >= 0 && f < a) || (f >= 2*a && f < 3*a) || (f >= 4*a && f < 5*a) || (f >= 6*a && f < 7*a) || (f >= 8*a && f < 9*a)) color = yellow;
	else color = red;
	
    fragColor = color;
}
