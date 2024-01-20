surface_set_target(lighting)

shader_set_uniform_f_array(uCol,color_mix)

var _scale = window_get_width()/global.cmw

gpu_set_blendmode_ext(bm_dest_color,bm_zero)


draw_surface_ext(application_surface,
0 - (frac(oCamera.x) * _scale),
0 -(frac(oCamera.y) * _scale),
_scale,
_scale,
0,
c_white,
1.0)



gpu_set_blendmode(bm_normal)

surface_reset_target()


shader_set(ShLighting)
 
 var _tex = surface_get_texture(lighting)
 
 var _handle = shader_get_sampler_index(ShLighting, "lighting")
 
 texture_set_stage(_handle,_tex)
 

draw_surface(lighting,0,0) 

shader_reset()

