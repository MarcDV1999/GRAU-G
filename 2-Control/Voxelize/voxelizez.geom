#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 v[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float step = 0.1;

void show(vec3 p, vec3 N) {
    gfrontColor = vec4(0.6)*N.z;
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
	show(A,N); show(B,N); show(C,N); show(D,N);
    EndPrimitive();
    
    N = normalMatrix*vec3(-1,0,0);
	show(E,N); show(A,N); show(G,N); show(C,N);
    EndPrimitive();
    
    N = normalMatrix*vec3(0,0,-1);
	show(F,N); show(E,N); show(G,N); show(H,N);
    EndPrimitive();
    
    N = normalMatrix*vec3(1,0,0);
	show(B,N); show(F,N); show(D,N); show(H,N);
    EndPrimitive();
    
    N = normalMatrix*vec3(0,1,0);
	show(C,N); show(D,N); show(G,N); show(H,N);
    EndPrimitive();
    
    N = normalMatrix*vec3(0,-1,0);
	show(E,N); show(F,N); show(A,N); show(B,N);
    EndPrimitive();
    
}
