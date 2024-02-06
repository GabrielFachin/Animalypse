xTo = global.follow.x
yTo = global.follow.y



x+= (xTo - x)/20
y+= (yTo - y)/20


var hei = room_height

var wid = room_width

if global.inshop = false
{
x = clamp(x,320,wid - 320) //0 + 320, max - 320

y = clamp(y,180,hei - 180) // + 180, max - 180
}

if shaking
{
var _yshake_amount = choose(-shake_amount,shake_amount)
var _xshake_amount = choose(-shake_amount,shake_amount)
}
else
{
var _yshake_amount = 0
var _xshake_amount = 0
}


camera_set_view_pos(
view_camera[0],
floor(x-(global.cmw*0.5)) + _xshake_amount,
floor(y-(global.cmh*0.5)) + _yshake_amount	)

camera_set_view_size(view_camera[0],global.cmw,global.cmh)

