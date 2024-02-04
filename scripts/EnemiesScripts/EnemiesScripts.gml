function DeathSprite(_id,_sprite,_frame,_col,_duration,_strength)
{
	
var wid = window_get_width()

var hei = window_get_height()

var camera = view_get_camera(0)

var duration = _duration

var strength = _strength
	
	var surf = global.sur_corpses
	
		if !surface_exists(surf)
		surf = surface_create(wid,hei)
			else
			{
			camera_apply(camera)	
			 surface_set_target(surf)
			 shader_set(ShGrey)
			 shader_set_uniform_f(shader_get_uniform(ShGrey,"duration"),duration)
			 shader_set_uniform_f(shader_get_uniform(ShGrey,"strength"),strength)
			draw_sprite_ext(_sprite,_frame,_id.x,_id.y,1,1,1,_col,1)
			surface_reset_target()
			shader_reset()
			return(1)
			}
		 

	

	
	
	}
	
	
	

