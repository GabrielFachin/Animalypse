var camera = view_get_camera(0)

lighting = -1

camera_apply(camera)

shader = ShLighting

u_col			= shader_get_uniform(shader, "col");

u_con_sat_brt	= shader_get_uniform(shader, "con_sat_brt");

color_mix		= -1;
color[0,0]		= NaN;

con_sat_brt_mix	= -1;

key_previous	= -1;
key_next		= -1;



//parametros:R	  G		B   con		sat		brt    moonS  minB
 AddKeytime(010, 070, 200,	0.7,	0.6,	0.00,  3.50, 0.65);
 AddKeytime(010, 080, 220,	0.8,	0.9,	0.00, 2.00, 0.75);
 AddKeytime(220, 200, 175,	1.1,	1.3,	0.05, 0.80, 0.80);
 AddKeytime(245, 235, 190,	1.1,	1.1,	0.10, 0.00, 1.00);
 AddKeytime(255, 250, 230,	1.3,	0.9,	0.15, 0.00, 1.00);
 AddKeytime(250, 240, 200,	1.4,	1.1,	0.15, 0.00, 1.00);
 AddKeytime(215, 150, 165,	1.4,	1.3,	0.20, 0.80, 0.80);
 AddKeytime(010, 080, 220,	0.9,	0.9,	0.00, 2.00, 0.75);
  
  
  //minB = brilho minimo do pixel pra ser afetado pela ''luz da lua''
  
  //moonS = força do brilho
 
 keytimes = array_length(color)