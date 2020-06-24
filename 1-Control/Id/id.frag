#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D colorMap;
float digits = 0.6;

vec2 proporcio = vec2(digits,1.0);
vec2 quatre = vec2(1.0/10., 1.0);
vec2 un = vec2(1.0/10., 1.0);
vec2 zero = vec2(1.0/10., 1.0);
vec2 cinc = vec2(1.0/10., 1.0);
vec2 nou = vec2(1.0/10., 1.0);

void main(){
	vec2 texCoord = vtexCoord;
	
	texCoord = vtexCoord * proporcio;
  	
  	texCoord=vtexCoord*un;
  
    fragColor = texture(colorMap, texCoord);
}
