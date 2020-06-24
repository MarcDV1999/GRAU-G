#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

vec4 white = vec4(1,1,1,1);
vec4 red = vec4(1,0,0,1);
vec4 blue = vec4(0,0,1,1);
vec4 color;

float offsetD = 0.15;
float offsetA = 0.16;
vec2 offsetI = vec2(-offsetD,offsetD);


void main(){
	vec2 c = vec2(0.5,0.5);
	float radi = 1/14.0;
	
	vec2 offsetAdalt = 0.8*(vec2(0,-offsetD));
	float d = distance(vtexCoord + offsetAdalt ,c);
	
	float kD1 = distance(vtexCoord - offsetD + offsetAdalt,c);
	float kD2 = distance(vtexCoord - 2*offsetD + offsetAdalt,c);
	
	float kE1 = distance(vtexCoord - offsetI + offsetAdalt,c);
	float kE2 = distance(vtexCoord - 2*offsetI + offsetAdalt,c);
	
	float kIA0 = distance(vtexCoord - 2*offsetI + offsetAdalt,c);
	

	float kIA1 = distance(vtexCoord - (2*offsetI)-vec2(0,-offsetA) + offsetAdalt,c);
	float kIA2 = distance(vtexCoord - (2*offsetI)-vec2(0,2*-offsetA)+ offsetAdalt,c);
	float kIA3 = distance(vtexCoord - (2*offsetI)-vec2(0,3*-offsetA)+ offsetAdalt,c);
	float kIA4 = distance(vtexCoord - (2*offsetI)-vec2(0,4*-offsetA)+ offsetAdalt,c);
	float kIA5 = distance(vtexCoord - (2*offsetI)-vec2(0,5*-offsetA)+ offsetAdalt,c);
	
	float kDA1 = distance(vtexCoord - 2*offsetD - vec2(0,-offsetA)+ offsetAdalt,c);
	float kDA2 = distance(vtexCoord - 2*offsetD - vec2(0,2*-offsetA)+ offsetAdalt,c);
	float kDA3 = distance(vtexCoord - 2*offsetD - vec2(0,3*-offsetA)+ offsetAdalt,c);
	float kDA4 = distance(vtexCoord - 2*offsetD - vec2(0,4*-offsetA)+ offsetAdalt,c);
	float kDA5 = distance(vtexCoord - 2*offsetD - vec2(0,5*-offsetA)+ offsetAdalt,c);

	color = white;
	
	// V del mig
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, d));
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kD1));
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kD2));
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kE1));
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kE2));
	
	// Barra Esquerra
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kIA1));
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kIA2));
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kIA3));
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kIA4));
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kIA5));
	
	// Barra dreta
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kDA1));
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kDA2));
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kDA3));
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kDA4));
	color = mix(red,color,smoothstep(radi - 0.005, radi + 0.005, kDA5));
	
	 
    fragColor = color;
}
