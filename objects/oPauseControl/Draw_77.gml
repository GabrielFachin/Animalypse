var _scale = window_get_width()/global.cmw

var window_w = window_get_width()
var window_h = window_get_height()

var camera = view_get_camera(0)

var xview = camera_get_view_x(camera)
var yview = camera_get_view_y(camera)

var viewh = camera_get_view_height(camera)
var vieww = camera_get_view_width(camera)

	
if window_w and window_h > 0 
{
	if !sprite
	{

	if !surface_exists(PauseSurf) 
	{
		
	PauseSurf = surface_create(window_w,window_h)

	}

if !surface_exists(global.CorpsesSurf)
global.CorpsesSurf = surface_create(window_w,window_h)
else
{

surface_set_target(PauseSurf)
draw_surface(global.CorpsesSurf,0,0)
surface_reset_target()
}


if instance_exists(oSurControl)
{
if !surface_exists(oSurControl.srf_lights)
{
	srf_lights = surface_create(window_w,window_h)
	tex_lights = surface_get_texture(srf_lights)
}



shader_set(ShLighting)

shader_set_uniform_f_array(oSurControl.u_col, oSurControl.color_mix);

shader_set_uniform_f_array(oSurControl.u_con_sat_brt, oSurControl.con_sat_brt_mix);

texture_set_stage(oSurControl.s_lights,oSurControl.tex_lights)
}


if !copy
{
surface_copy(PauseSurf,0,0,application_surface)
copy = true
}

shader_reset()

pause_sprite = sprite_create_from_surface(PauseSurf,0,0,surface_get_width(PauseSurf),surface_get_height(PauseSurf),false,false,0,0)

sprite = true
	}
	pausescreen = draw_sprite_ext(pause_sprite,-1,0,0,_scale,_scale,0,c_white,1)

}






if surface_exists(PauseSurf)
surface_free(PauseSurf)


if !off
{
instance_deactivate_all(true)
if global.levelup
{
instance_activate_object(oControl)
instance_activate_object(oWeapon)
instance_activate_object(oPlayer)
instance_activate_object(oCursor)
instance_activate_object(oCamera)
instance_activate_object(oCollision)
instance_activate_object(oSurControl)
}
off = true
}

