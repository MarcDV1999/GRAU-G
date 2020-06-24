#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

vec4 yellow = vec4(1,1,0,1);
vec4 red = vec4(1,0,0,1);
vec4 blue = vec4(0,0,1,1);
vec4 color;

void main(){ 
	float a = 1/3.0;
	float t = vtexCoord.x;
	float f = fract(t);

	
	if(f >= 0 && f < a) color = red;
	if (f >= a && f < 2*a) color = blue;
	if(f >= 2*a && f < 3*a)color = yellow;
	
    fragColor = color;
}
