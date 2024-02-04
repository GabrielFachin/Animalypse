if room = PauseRoom
{
	
	var _scale = window_get_width()/global.cmw
	
	surface_set_target(application_surface)
		if !surface_exists(pause_sur)
		{
	pause_sur = surface_create(global.windowW,global.windowH)
	buffer_set_surface(pause_sur_buffer,pause_sur,0)
		}
	else
	draw_surface(pause_sur,0,0)

	surface_reset_target()
	
draw_surface_ext(application_surface,
0,
0 ,
_scale,
_scale,
0,
c_white,
1.0)
}