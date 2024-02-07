if keyboard_check_pressed(vk_escape)
global.pause = false

if global.pause = false
{
	instance_activate_all()
	global.pause = false
	global.levelup = false
	instance_destroy()
	if pausescreen != undefined and pausescreen != -1
	sprite_delete(pausescreen)
}

show_debug_message(global.pause)