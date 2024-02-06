function DeathManager(sprite,index,intensity,entity)
{
	
	var wid = window_get_width()
	var hei = window_get_height()
	
if !surface_exists(global.CorpsesSurf)
global.CorpsesSurf = surface_create(wid,hei)
else
{
	
shader_set(ShGrey)
surface_set_target(global.CorpsesSurf)

var handler = shader_get_uniform(ShGrey,"intensity")

shader_set_uniform_f(handler,intensity)

draw_sprite(sprite,index,entity.x,entity.y)

surface_reset_target()

instance_destroy(entity)
shader_reset()


}
	
}


function Dash(damage,entity,distance,duration)
{
	



}