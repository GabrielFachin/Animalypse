#region pause

ps = keyboard_check_pressed(vk_escape)

if ps and global.levelup = false
Pause()


if global.pause = true{
image_speed = 0
exit
}
else
image_speed = global.total_game_spd


#endregion

var uk = keyboard_check(ord("W"))
var lk = keyboard_check(ord("A"))
var dk = keyboard_check(ord("S"))
var rk = keyboard_check(ord("D"))
var dshk = keyboard_check_pressed(vk_space)

 hm = rk - lk
 vm = dk - uk
 
 if hm!= 0
 truehm = hm
 

if state != State.Dashing
{
if hm != 0 or vm != 0
state = State.Walking
else if hm = 0 and vm = 0
state = State.Idle
}

if dshk and alarm[3] = -1 and alarm[4] = -1 and mv != 0
state = State.Dashing


switch oWeapon.weapon 
{
             case ActualWeapon.Fists :
			 {
				                            switch state
											{
												case State.Idle :
												{
													if  image_index >= idle1_end or image_index < idle1_start
													image_index = idle1_start
													break
												}
												
												case State.Walking :
												{
													if  image_index >= walking1_end or image_index < walking1_start
													image_index = walking1_start
													break
												}
												
												case State.Dashing :
												{
													//
													//
													break
												}
												
												
											}
											break
											
				 
		      break
			 }
							 
		 	case ActualWeapon.Pistol :
		    {
			   switch state
											{
												case State.Idle :
												{
													if  image_index >= idle2_end or image_index < idle2_start
													image_index = idle2_start
													break
												}
												
												case State.Walking :
												{
												if  image_index >= walking2_end or image_index < walking2_start
													image_index = walking2_start
													break
												}
												
												case State.Dashing :
												{
													if  image_index >= dash_end or image_index < dash_start
													image_index = dash_start
													if !OnDash
													{
													IsHit = true
													OnDash = true
													alarm[3] = dash_duration
													}
													break
												}
												
												
											}
											break
			
			 break
			 }
							 
			 case ActualWeapon.Shotgun :
			 {
			   switch state
											{
												case State.Idle :
												{
													if  image_index >= idle3_end or image_index < idle3_start
													image_index = idle3_start
													break
												}
												
												case State.Walking :
												{
													if  image_index >= walking3_end or image_index < walking3_start
													image_index = walking3_start
													break
												}
												
												case State.Dashing :
												{
													//
													//
													break
												}
												
												
											}
											break
			
			break
		      }
							 
		    case ActualWeapon.Rifle :
		    {
		 	  switch state
											{
												case State.Idle :
												{
													if  image_index >= idle3_end or image_index < idle3_start
													image_index = idle3_start
													break
												}
												
												case State.Walking :
												{
													if  image_index >= walking3_end or image_index < walking3_start
													image_index = walking3_start
													
													break
												}
												
												case State.Dashing :
												{
												var	_dsh_dur = room_speed / dash_duration
												var _dsh = _dsh_dur * (dash_end - dash_start)
												var _alarm = 0
													if !OnDash
													{
													 sprite_set_speed(sMainCharacter,_dsh,spritespeed_framespersecond)	
													image_index = dash_start	
													IsHit = true
													OnDash = true
													alarm[3] = dash_duration
													}
												  image_xscale = sign(hm)
												  if hm = 0
												  image_xscale = sign(vm)
												  
												  
												  //alarm 3 pause roll
												  
												  
												  if !global.pause
												  _alarm = alarm[3]
												  else
												  {
												  alarm[3] = _alarm
												  }
												  
													break
												}
												
												
											}
											break
		 	
			break
	   	  }
							 
	       	 case ActualWeapon.Knife :
			 {
			   switch state
											{
												case State.Idle :
												{
													if  image_index >= idle2_end or image_index < idle2_start
													image_index = idle2_start
													break
												}
												
												case State.Walking :
												{
													if  image_index >= walking2_end or image_index < walking2_start
													image_index = walking2_start
													break
												}
												
												case State.Dashing :
												{
													//
													//
													break
												}
												
												
											}
											break
		    
		   break
		   }
							 
			case ActualWeapon.Katana :
			 {
				  switch state
											{
												case State.Idle :
												{
												if  image_index >= idle3_end or image_index < idle3_start
													image_index = idle3_start
													break
												}
												
												case State.Walking :
												{
													if  image_index >= walking3_end or image_index < walking3_start
													image_index = walking3_start
													break
												}
												
												case State.Dashing :
												{
													//
													//
													break
												}
												
												
											}
											break
				 
			 break
			 }

break
}





direction = point_direction(x,y,mouse_x,mouse_y)

if direction > 90 and direction < 270
image_xscale = -1
else 
image_xscale = 1

if state = State.Dashing
image_xscale = sign(truehm)

var mv_dir = point_direction(x,y, x+hm, y +vm)

if vm != 0 or hm != 0
mv = mv_spd
else
mv = 0


hm = lengthdir_x(mv,mv_dir)
vm = lengthdir_y(mv,mv_dir)



if state = State.Dashing
{
	hm = lengthdir_x(dsh_spd,dash_dir)
	vm = lengthdir_y(dsh_spd,dash_dir)
}
else
dash_dir = mv_dir

if alarm[5] != -1
{
hm -= lengthdir_x(oWeapon.self_recoil_push, oWeapon._ImgAngle)
vm -= lengthdir_y(oWeapon.self_recoil_push, oWeapon._ImgAngle)
}


if instance_exists(oEnemyG)
{

var _dir = point_direction(x,y,oEnemyG.x,oEnemyG.y)

if state != State.Dashing
{
if place_meeting(x,y + vm,oEnemyG) 
{
var _vdir = lengthdir_x(oEnemyG.knockback,_dir)
vm =  -_vdir
}




if place_meeting(x + hm,y,oEnemyG) 
{
var _hdir = lengthdir_x(oEnemyG.knockback,_dir)	
hm = -_hdir
}
}

if place_meeting(x,y+vm,oCollision){
	while !place_meeting(x,y + sign(vm),oCollision){
	y += sign(vm)
	}
vm = 0
}
}

if place_meeting(x + hm,y,oCollision){
	while !place_meeting(x + sign(hm),y,oCollision){
		x += sign(hm)
	}
hm = 0
}


if hp <= 0
game_end()

y += vm
x += hm
