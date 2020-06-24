#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 vnormal[];
in vec3 vvertex[];

out vec4 gfrontColor;
out vec3 gnormal;
out vec3 gPos;


uniform mat4 modelViewProjectionMatrix;
uniform float d = 0.6;

vec4 greyColor = vec4(.9,.9,.9,1);

void show(vec3 pos, vec3 N){
	gnormal = N;
	gPos = pos;
	gl_Position = modelViewProjectionMatrix * vec4(pos,1);
	EmitVertex();
}

vec3 calcularPerpendicular(vec3 A,vec3 B, vec3 C){
	vec3 AB = B-A;
	vec3 AC = C-A;
	return cross(AB,AC);
}

void main( void ){

	vec3 N = (vnormal[0] + vnormal[1] + vnormal[2])/3;
	gfrontColor = greyColor;
	
	vec3 v0 = gl_in[0].gl_Position.xyz;
	vec3 v1 = gl_in[1].gl_Position.xyz;
	vec3 v2 = gl_in[2].gl_Position.xyz;
	
	vec3 v3 = v0 + d*N;
	vec3 v4 = v1 + d*N;
	vec3 v5 = v2 + d*N;
	
    
    // Avall
    show(v3,-N);
	show(v4,-N);
	show(v5,-N);
    EndPrimitive();
    
    // Enrere
    vec3 NAux = calcularPerpendicular(v0,v1,v5);
    show(v0,NAux);
	show(v1,NAux);
	show(v5,NAux);
    EndPrimitive();
    
    // Esquerra
    NAux = calcularPerpendicular(v1,v5,v4);
    show(v1,NAux);
	show(v5,NAux);
	show(v4,NAux);
    EndPrimitive();
    
    // Dreta
    NAux = calcularPerpendicular(v1,v3,v4);
    show(v1,NAux);
	show(v3,NAux);
	show(v4,NAux);
    EndPrimitive();
    
}
