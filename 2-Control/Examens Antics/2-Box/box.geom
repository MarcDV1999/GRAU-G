#version 330 core
        
layout(triangles) in;
layout(line_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMax;
uniform vec3 boundingBoxMin;
const float offset = 0.5;


void show(vec4 pos, vec4 color){
    pos = modelViewProjectionMatrix * pos;

    gfrontColor = color;
    gl_Position = pos;
	EmitVertex();
}


// Crear background 
void creaBackground(){
    
    float d = 1;
    float z = 0.999;
    	
    gfrontColor = vec4(1,0,0,1);
    
    gl_Position = modelViewProjectionMatrix * vec4(-d,-d,z,1); EmitVertex();
    gl_Position =  modelViewProjectionMatrix * vec4(d,-d,z,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(d,d,z,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(-d,d,z,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(-d,-d,z,1); EmitVertex();
    
    EndPrimitive();
    
}

void pintarBoundingBox(){
    vec3 max = boundingBoxMax;
    vec3 min = boundingBoxMin;
    
    vec3 A = vec3(min.x, min.y,max.z);
    vec3 B = vec3(max.x, min.y,max.z);
    vec3 C = vec3(min.x, max.y,max.z);
    vec3 D = vec3(max.x, max.y,max.z);
    vec3 E = vec3(min.x, min.y,min.z);
    vec3 F = vec3(max.x, min.y,min.z);
    vec3 G = vec3(min.x, max.y,min.z);
    vec3 H = vec3(max.x, max.y,min.z);
    
    gfrontColor = vec4(0,0,0,1);
    
    gl_Position = modelViewProjectionMatrix * vec4(A,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(C,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(D,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(B,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(A,1); EmitVertex();
    EndPrimitive();
    
    gl_Position = modelViewProjectionMatrix * vec4(B,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(D,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(H,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(F,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(B,1); EmitVertex();
    EndPrimitive();
    
    gl_Position = modelViewProjectionMatrix * vec4(E,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(G,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(H,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(F,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(E,1); EmitVertex();
    EndPrimitive();
    
    gl_Position = modelViewProjectionMatrix * vec4(E,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(A,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(C,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(G,1); EmitVertex();
    gl_Position = modelViewProjectionMatrix * vec4(E,1); EmitVertex();
    EndPrimitive();
    
}

void main( void ){
    
	for( int i = 0 ; i < 3 ; i++ ){
		vec4 color = vfrontColor[i];
		vec4 pos = gl_in[i].gl_Position;
		show(pos,color);
	}
	EndPrimitive();
    
    if (gl_PrimitiveIDIn == 0){
        creaBackground();
        pintarBoundingBox();
    }
}









