var camera = view_get_camera(0)

lighting = -1


_color[0] = 180
_color[1] = 150
_color[2] = 255

camera_apply(camera)

shader = ShLighting
uCol = shader_get_uniform(ShLighting,"col")

color_mix	 = -1

color[0,0]	 = NaN

key_previous = -1

key_next	= -1




//parametros:R	  G		B   
 AddKeytime(010, 070, 200)// ?hrs	
 
 AddKeytime(010, 070, 200)// ?hrs	
  
 AddKeytime(010, 070, 200)// ?hrs	
 
 keytimes = array_length(color[0])