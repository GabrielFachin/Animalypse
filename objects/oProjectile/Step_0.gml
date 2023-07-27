if global.pause = true{
image_speed = 0
exit
}
else
image_speed = global.total_game_spd


if place_meeting(x,y,oCollision)
instance_destroy()
 
travelled_distance += oWeapon.bulletspeed
 
 if travelled_distance >= oWeapon.range
alpha -= 0.2

image_alpha = alpha


if alpha <= 0
instance_destroy()

