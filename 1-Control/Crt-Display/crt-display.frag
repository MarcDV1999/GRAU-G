#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform int n = 16;

void main(){
	float y = mod(gl_FragCoord.y,n);
	if(y > 1) discard;
	
	
    fragColor = frontColor;
    
}
