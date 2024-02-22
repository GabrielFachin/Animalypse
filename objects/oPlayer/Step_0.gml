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
case Wield.Fists:  idle_start = idle1_start  idle_end = idle1_end
 walkstart = walking1_start  walkend = walking1_end break

//case single hand
case Wield.SingleHand: idle_start = idle2_start idle_end = idle2_end
walkstart = walking2_start  walkend = walking2_end break


//case both hands
case Wield.BothHands:  idle_start = idle3_start  idle_end = idle3_end
 walkstart = walking3_start  walkend = walking3_end break
}

//gets idle starting sprite so i can set it on the dash end alarm


//puts player animation at first idle frame if it's the first time loading sprites
if firstloop
{
image_index = idle_start
firstloop = false
}

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
mv_dir = point_direction(x,y, x+hm, y +vm) 

  switch state
		{
			case State.Idle :
			{
				GetSpriteDir()
				CheckEnemyCollision()
				ChecksHitboxCollision()
				
				//switches sprite to idle animation
				LoopAnimation(idle_start,idle_end)	
				
				//switches to the walking state	
				if walking
				WalkState()
				
				break
			}
			
			case State.Walking :
			{
				GetSpriteDir()
				ChecksHitboxCollision()

								
				//if alarm[7] is ''off'' (last number that you can get, 1) create particles
				if alarm[7] = 1
				 WalkEffect(x+hm,y)
				 
				 //loops walking animation
				LoopAnimation(walkstart,walkend)
				
				//switches to idle state
				if stopped
				IdleState()
				
				//moves towards said direction (if walking works as a fix to a bug)
				if walking
				UpdatePos(mv_spd,mv_dir)
				
				//checks enemy collision, and changes hm and vm in case of collision
				CheckEnemyCollision()

				//switches to the dashing state if pressing dash key and dash is out of cooldown
				 if dshk and alarm[4] = -1 
				RollState()
					
				
				break
			}
			
			case State.Dashing :
			{
				
			//moves toward last pressed buttons	
			UpdatePos(dsh_spd,dash_dir)
											
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
			 UpdatePos(-knockamount,knockdir)
			
			break	}
		
}


//recoil da arma
if alarm[5] != -1
{	
hm -= lengthdir_x(oWeapon.self_recoil_push, oWeapon._ImgAngle)
vm -= lengthdir_y(oWeapon.self_recoil_push, oWeapon._ImgAngle)
}



//wall collision
WallCollision()


if hp <= 0
game_end()

y += vm
x += hm

depth = -y