#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 vnormal[];
in vec3 vvertex[];
out vec4 gfrontColor;
out vec3 gnormal;

uniform float disp = 0.05;
uniform mat4 modelViewProjectionMatrix;


vec4 blanc = vec4(1,1,1,1);

void show(vec3 pos){
	gl_Position = modelViewProjectionMatrix * vec4(pos,1);
	EmitVertex();
}


void main( void ){
	vec3 N = normalize(vnormal[0] + vnormal[1] + vnormal[2]) * disp;
	
	
	vec3 A = vvertex[0];
	vec3 B = vvertex[1];
	vec3 C = vvertex[2];
	vec3 baricentre = (A+B+C)/3;
	vec3 X = baricentre + N;
	
	

	gfrontColor = vfrontColor[0]; show(A);
	gfrontColor = vfrontColor[1]; show(B);
	gfrontColor = blanc; show(X);
    EndPrimitive();
    

    gfrontColor = vfrontColor[1]; show(B);
	gfrontColor = vfrontColor[2]; show(C);
	gfrontColor = blanc; show(X);
    EndPrimitive();
    

    gfrontColor = vfrontColor[2]; show(C);
	gfrontColor = vfrontColor[0]; show(A);
	gfrontColor = blanc; show(X);
    EndPrimitive();
}
