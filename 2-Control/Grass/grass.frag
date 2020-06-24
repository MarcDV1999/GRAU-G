#version 330 core

in vec4 gfrontColor;
in vec3 gnormal;
in vec3 gPos;
out vec4 fragColor;

uniform sampler2D grass_side0;
uniform sampler2D grass_top1;
uniform float d;

void main(){
    // Cara vertical
    vec4 textura;
    if(gnormal.z == 0){
        vec2 texCoord = vec2(4*(gPos.x - gPos.y), 1.0 - gPos.z/d);
        textura = texture(grass_side0,texCoord);
        if (textura.t < 0.1) discard;
    }
    // Cara Horitzontal
    else {
        vec2 texCoord = 4*gPos.xy;
        textura = texture(grass_top1,texCoord);

    }
    fragColor = textura;
}
