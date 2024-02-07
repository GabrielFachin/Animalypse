var wid = window_get_width()

var hei = window_get_height()

var camera = view_get_camera(0)

if !surface_exists(srf_lights)
{
	srf_lights = surface_create(wid,hei)
	tex_lights = surface_get_texture(srf_lights)
}
surface_set_target(srf_lights)

camera_apply(camera)

draw_clear(c_black)
gpu_set_blendmode(bm_add)
gpu_set_tex_filter(true)


		with(oPlayer)
		draw_sprite_ext(sLight1,-1,x,y,radius,radius,1,col,intensity)
		
		with(oEnemyG)
		draw_sprite_ext(sLight1,-1,x,y,radius,radius,1,col,intensity)
		
		with(oXP)
		draw_sprite_ext(sLight1,-1,x,y,radius,radius,1,col,intensity)
		
		with(oProjectile)
		draw_sprite_ext(sLight1,-1,x,y,radius,radius,1,col,intensity)
		
		with(oEProjectile)
		draw_sprite_ext(sLight1,-1,x,y,radius,radius,1,col,intensity)

		
		
		gpu_set_tex_filter(false); // optional
	gpu_set_blendmode(bm_normal);
surface_reset_target();


var _scale = window_get_width()/global.cmw

shader_set(shader)

shader_set_uniform_f_array(u_col, color_mix);

shader_set_uniform_f_array(u_con_sat_brt, con_sat_brt_mix);

texture_set_stage(s_lights,tex_lights)

draw_surface_ext(application_surface,
0 - (frac(oCamera.x) * _scale),
0 -(frac(oCamera.y) * _scale),
_scale,
_scale,
0,
c_white,
1.0)

shader_reset()
