DrawShadow(id,wid,hei,yoffset)

draw_self()

if IsHit
{
	shader_set(ShWhite)
	draw_self()
	shader_reset()
}

if global.debug = true and global.pathdraw = true
{
DrawPath()
draw_text(x,y - 30,state)
draw_text(x,y-60,target_x)
}