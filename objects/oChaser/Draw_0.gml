DrawShadow(id,wid,hei,yoffset,xoffset)

draw_self()

if IsHit
{
	shader_set(ShWhite)
	draw_self()
	shader_reset()
}

if global.debug = true 
{
draw_text(x,y - 30,offset)
}

if global.debug = true and global.pathdraw = true
DrawPath()