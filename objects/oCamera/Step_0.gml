var resizek = keyboard_check_pressed(ord("F"))

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


camera_set_view_pos(view_camera[0], x-(global.cmw*0.5), y-(global.cmh*0.5))

camera_set_view_size(view_camera[0],global.cmw,global.cmh)

global.cameratop = x + global.cmw / 2
global.camerabottom = x - global.cmw / 2
global.cameraright = x + global.cmh / 2
global.cameraleft = x - global.cmh / 2

if keyboard_check_pressed(vk_escape)
{
global.totaldamage = 0
}

if resizek 
{
	if window_get_fullscreen()
	window_set_fullscreen(false)
	else
	window_set_fullscreen(true)
}

if keyboard_check_pressed(vk_up)
{
switch global.windowH
{
	case 720:
	global.windowW = 1920 ; global.windowH = 1080; break;
	case 1080:
	global.windowW = 640 ; global.windowH = 360 ; break
	case 360:
	global.windowW = 1280; global.windowH = 720; break;
}
window_set_size(global.windowW,global.windowH)
window_set_position(global.displayW/2 - global.windowW/2, global.displayH/2 - global.windowH/2)
}
