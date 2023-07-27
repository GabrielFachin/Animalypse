surface_set_target(lighting)


gpu_set_blendmode_ext(bm_dest_color,bm_zero)
draw_surface_stretched(application_surface,0,0,window_get_width(),window_get_height())
gpu_set_blendmode(bm_normal)

surface_reset_target()


shader_set(ShLighting)
 
 var _tex = surface_get_texture(lighting)
 
 var _handle = shader_get_sampler_index(ShLighting, "lighting")
 
 texture_set_stage(_handle,_tex)
 

draw_surface(lighting,0,0) 

shader_reset()

