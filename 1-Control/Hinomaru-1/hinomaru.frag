#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

vec4 white = vec4(1,1,1,1);
vec4 red = vec4(1,0,0,1);
vec4 color;

void main(){
	vec2 c = vec2(0.5,0.5);
	float radi = 0.2;
	float d = distance(vtexCoord,c);
	
	if(d <= 0.2) color = red;
	else color = white;
	
	
	color = mix(red,white,smoothstep(radi - 0.005, radi + 0.005, d));
	 
    fragColor = color;
}
