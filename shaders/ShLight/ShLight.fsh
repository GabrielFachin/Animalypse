varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//varying vec4  FragColor;

uniform vec3 rgbmult;
float rmult = rgbmult.r;
float bmult = rgbmult.b;
float gmult = rgbmult.g;

uniform sampler2D lighting;
void main( )
{
    vec4 mult = texture2D(lighting, v_vTexcoord);
    vec4 main = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 finalcol;
	vec4 lightcol;
	

	lightcol.r = mult.r * rmult; //3
	lightcol.b = mult.b * gmult; //3
	lightcol.g = mult.g * bmult; //3



	finalcol.r = mix(main.r,main.r*lightcol.r,main.r);
	finalcol.g = mix(main.g,main.g*lightcol.g,main.g);
	finalcol.b = mix(main.b,main.b*lightcol.b,main.b);
	finalcol.a = 1.;

	float darkness = .7; //.7

	finalcol.r = mix(finalcol.r,finalcol.r*darkness,1.-main.r);
	finalcol.g = mix(finalcol.g,finalcol.g*darkness,1.-main.g);
	finalcol.b = mix(finalcol.b,finalcol.b*darkness,1.-main.b);
            
    gl_FragColor = finalcol;
} 

