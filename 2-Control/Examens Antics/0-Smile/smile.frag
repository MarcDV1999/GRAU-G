#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
in vec3 vN;
out vec4 fragColor;

uniform sampler2D colormap;

vec4 negre = vec4(0,0,0,1);
vec4 blanc = vec4(1);


vec4 dibuixarUlls(vec2 c1, vec2 c2, float radi){
    
    vec4 textura = texture(colormap,vtexCoord);
	float d1 = distance(vtexCoord,c1);
	float d2 = distance(vtexCoord,c2);
	
	if(d1 <= radi) {
	    vec4 color = mix(negre,blanc,smoothstep(radi - 0.008, radi + 0.008, d1));
	    return color;
	}
	else if(d2 <= radi){
	    vec4 color = mix(negre,blanc,smoothstep(radi - 0.008, radi + 0.008, d2));
	    return color;
	}
	// Si no es cap ull, pintem la textura
	return textura;
}

void main(){
    
    float radiUlls = 0.05;
    // Centres dels ulls (centre esfera)
    vec2 c1 = vec2(0.34,0.65);
    vec2 c2 = vec2(0.66,0.65);
    
    // Calcul del nou centre per a que els ulls mirin a la camera tot el rato
    c1 += -0.1*vN.xy;
    c2 += -0.1*vN.xy;
	 
    fragColor = dibuixarUlls(c1,c2,radiUlls);
}
