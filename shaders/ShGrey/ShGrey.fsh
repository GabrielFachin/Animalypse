//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float intensity;

void main()
{
	vec4 main = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec3 NewColour = main.rgb * intensity;
	
    gl_FragColor = vec4(NewColour,main.a);
}
