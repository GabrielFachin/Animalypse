if instance_exists(oPauseControl){
image_speed = 0
exit
}
else
image_speed = global.total_game_spd


x = oPlayer.x 
y = oPlayer.y +1
direction = point_direction(x,y,mouse_x,mouse_y)

 
 
 //better weapon recoil 
 if ammo !=0
 {
 _xx = x-lengthdir_x(current_recoil,direction)
  _y  = y-lengthdir_y(current_recoil,direction)
 
 
 CurvePos += CurveSpd
 
 //change the gun angle
 
 var curve = animcurve_get(WeaponRecoil)
 
 var channel = animcurve_get_channel(curve,"Angle")
 
 var angvalue = animcurve_channel_evaluate(channel,CurvePos)
 
 _ImgAngle = image_angle - (offset +  (angvalue *sign(image_yscale)))
 
 
 var channel = animcurve_get_channel(curve,"x")
 
 var xvalue = animcurve_channel_evaluate(channel,CurvePos)
 
 _x = _xx - lengthdir_x(xvalue,CurvePos)
 
 if CurvePos >= 1
 {
	 CurveSpd = 0
	 CurvePos = 0
 }
}
else
{
_ImgAngle = direction
_x = oPlayer.x 
 _y = oPlayer.y +1
}
 
if direction > 90 and direction < 270
{
image_yscale = -1
}
else
image_yscale = 1

image_angle = direction
image_xscale = -1

var reload = keyboard_check_pressed(ord("R")) 


if automatic
click = mouse_check_button(mb_left)
else
click = mouse_check_button_pressed(mb_left)

if click{
if current_cd = 0
{
oCursor.image_index = 1
current_cd = cooldown
current_delay = startup
}
}

if current_cd = 0
oCursor.image_index = 0

#region upgrades

if current_delay = 0 and projectile != -1 and oPlayer.state != State.Dashing
{
	if ammo != 0
	{
		oPlayer.alarm[5] = oPlayer.recoil_duration
		alarm[1] = 1
		 offset = random_range(-4,4)
		
		for (var i = -Projectiles_amount / 2 ; i < Projectiles_amount / 2; i++)
		{
		var __x = lengthdir_x(length,_ImgAngle)
		var  __y = lengthdir_y(length,_ImgAngle)
		
		
		with(instance_create_layer(x +__x , y +__y, "Projectiles",projectile))
		{
		oPlayer.light = true
		oPlayer.alarm[2] = oPlayer.lightduration
		direction = other._ImgAngle + i  * 5
		image_angle = other._ImgAngle
		speed = other.bulletspeed
		image_yscale = other.projectile_size
		image_xscale = other.projectile_size
		}
		
		with(oCamera)
		event_user(0)
		
		
		
		//// cria um projetil fantasma de dentro da arma pra afetar inimigos que passarem do spawn da bala original
		//with(instance_create_layer(x , y, "Projectiles",projectile))
		//{
		//visible = false
		//radius = 0
		//travelled_distance = oWeapon.range  
		//direction = other._ImgAngle + i  * 5
		//image_angle = other._ImgAngle
		//speed = other.bulletspeed
		//image_yscale = other.projectile_size
		//image_xscale = other.projectile_size
		//}
		
		var __x = -lengthdir_x(length + 10,_ImgAngle)
		var  __y = -lengthdir_y(length + 10,_ImgAngle)
		
		
	with instance_create_layer(x + __x , y +__y, "Instances",oBulletShell)
	{
	direction = other._ImgAngle - 180
	xdist = random_range(0,20) * sign(__x)
	ydist = random_range(0,10) * sign(__y)
	}

}
	ammo --
	
	CurveSpd = tot_CurveSpd
	
	
	if Focused_Shots > 0
	Focused_Shots --
 }
  	 
	 current_recoil = recoil
}


#endregion

current_delay = max(-1,current_delay-1)

if current_delay = -1
current_cd = max(0,current_cd-1)

current_recoil = max(0,floor(current_recoil*0.8))

if reload and alarm[0] = -1
{
	ammo = 0
	alarm [0] = reload_time
	Focused_Shots = Tot_Focused_Shots
}

if Focused_Shots > 0
global.damage_multiplier = focus_multiplier
else
global.damage_multiplier = 1

depth = -oPlayer.y - 10