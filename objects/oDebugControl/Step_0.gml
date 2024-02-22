if keyboard_check_pressed(vk_f5)
global.debug = !global.debug

if mouse_check_button_pressed(mb_right) and global.debug
instance_create_layer(mouse_x,mouse_y,"Instances",oChaser)



if global.debug
{
show_debug_overlay(true,false,1,0.2)

if keyboard_check(vk_f7)
show_debug_message(".")

if keyboard_check_pressed(vk_f6)
global.pathdraw = !global.pathdraw

if keyboard_check_pressed(vk_f4)
oWeapon.damage = 100

if keyboard_check_pressed(vk_f3)
oWeapon.Projectiles_amount += 1

if keyboard_check_pressed(vk_f2)
oWeapon.projectile_size += 1

if keyboard_check_pressed(vk_f1)
oWeapon.bulletspeed += 1

}
else
show_debug_overlay(false)