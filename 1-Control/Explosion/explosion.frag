#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

float slice = 1/30.0;
int frame;
int numImatges = 48;

uniform float time;
uniform sampler2D numbers;
uniform sampler2D explosion1;

void main(){
	frame = int(mod(time/slice,numImatges)); // Numero entre 0 i numImatges que depen del temps
	
	int x=frame%8;
  	int y=5-frame/8;
  
	vec2 texCoord=vtexCoord*vec2(1.0/8, 1.0/6);
  	texCoord.x+=x/8.0;
  	texCoord.y+=y/6.0;
    fragColor = texture(explosion1,texCoord);
    fragColor*=fragColor.w;
    
}
