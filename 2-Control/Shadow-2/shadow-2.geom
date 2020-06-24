#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main( void ){
	for( int i = 0 ; i < 3 ; i++ ){
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix * gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();
    
    gfrontColor = vec4(0);
    for( int i = 0 ; i < 3 ; i++ ){
		
		vec4 puntOS = gl_in[i].gl_Position;
		puntOS.y *= 0.01;
		puntOS.y += boundingBoxMin.y;
		
		gl_Position = modelViewProjectionMatrix * puntOS;
		EmitVertex();
	}
	
    EndPrimitive();
    
    if (gl_PrimitiveIDIn == 0){
    	float d = distance(boundingBoxMax,boundingBoxMin)/2;
    	
    	gfrontColor = vec4(0,1,1,1);
    	gl_Position = modelViewProjectionMatrix * vec4(-d,boundingBoxMin.y-0.01,d,1); EmitVertex();
    	
    	gl_Position = modelViewProjectionMatrix * vec4(d,boundingBoxMin.y - 0.01,d,1); EmitVertex();
    	gl_Position = modelViewProjectionMatrix * vec4(-d,boundingBoxMin.y - 0.01,-d,1); EmitVertex();
    	gl_Position = modelViewProjectionMatrix * vec4(d,boundingBoxMin.y-0.01,-d,1); EmitVertex();
    	
    }
}
