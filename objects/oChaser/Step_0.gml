//updates target locations in case there's one
if target != noone
{
target_x = target.x
target_y = target.y
}

//state machine
switch state
{
	
		
		case enemystate.chasing:
	{
	image_speed = 1
	//keeps the animation looping 
	 if floor(image_index) >= walkend
	 image_index = walkstart
	 
	 //set the player as the target
	 target = oPlayer
	 
	 //changes sprites xscale to direction in case the new direction has already been set
	 if newpath 
	 if sign(hm) = 1
	image_xscale = -1
	else
	image_xscale = 1

	   newpath = false	
		break}
	
	
			case enemystate.hit:
	{ 
		//stops the animation, keeps the xscale the same as before getting hit
		image_speed = 0
		image_xscale = spriteside
		
		//stunlocks him
		alarm[3] = attackcooldown
		break}
		
		
					case enemystate.attacking:
	{ 
		//stops and play the attack animation
		hm = 0
		vm = 0
		
		//starts attack sequence
		if attacking = false
		{
			//sets the image speed to match attack duration
		_attack = attackduration / room_speed /10
		image_speed = (attackend - attackstart) / (room_speed * _attack)
		
		//sets sprite to the first frame of the attack and tells sequence has initiated
		image_index = attackstart
		attacking = true
		
		//sets the duration of the attack duration
		alarm[2] = attackduration
		}
	   //if on the ''damaging'' frame
		if floor (image_index >= attackstart +1)
		
		//deals damage in case the player isn't immune
		with(instance_create_depth(x,y,0,oDamageHitbox))
		{
		dmg = other.dmg
		duration =  10
		knockback = other.knockback
		}
		
	   
		break}
	
	
	
		case enemystate.dying:
	{
		//clears out hit tracking variables
		IsHit = false 
		
		//changes animation speed and deletes hitbox
		image_speed = 0.8 //0.8
		mask_index = sNoCollision
		
		//delete lighting
		radius = 0
		
		//starts death animation
		if floor(image_index) < deathstart
		image_index = deathstart	
		if floor(image_index) = deathend
		{
		for (var i = 0 ; i < xpdrop; i++){
			
	     rarity = RandomizeUncertain(array) - 1 //get xp rarity 
		GetXpDrops(rarity,pool,id)	//spawns xp
		}
		DeathManager(sprite_index,deathend,0.5,id,image_xscale) //create the dead sprite on the corpse surface
		}
		
		
		
		
		break}	
	
	
}

// in case trying to be hit, allows hit 
	if TryHit
	{
	TryHit = false	//no more trying to be hit
	IsHit = true  //starts hit sequence
	state = enemystate.hit 
	alarm[0] = hitduration //starts hit state duration alarm
	}

//starts dying state
if hp <= 0
{
state = enemystate.dying
alarm[0] = 500
alarm[1] = 500
alarm[2] = 500
alarm[3]  = 500
}

//update location if not dead
if state != enemystate.dying
{
x += hm
y += vm
}

depth = -y