#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 v[];

out vec4 gfrontColor;
out vec2 gtexCoord;
out vec3 gnormal;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float step = 0.2;

void show(vec3 p, vec3 N, int s, int t) {
	vec4 colorMig = (vfrontColor[0]+vfrontColor[1]+vfrontColor[2]);
    gfrontColor = colorMig*N.z;
    gnormal = N;
    gtexCoord.s = s;
    gtexCoord.t = t;
    gl_Position = modelViewProjectionMatrix*vec4(p,1.0);
	EmitVertex();
}

void main( void ){
	vec3 puntMig = (v[0] + v[1] + v[2])/3;
	
	puntMig /= step;
	puntMig = vec3(int(puntMig.x),int(puntMig.y),int(puntMig.z));
	puntMig *= step;
	
	float r = float(step)/2.0;

	vec3 A = puntMig + vec3(-r,-r,r);
	vec3 B = puntMig + vec3(r,-r,r);
	vec3 C = puntMig + vec3(-r,r,r);
	vec3 D = puntMig + vec3(r,r,r);
	
	vec3 E = puntMig + vec3(-r,-r,-r);
	vec3 F = puntMig + vec3(r,-r,-r);
	vec3 G = puntMig + vec3(-r,r,-r);
	vec3 H = puntMig + vec3(r,r,-r);
	
	vec3 N;
	N = normalMatrix*vec3(0,0,1);
	show(A,N,0,0); show(B,N,0,0); show(C,N,0,0); show(D,N,0,0);
    EndPrimitive();
    
    N = normalMatrix*vec3(-1,0,0);
	show(E,N,0,0); show(A,N,0,0); show(G,N,0,0); show(C,N,0,0);
    EndPrimitive();
    
    N = normalMatrix*vec3(0,0,-1);
	show(F,N,0,0); show(E,N,0,0); show(G,N,0,0); show(H,N,0,0);
    EndPrimitive();
    
    N = normalMatrix*vec3(1,0,0);
	show(B,N,0,0); show(F,N,0,0); show(D,N,0,0); show(H,N,0,0);
    EndPrimitive();
    
    N = normalMatrix*vec3(0,1,0);
	show(C,N,0,0); show(D,N,1,0); show(G,N,0,1); show(H,N,1,1);
    EndPrimitive();
    
    N = normalMatrix*vec3(0,-1,0);
	show(E,N,0,0); show(F,N,0,0); show(A,N,0,0); show(B,N,0,0);
    EndPrimitive();
    
}
