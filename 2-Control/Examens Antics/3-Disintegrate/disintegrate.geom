#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 n[];
in vec3 v[];

out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;
uniform float speed = 0.4;

void show(vec4 pos, vec4 color){
    pos = modelViewProjectionMatrix * pos;
    
    gfrontColor = color;
    gl_Position = pos;
	EmitVertex();
}


void main( void ){
	vec3 mitjaNormal = (n[0]+n[1]+n[2])/3;
	vec3 baricentre = (v[0]+v[1]+v[2])/3;
	int grup; 
	float move;
	
	grup = (17 * gl_PrimitiveIDIn + 19) % 10;
	move = (time-grup)/4;
    
    if (move <= 0){
        move = pow(move,2);
	    for( int i = 0 ; i < 3 ; i++ ){
	        // Movem direccio normal
		    vec3 newPunt = v[i];
		    show(vec4(newPunt,1),vfrontColor[i]);
		    
	    }
	    }
	else if(move >= 0 && move <= 1){
	    move = pow(move,2);
	    for( int i = 0 ; i < 3 ; i++ ){
	        // Movem direccio normal
		    vec3 newPunt = v[i]+(baricentre-v[i]+mitjaNormal)*move;
		    show(vec4(newPunt,1),vfrontColor[i]);
		    
	    }
	}

	
	
    EndPrimitive();
    
    
    
    
}
