#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

const float areamax = 0.0005;
vec4 vermell = vec4(1,0,0,1);
vec4 groc = vec4(1,1,0,1);

void main( void ){
	
	vec3 v1 = (gl_in[1].gl_Position.xyz - gl_in[0].gl_Position.xyz);
	vec3 v2 = (gl_in[2].gl_Position.xyz - gl_in[0].gl_Position.xyz);
	
	vec3 pv = cross(v1, v2); // Producto vectorial
	float modulo = length(pv);	// Modulo
	float area = modulo/(3 * areamax);	// No tinc clar pq multiplico per 3
	
	vec4 color = mix(vermell, groc, area);
	
	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = color;
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();
}
