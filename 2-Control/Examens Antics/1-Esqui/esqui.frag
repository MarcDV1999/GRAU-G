#version 330 core

in vec4 frontColor;
in vec3 v;
out vec4 fragColor;

uniform sampler2D panorama; 
const float PI = 3.141592;  


void main(){

    float phi = asin(v.y);
    float theta = atan(v.z, v.x);
    vec2 st = vec2(theta/(2*PI), phi/PI + 0.5);
    fragColor = texture(panorama, st);
}
