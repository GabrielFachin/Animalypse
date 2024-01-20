var wid = window_get_width()

var hei = window_get_height()

var camera = view_get_camera(0)	

if !surface_exists (lighting)
{
lighting= surface_create(wid,hei,surface_rgba16float)
}
else
{

surface_set_target(lighting)

camera_apply(camera)

draw_clear_alpha(night,1)

gpu_set_blendmode(bm_add)

 with(oPlayer)
 draw_circle_color(x,y,radius,col,c_black,false)
 
 with(oLight)
  draw_circle_color(x,y,radius,col,c_black,false)
  
   with(oXP)
  draw_circle_color(x-1.7,y-1.8,radius,col,c_black,false)
 
 
 gpu_set_blendmode(bm_normal)
 
 surface_reset_target()
 
}