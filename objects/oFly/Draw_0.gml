DrawShadow(id,wid,hei,yoffset)

draw_self()

if IsHit
{
	shader_set(ShWhite)
	draw_self()
	shader_reset()
}

if global.debug = true
{
DrawPath()
draw_text(x,y - 30,state)
}