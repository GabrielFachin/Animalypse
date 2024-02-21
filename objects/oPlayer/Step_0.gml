#region pause

ps = keyboard_check_pressed(vk_escape)


//pauses game in case player is not leveling up
if ps and global.levelup = false and alarm[6] = -1
{
global.pause = true
//creates pause manager
instance_create_depth(x,y,0,oPauseControl)
}

#endregion

//changes sprite according to weapon
switch oWeapon.wield {
	
//case fists
case Wield.Fists: var idle_start = idle1_start var idle_end = idle1_end
var walkstart = walking1_start var walkend = walking1_end break

//case single hand
case Wield.SingleHand: var idle_start = idle2_start var idle_end = idle2_end
var walkstart = walking2_start var walkend = walking2_end break


//case both hands
case Wield.BothHands: var idle_start = idle3_start var idle_end = idle3_end
var walkstart = walking3_start var walkend = walking3_end break
}

//gets idle starting sprite so i can set it on the dash end alarm
idlestart = idle_start

//movement
var uk = keyboard_check(ord("W"))
var lk = keyboard_check(ord("A"))
var dk = keyboard_check(ord("S"))
var rk = keyboard_check(ord("D"))
var dshk = keyboard_check_pressed(vk_space)

//gets wich direction is the player going to (right, left, up or down)
 hm = rk - lk
 vm = dk - uk
  

//creates a function so only choosen states can get the sprite dir
function GetSpriteDir()
{
 //gets mouse position and changes direction accordingly
 direction = point_direction(x,y,mouse_x,mouse_y)	
	
if direction > 90 and direction < 270
image_xscale = -1
else 
image_xscale = 1
}

//creates a function to check enemy collision
function CheckEnemyCollision()
{
	var ID = instance_place(x,y,oEnemyG) //checks if i'm getting any ID 
  if ID  //if i found something
  {	
 if ID.contactdamage = true and vulnerable
 {
   knockdir = point_direction(x,y,ID.x,ID.y)  //knockback direction 
   alarm[8] = HitDuration //Sets HIt state reset alarm
   vulnerable = false //turn on Iframes
	alarm[0] = ivulnerability //sets Iframe duration
	alarm[1] = 5
	oControl.hpcolor = c_red
	oControl.alarm[0] = oControl.hp_delay
	 state = State.Hit 
	 hp -= ID.dmg
	 knockamount = ID.knockback
  }
  }
}


//checks if the player hit an damaging hitbox
function ChecksHitboxCollision()
{
	if vulnerable
	{
	var ID = instance_place(x,y,oDamageHitbox) //checks if i'm getting any ID 
  if ID  //if i found something
  {
   knockdir = point_direction(x,y,ID.x,ID.y)  //knockback direction 
   alarm[8] = HitDuration //Sets HIt state reset alarm
   vulnerable = false //turn on Iframes
	alarm[0] = ivulnerability //sets Iframe duration
	alarm[1] = 5
	oControl.hpcolor = c_red
	oControl.alarm[0] = oControl.hp_delay
	 state = State.Hit 
	 hp -= ID.dmg
	 knockamount = ID.knockback
  }
}

}
 
 //gets direction player is moving towards
var mv_dir = point_direction(x,y, x+hm, y +vm) 

 
 show_debug_message(vulnerable)
 
  switch state
		{
			case State.Idle :
			{
				GetSpriteDir()
				CheckEnemyCollision()
				ChecksHitboxCollision()
				
				//switches sprite to idle animation
				if  floor(image_index) > idle_end
				image_index = idle_start
				
				//switches to the walking state
				if hm != 0 or vm != 0
				{
				//sets sprite to the first frame on the walk animation	
				image_index = walkstart
				state = State.Walking
				}
				break
			}
			
			case State.Walking :
			{
				GetSpriteDir()
				ChecksHitboxCollision()

								
				//if alarm[7] is ''off'' (last number that you can get, 1) create particles
				if alarm[7] = 1
				 WalkEffect(x+hm,y+8)
				 
				if  floor(image_index) > walkend
				image_index = walkstart	
				
				//switches to the idle state if no buttons are being pressed
				 if hm = 0 and vm = 0
				 {
				//sets sprite to the first frame on the idle animation
				image_index = idle_start	 
				state = State.Idle
				 }
				
				//moves towards said direction
				hm = lengthdir_x(mv_spd,mv_dir)
				vm = lengthdir_y(mv_spd,mv_dir)
				
				//checks enemy collision, and changes hm and vm in case of collision
				CheckEnemyCollision()

				//switches to the dashing state 
				 if dshk and alarm[4] = -1 
				 {
				
				//gets animation duration according to dash duration
				var	_dsh_dur = dash_duration / room_speed /10	 
				
				//changes image speed so it maches dash duration
			    image_speed =(dash_end - dash_start) / (room_speed * _dsh_dur)
				
				//sets sprite to the first dash frame
				image_index = dash_start	
				
				//starts dash state reset alarm
				alarm[3] = dash_duration
				
				//sets image direction
				if hm != 0
			  image_xscale = sign(hm)
				
				//changes particle flag variable
				stoppart = false
				
				//gets the direction of the dash based on the last direction the player moved
				dash_dir = mv_dir
				
				//finally switch states
				state = State.Dashing
				 }
				
				break
			}
			
			case State.Dashing :
			{
				
			//moves toward last pressed buttons	
			hm = lengthdir_x(dsh_spd,dash_dir)
			vm = lengthdir_y(dsh_spd,dash_dir)
											
			//cria particula no roll se o sprite estiver no 36 (tocando no chão)
			if floor(image_index) = 36 and stoppart = false
			{
			stoppart = true
			RollEffect(x,y + 10) 
			}
				
			break
	 	}
		
		case State.Hit :
		{
			image_speed = 0
			  hm = -lengthdir_x(knockamount,knockdir) 
			  vm =  -lengthdir_y(knockamount,knockdir)
			
			break
		}
		
}


//recoil da arma
if alarm[5] != -1
{	
hm -= lengthdir_x(oWeapon.self_recoil_push, oWeapon._ImgAngle)
vm -= lengthdir_y(oWeapon.self_recoil_push, oWeapon._ImgAngle)
}



if place_meeting(x,y+vm,oCollision){
	while !place_meeting(x,y + sign(vm),oCollision){
	y += sign(vm)
	}
vm = 0
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

depth = -y