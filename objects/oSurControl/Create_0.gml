var camera = view_get_camera(0)

lighting = -1

camera_apply(camera)

shader = ShLighting

u_col			= shader_get_uniform(shader, "col");

u_con_sat_brt	= shader_get_uniform(shader, "con_sat_brt");

s_lights = shader_get_sampler_index(shader,"lights")
tex_lights = -1
srf_lights = -1




color_mix		= -1;
color[0,0]		= NaN;

con_sat_brt_mix	= -1;

key_previous	= -1;
key_next		= -1;



//parametros:	R		 G		  B		con		sat		brt    moonS  minB 
AddKeytime(220,	120,	225,	0.60,	1.00,  -0.2,	0.80,	0.45);	// 00h
AddKeytime(040,	125,	215,	0.65,	0.90,  -0.20,	0.70,	0.65);	// 02h
AddKeytime(080,	080,	185,	0.80,	0.60,  -0.15,	0.20,	0.80);	// 04h
AddKeytime(125,	070,	175,	1.00,	0.85,  -0.10,  -0.50,	0.60);	// 06h
AddKeytime(160,	145,	100,	1.20,	0.65,  -0.03,	0.00,	1.00);	// 08h
AddKeytime(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 10h
AddKeytime(128,	128,	128,	1.20,	0.85,	0.05,	0.00,	1.00);	// 12h
AddKeytime(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	1.00);	// 14h
AddKeytime(140,	130,	120,	1.10,	0.80,	0.00,	0.00,	1.00);	// 16h
AddKeytime(145,	120,	090,	1.10,	0.75,	0.00,	0.00,	1.00);	// 18h
AddKeytime(150,	060,	190,	1.25,	0.70,  -0.05,  -0.50,	0.60);	// 20h
AddKeytime(080,	080,	185,	0.80,	0.60,  -0.15,	0.20,	0.80);	// 22h
  
  
  //minB = brilho minimo do pixel pra ser afetado pela ''luz da lua''
  
  //moonS = força do brilho
 
 keytimes = array_length(color)