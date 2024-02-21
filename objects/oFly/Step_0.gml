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
		
		break}
	
	
	
		case enemystate.dying:
	{
		//clears out hit tracking varialbes
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
state = enemystate.dying

//update location if not dead
if state != enemystate.dying
{
x += hm
y += vm
}


depth = -y