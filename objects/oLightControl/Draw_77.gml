if !surface_exists(srf_lights)
{
	srf_lights = surface_create(window_get_width(),window_get_height())//rgb_16format
	tex_lights = surface_get_texture(srf_lights)
}
surface_set_target(srf_lights)

draw_clear(c_black)
gpu_set_blendmode(bm_add)
gpu_set_tex_filter(true)


var lights_strength = 1

	var vx = camera_get_view_x(view_camera[0]);
	var vy = camera_get_view_y(view_camera[0]);
	with(oLightPar)
		draw_sprite_ext(sprite_index, image_index, x - vx, y - vy, image_xscale, image_yscale, image_angle, image_blend, image_alpha * lights_strength);
		
		with(oPlayer)
		draw_sprite_ext(sLight1,-1,x,y,0.5,0.5,1,c_white,1)
		
		
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
