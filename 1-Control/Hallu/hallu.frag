#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D map;
uniform float time;
uniform float a= 0.5;
uniform float PI = acos(-1 .0); 


void main(){
	float angle = PI*2*time;
	mat2 rotacio = mat2(vec2(cos(angle), sin(angle)), vec2(-sin(angle), cos(angle)));
	vec4 c = texture(map,vtexCoord);
	float m = max(max(c.x,c.y),c.z);
	vec2 u = vec2(m);
	
	u = rotacio * u;
	
	vec2 offset = (a/100.0) * u;
	

    fragColor = texture(map,vtexCoord + offset);
    //fragColor = texture(map,vtexCoord);
} 
