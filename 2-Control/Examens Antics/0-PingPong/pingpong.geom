#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;
const float a = -9.8;
uniform float n = 1; // temps de caiguda lliure, en segons

vec4 gris = vec4(0.5,0.5,0.5,1.0);
float plaY = (0.5*a*(n*n))-1;

void Emit() {
    gl_Position.z /= 2.0;
    EmitVertex();
}

mat4 projectOntoPlane()
{
	vec3 light = vec3(4,10,-4);
	float A = 0;
	float B = 1;
	float C = 0;
	float D = -0.5*a*n*n+0.9;
	float s = -dot(vec4(-A,-B,-C,-D), vec4(light,1));	
	mat4 trans0 = mat4(1.0);
	mat4 trans1 = mat4(1.0); 
	trans0[3].xyz = light;	
	mat4 aux = mat4(vec4(s, 0, 0, -A), vec4(0, s, 0, -B), vec4(0, 0, s, -C), vec4(0));
	trans1[3].xyz = -light;
	return  trans0 * aux * trans1;
}


void show(vec3 pos){
    gl_Position = modelViewProjectionMatrix  * vec4(pos,1);
	Emit();
}


void pintarTerra(vec4 color){
    float d = 5;
    
    gfrontColor = color;
    
    gl_Position = modelViewProjectionMatrix * vec4(-d,plaY,d,1); Emit();
    gl_Position = modelViewProjectionMatrix * vec4(d,plaY,d,1); Emit();
    gl_Position = modelViewProjectionMatrix * vec4(-d,plaY,-d,1); Emit();
    gl_Position = modelViewProjectionMatrix * vec4(d,plaY,-d,1); Emit();
    	
}


void main( void ){
    vec3 pos; 
	for( int i = 0 ; i < 3 ; i++ ){
	    pos = gl_in[i].gl_Position.xyz;
		gfrontColor = vfrontColor[i];
		show(pos);
	}
    EndPrimitive();
    
	for( int i = 0 ; i < 3 ; i++ ){
	    pos = gl_in[i].gl_Position.xyz;
		gfrontColor = vec4(0);
		//pos.y = plaY+0.01;
		gl_Position = modelViewProjectionMatrix * projectOntoPlane() * vec4(pos,1);
	    Emit();
	}
    EndPrimitive();
    
    if (gl_PrimitiveIDIn == 0) pintarTerra(gris);
}
























