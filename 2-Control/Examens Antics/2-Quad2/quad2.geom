#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMax;
uniform vec3 boundingBoxMin;
const float offset = 0.5;


void show(vec4 pos, vec4 color, int costat){
    pos = modelViewProjectionMatrix * pos;
    vec3 newPos = pos.xyz/pos.w;

    if (costat == 0){
        newPos.x -= offset; 
        newPos.y += offset; 
    }
    else if (costat == 1){
        newPos.x += offset; 
        newPos.y += offset; 
    }
    else if (costat == 2){
        newPos.x -= offset; 
        newPos.y -= offset; 
    }
    else if (costat == 3){
        newPos.x += offset; 
        newPos.y -= offset; 
    }
    gfrontColor = color;
    gl_Position = vec4(newPos,1);
	EmitVertex();
}


// Crear background 
void creaBackground(){
    
  	float offsetTerraY = 0.01;
    float d = 1;
    float z = 0.999;
    	
    gfrontColor = vec4(0,1,0,1);
    
    gl_Position = vec4(-d,0,z,1); EmitVertex();
    gl_Position =  vec4(0,0,z,1); EmitVertex();
    gl_Position = vec4(-d,d,z,1); EmitVertex();
    gl_Position = vec4(0,d,z,1); EmitVertex();
    
    EndPrimitive();
    gfrontColor = vec4(1,1,0,1);
    
    gl_Position = vec4(0,0,z,1); EmitVertex();
    gl_Position =  vec4(d,0,z,1); EmitVertex();
    gl_Position = vec4(0,d,z,1); EmitVertex();
    gl_Position = vec4(d,d,z,1); EmitVertex();
    EndPrimitive();
    
    gfrontColor = vec4(1,0,0,1);
    
    gl_Position = vec4(-d,0,z,1); EmitVertex();
    gl_Position =  vec4(0,0,z,1); EmitVertex();
    gl_Position = vec4(-d,-d,z,1); EmitVertex();
    gl_Position = vec4(0,-d,z,1); EmitVertex();
    EndPrimitive();
    
    gfrontColor = vec4(0,0,1,1);
    
    gl_Position = vec4(0,0,z,1); EmitVertex();
    gl_Position =  vec4(d,0,z,1); EmitVertex();
    gl_Position = vec4(0,-d,z,1); EmitVertex();
    gl_Position = vec4(d,-d,z,1); EmitVertex();
    EndPrimitive();
    
}

void main( void ){
    
	for( int i = 0 ; i < 3 ; i++ ){
		vec4 color = vfrontColor[i];
		vec4 pos = gl_in[i].gl_Position;
		show(pos,color,0);
	}
	EndPrimitive();
	
	for( int i = 0 ; i < 3 ; i++ ){
		vec4 color = vfrontColor[i];
		vec4 pos = gl_in[i].gl_Position;
		show(pos,color,1);
	}
	EndPrimitive();
	
	for( int i = 0 ; i < 3 ; i++ ){
		vec4 color = vfrontColor[i];
		vec4 pos = gl_in[i].gl_Position;
		show(pos,color,2);
	}
	EndPrimitive();
	
	for( int i = 0 ; i < 3 ; i++ ){
		vec4 color = vfrontColor[i];
		vec4 pos = gl_in[i].gl_Position;
		show(pos,color,3);
	}
    EndPrimitive();
    
    if (gl_PrimitiveIDIn == 0){
        creaBackground();

    }
}









