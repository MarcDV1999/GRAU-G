#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

vec4 blau = vec4(0,0,1,1);
vec4 verd = vec4(0,1,0,1);
vec4 vermell = vec4(1,0,0,1);


vec3 calcularNormal(vec3 a, vec3 b, vec3 c){
    vec3 ab = b-a;
    vec3 ac = c-a;
    return cross(ab,ac);
}

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
		
		gl_Position = modelViewProjectionMatrix * puntOS;
		EmitVertex();
	}
	
    EndPrimitive();
    
    if (gl_PrimitiveIDIn == 0){
        vec3 ma = boundingBoxMax;
        vec3 mi = boundingBoxMin;
        vec4 a,b,c,d,e,f;
    	
    	// Base
    	gfrontColor = vec4(0,1,0,1);
    	a = modelViewMatrix * vec4(mi.x,mi.y-0.01,ma.z,1);
    	b = modelViewMatrix * vec4(ma.x,mi.y-0.01,ma.z,1);
    	c = modelViewMatrix * vec4(mi.x,mi.y-0.01,mi.z,1);
    	
    	vec3 n = normalMatrix * vec3(0,1,0);
    	if(dot(vec4(n,1),a) < 0){
        	gl_Position = projectionMatrix * a; EmitVertex();
        	gl_Position = projectionMatrix * b; EmitVertex();
        	gl_Position = projectionMatrix * c; EmitVertex();
        	gl_Position = modelViewProjectionMatrix * vec4(ma.x,mi.y-0.01,mi.z,1); EmitVertex();
        	EndPrimitive();
    	}
    	
    	// Esquerra
    	gfrontColor = vec4(1,0,0,1);
    	a = modelViewMatrix * vec4(mi.x-0.01,mi.y,mi.z,1);
    	b = modelViewMatrix * vec4(mi.x-0.01,mi.y,ma.z,1);
    	c = modelViewMatrix * vec4(mi.x-0.01,ma.y,mi.z,1);
    	
    	n = normalMatrix * vec3(1,0,0);
    	if(dot(vec4(n,1),a) < 0){
        	gl_Position = projectionMatrix * a; EmitVertex();
        	gl_Position = projectionMatrix * b; EmitVertex();
        	gl_Position = projectionMatrix * c; EmitVertex();
        	gl_Position = modelViewProjectionMatrix * vec4(mi.x-0.01,ma.y,ma.z,1); EmitVertex();
        	EndPrimitive();
    	}
    	
    	// Dreta
    	gfrontColor = vec4(1,0,0,1);
    	a = modelViewMatrix * vec4(ma.x+0.01,mi.y,mi.z,1);
    	b = modelViewMatrix * vec4(ma.x+0.01,mi.y,ma.z,1);
    	c = modelViewMatrix * vec4(ma.x+0.01,ma.y,mi.z,1);
    	
    	n = normalMatrix * vec3(-1,0,0);
    	if(dot(vec4(n,1),a) < 0){
        	gl_Position = projectionMatrix * a; EmitVertex();
        	gl_Position = projectionMatrix * b; EmitVertex();
        	gl_Position = projectionMatrix * c; EmitVertex();
        	gl_Position = modelViewProjectionMatrix * vec4(ma.x+0.01,ma.y,ma.z,1); EmitVertex();
        	EndPrimitive();
    	}
    	
    	
    	// Darrere
    	gfrontColor = vec4(0,0,1,1);
    	a = modelViewMatrix * vec4(mi.x,mi.y,mi.z-0.01,1);
    	b = modelViewMatrix * vec4(ma.x,mi.y,mi.z-0.01,1);
    	c = modelViewMatrix * vec4(mi.x,ma.y,mi.z-0.01,1);
    	
    	n = normalMatrix * vec3(0,0,1);
    	if(dot(vec4(n,1),a) < 0){
        	gl_Position = projectionMatrix * a; EmitVertex();
        	gl_Position = projectionMatrix * b; EmitVertex();
        	gl_Position = projectionMatrix * c; EmitVertex();
        	gl_Position = modelViewProjectionMatrix * vec4(ma.x,ma.y,mi.z-0.01,1); EmitVertex();
        	EndPrimitive();
    	}
    
    	

    	
    	
    	
    	
    	
    }
}
