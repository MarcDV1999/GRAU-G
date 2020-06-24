#version 330 core

in vec4 gfrontColor;
in vec3 gnormal;
out vec4 fragColor;

void main(){
    fragColor = gfrontColor * gnormal.z;
}
