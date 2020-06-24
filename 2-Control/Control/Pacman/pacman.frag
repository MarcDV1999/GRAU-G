#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
in vec3 vN;
out vec4 fragColor;

uniform sampler2D colormap;

vec4 negre = vec4(0,0,0,1);
vec4 vermell = vec4(1,0,0,1);
vec4 blau = vec4(0,0,1,1);
vec4 groc = vec4(1,1,0,1);
vec4 verd = vec4(0,1,0,1);
vec4 blanc = vec4(1);


vec4 dibuixarUlls(vec2 c1, vec2 c2, float radi){
    vec2 stFantasma = vtexCoord;
    stFantasma.x /= 2;
    
    vec2 stPacman = stFantasma;
    stPacman.x += 0.5;
    
    vec4 textura;
    
    
    
    // Pintem pacman i fantasmas
    if (vtexCoord.s < 0.2 && vtexCoord.s > 0.1 && vtexCoord.t < 0.2 && vtexCoord.t > 0.1) {
        textura = texture(colormap,stFantasma*10);
    }
    
    else if (vtexCoord.s < 0.5 && vtexCoord.s > 0.4 && vtexCoord.t < 0.5 && vtexCoord.t > 0.4) {
        textura = texture(colormap,stFantasma*10);
        if (textura == vermell) textura = blau;
    }
    
    else if (vtexCoord.s < 0.3 && vtexCoord.s > 0.2 && vtexCoord.t < 0.2 && vtexCoord.t > 0.1) {
        textura = texture(colormap,stFantasma*10);
        if (textura == vermell) textura = vec4(1,0.5,0,1);
    }
    
    else if (vtexCoord.s < 0.7 && vtexCoord.s > 0.6 && vtexCoord.t < 0.5 && vtexCoord.t > 0.4) {
        textura = texture(colormap,stFantasma*10);
        if (textura == vermell) textura = vec4(1,0.5,1,1);
    }
        
    else if (vtexCoord.s < 0.7 && vtexCoord.s > 0.6 && vtexCoord.t < 0.8 && vtexCoord.t > 0.7) textura = texture(colormap,stFantasma*10);
        
    else textura = vec4(0,0,0,1);
    
    
    
    vec2 c3 = vec2(0.15,0.65);
    vec2 c4 = vec2(0.45,0.90);
    vec2 c5 = vec2(0.10,0.34);
    vec2 c6 = vec2(0.53,0.67);
    
    
	float d1 = distance(vtexCoord,c1);
	float d2 = distance(vtexCoord,c2);
	float d3 = distance(vtexCoord,c3);
	float d4 = distance(vtexCoord,c4);
	float d5 = distance(vtexCoord,c5);
	float d6 = distance(vtexCoord,c6);
	
	if(d1 <= radi) {
	    vec4 color = mix(groc,blanc,smoothstep(radi - 0.008, radi + 0.008, d1));
	    return color;
	}
	else if(d2 <= radi){
	    vec4 color = mix(groc,blanc,smoothstep(radi - 0.008, radi + 0.008, d2));
	    return color;
	}
	else if(d3 <= radi){
	    vec4 color = mix(groc,blanc,smoothstep(radi - 0.008, radi + 0.008, d3));
	    return color;
	}
	else if(d4 <= radi){
	    vec4 color = mix(groc,blanc,smoothstep(radi - 0.008, radi + 0.008, d4));
	    return color;
	}
	else if(d5 <= radi){
	    vec4 color = mix(groc,blanc,smoothstep(radi - 0.008, radi + 0.008, d5));
	    return color;
	}
	else if(d6 <= radi){
	    vec4 color = mix(groc,blanc,smoothstep(radi - 0.008, radi + 0.008, d6));
	    return color;
	}
	
	else if (vtexCoord.s < 0.6 && vtexCoord.s > 0.2 && vtexCoord.t < 0.1 && vtexCoord.t > 0.09) {
        textura = vermell;
    }
    else if (vtexCoord.s < 0.9 && vtexCoord.s > 0.4 && vtexCoord.t < 0.3 && vtexCoord.t > 0.29) {
        textura = vermell;
    }
    
    else if (vtexCoord.s < 0.7 && vtexCoord.s > 0.4 && vtexCoord.t < 0.6 && vtexCoord.t > 0.59) {
        textura = vermell;
    }
    else if (vtexCoord.s < 0.9 && vtexCoord.s > 0.1 && vtexCoord.t < 0.8 && vtexCoord.t > 0.79) {
        textura = vermell;
    }
    
    else if (vtexCoord.s < 0.9 && vtexCoord.s > 0.89 && vtexCoord.t < 0.8 && vtexCoord.t > 0.2) {
        textura = vermell;
    }
	
	else if (vtexCoord.s < 0.5 && vtexCoord.s > 0.49 && vtexCoord.t < 0.8 && vtexCoord.t > 0.2) {
        textura = vermell;
    }
	
	else if (vtexCoord.s < 0.2 && vtexCoord.s > 0.19 && vtexCoord.t < 0.5 && vtexCoord.t > 0.1) {
        textura = vermell;
    }
    else if (vtexCoord.s < 0.2 && vtexCoord.s > 0.19 && vtexCoord.t < 0.5 && vtexCoord.t > 0.1) {
        textura = vermell;
    }
	return textura;
}


void main(){
    
    float radi = 0.02;
    vec2 c1 = vec2(0.34,0.65);
    vec2 c2 = vec2(0.66,0.65);
    
    fragColor = dibuixarUlls(c1,c2,radi);
}
