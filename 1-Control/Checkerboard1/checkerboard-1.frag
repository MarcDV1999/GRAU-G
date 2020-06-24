#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

vec4 black = vec4(0,0,0,1);
vec4 white = vec4(1,1,1,1);

vec4 color;

void main(){

	// Miro quan medeix un cuadradito
	float cuadradito = 1/8.0;
	
	// Miro si les coordenades estan dins de una fila i columna parella
	int fila = int(mod(vtexCoord.x/cuadradito,2));
	int columna = int(mod(vtexCoord.y/cuadradito,2));
	
	
	if(fila == columna) color = white;
	else color = black;

    fragColor = color;
}
