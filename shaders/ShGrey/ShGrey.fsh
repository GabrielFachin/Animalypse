//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 main = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float average = ( main.r + main.g + main.b)  / 3.0;
	
	vec4 NewColour = vec4( average, average, average, main.a );
	
    gl_FragColor = NewColour;
}
