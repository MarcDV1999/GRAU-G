#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 vnormal[];
out vec4 gfrontColor;
out vec3 gnormal;

uniform mat4 modelViewProjectionMatrix;
uniform float d = 0.5;

vec4 greyColor = vec4(.9,.9,.9,1);

void show(vec3 pos, vec3 N){
	gnormal = N;
	gl_Position = modelViewProjectionMatrix * vec4(pos,1);
	EmitVertex();
}

vec3 calcularPerpendicular(vec4 A,vec4 B, vec4 C){
	vec3 AB = B.xyz-A.xyz;
	vec3 AC = C.xyz-A.xyz;
	return cross(AB,AC);
}

void main( void ){

	vec4 N = vec4((vnormal[0] + vnormal[1] + vnormal[2])/3,1);
	gfrontColor = greyColor;
	
	vec4 v0 = gl_in[0].gl_Position;
	vec4 v1 = gl_in[1].gl_Position;
	vec4 v2 = gl_in[2].gl_Position;
	
	vec4 v3 = v0 + d*N;
	vec4 v4 = v1 + d*N;
	vec4 v5 = v2 + d*N;
	
	// Amunt
	show(v0.xyz,N.xyz);
	show(v1.xyz,N.xyz);
	show(v2.xyz,N.xyz);
    EndPrimitive();
    
    // Avall
    show(v3.xyz,-N.xyz);
	show(v4.xyz,-N.xyz);
	show(v5.xyz,-N.xyz);
    EndPrimitive();
    
    // Enrere
    vec3 NAux = calcularPerpendicular(v0,v1,v5);
    show(v0.xyz,NAux);
	show(v1.xyz,NAux);
	show(v5.xyz,NAux);
    EndPrimitive();
    
    // Esquerra
    NAux = calcularPerpendicular(v1,v5,v4);
    show(v1.xyz,NAux);
	show(v5.xyz,NAux);
	show(v4.xyz,NAux);
    EndPrimitive();
    
    // Dreta
    NAux = calcularPerpendicular(v1,v3,v4);
    show(v1.xyz,NAux);
	show(v3.xyz,NAux);
	show(v4.xyz,NAux);
    EndPrimitive();
    
}
