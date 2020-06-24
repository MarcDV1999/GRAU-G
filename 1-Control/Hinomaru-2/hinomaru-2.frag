#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform bool classic = false;

vec4 white = vec4(1,1,1,1);
vec4 red = vec4(1,0,0,1);
vec4 color;
float PI = acos(-1.0);

void main(){
	vec2 c = vec2(0.5,0.5);
	float radi = 0.2;
	float d = distance(vtexCoord,c);
	if(classic){
		if(d <= 0.2) color = red;
		else color = white;
		color = mix(red,white,smoothstep(radi - 0.005, radi + 0.005, d));
	}
	else{
		vec2 u = c - vtexCoord;
		float cita = atan(u.x/u.y);
		float angle = PI/16.0;
		if(mod((cita/angle) + 0.5,2) < 1 || d <= 0.2) color = red;
		else color = white;
		
	}
    fragColor = color;
}
