#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 n[];
in vec3 v[];

out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;
uniform float speed = 0.5;

void main( void ){
	vec3 mitjaNormal = (n[0]+n[1]+n[2])/3;
	for( int i = 0 ; i < 3 ; i++ ){
		gfrontColor = vfrontColor[i];
		vec3 newPunt = v[i]+(speed*mitjaNormal*time);
		gl_Position = modelViewProjectionMatrix * vec4(newPunt,1);
		EmitVertex();
	}
    EndPrimitive();
}
