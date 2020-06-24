#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform vec3 boundingBoxMin;
uniform mat4 modelViewProjectionMatrix;

void show(vec3 pos, vec4 color){
    gfrontColor = color;
    gl_Position = modelViewProjectionMatrix * vec4(pos,1);
	EmitVertex();
}

void main( void ){
    vec3 pos;
    // Pintem copa
	for( int i = 0 ; i < 3 ; i++ ){
		pos = gl_in[i].gl_Position.xyz;
		show(pos,vfrontColor[i]);
	}
    EndPrimitive();
    
    // Pintem Sombra terra
    for( int i = 0 ; i < 3 ; i++ ){
		pos = gl_in[i].gl_Position.xyz;
		pos.y *= 0.01;
		pos.y += boundingBoxMin.y;
		show(pos.xyz,vec4(0,0,0,1));
	}
    EndPrimitive();
    
    // Pintem sombra X
    for( int i = 0 ; i < 3 ; i++ ){
    	pos = gl_in[i].gl_Position.xyz;
		pos.x *= 0.01;
		pos.x += boundingBoxMin.x;
		show(pos.xyz,vec4(0,0,0,1));
	}
    EndPrimitive();
    
    // Pintem sombra z
    for( int i = 0 ; i < 3 ; i++ ){
    	pos = gl_in[i].gl_Position.xyz;
		pos.z *= 0.01;
		pos.z += boundingBoxMin.z;
		show(pos.xyz,vec4(0,0,0,1));
	}
    EndPrimitive();
    
}
