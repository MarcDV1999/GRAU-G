#version 330 core

in vec4 frontColor;
in vec3 v;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D colorMap; 
const float PI = 3.141592;  


void main(){
    vec2 Q = (vtexCoord * 2) - 1;
    float r = length(Q);
    
    float r2 = r + (0.22*pow(r,3)) + (0.24*pow(r,5));
    vec2 Q2 = r2 * normalize(Q);
    
    vec2 st = (Q2 + 1)/2.0;
    
    if (st.s >= 0 && st.s <= 1 && st.t >= 0 && st.t <= 1) fragColor = texture(colorMap, st);
    else fragColor = vec4(0,0,0,1);
}
