#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;


void show(vec3 pos, vec4 color){
    gfrontColor = color;
    gl_Position = modelViewProjectionMatrix * vec4(pos,1);
	EmitVertex();
}

void main( void ){
    
	for( int i = 0 ; i < 3 ; i++ ){
		vec4 color = vfrontColor[i];
		vec3 pos = gl_in[i].gl_Position.xyz;
		show(pos,color);
	}
    EndPrimitive();
}
