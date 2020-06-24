#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec3 N;
in vec2 vtexCoord;
in vec3 vert;

in vec4 gl_FragCoord;
uniform mat4 modelViewProjectionMatrixInverse;
uniform sampler2D noise;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;

vec2 texCoord;
vec4 marbleColor = vec4(0.5,0.2,0.2,1.0);
vec4 white = vec4(1,1,1,1);

vec4 shading(vec3 N, vec3 Pos, vec4 diffuse);

void main(){
	//Paso a Object Space el Frag Coord
	vec4 fragCoordOS = modelViewProjectionMatrixInverse * gl_FragCoord;
	
	// Calculo els plans S i T
	vec4 plaS = 0.3*vec4(0,1,-1,0);
	vec4 plaT = 0.3*vec4(-2,-1,1,0);
	
	// Calculo les noves coordenades s i t
	texCoord.x = plaS.x*vert.x + plaS.y*vert.y + plaS.z*vert.z + plaS.w*1.0;
	texCoord.y = plaT.x*vert.x + plaT.y*vert.y + plaT.z*vert.z + plaT.w*1.0;
	
	// Calculo el noiseColor que toca en el fragment
	vec4 noiseColor = texture(noise,texCoord);
	
	// mira quant de vermell tinc. Valor de [0 a 1].
	float v = texture(noise,texCoord).x;
	
	vec4 color;
	
	if(v <= 0.5) color = mix(white,marbleColor,2*v);
	else color = mix(marbleColor,white,2*(v-0.5));
	
	
	vec4 Pos = modelViewMatrix*vec4(vert,1.0);
	
	vec3 NEyeSpace = normalMatrix * N;

    fragColor = shading(NEyeSpace,Pos.xyz,color);
}



vec4 shading(vec3 N, vec3 Pos, vec4 diffuse) { 
	vec3 lightPos = vec3(0.0,0.0,2.0);
	vec3 L = normalize( lightPos - Pos );
	vec3 V = normalize( -Pos);
	vec3 R = reflect(-L,N);
	float NdotL = max( 0.0, dot( N,L ) ); 
	float RdotV = max( 0.0, dot( R,V ) ); 
	float Ispec = pow( RdotV, 20.0 ); 
	return diffuse * NdotL + Ispec;
}
