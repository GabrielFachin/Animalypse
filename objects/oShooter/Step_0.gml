
//state machine
switch state
{
	
		
		case enemystate.chasing:
	{
		//updates pathfinding
    	target = oPlayer
		
		CheckTargetCol(TriggerAttack,noone) //triggers attack state
		 UpdateTargetPos(offset,OffsetDist)
		 AllyCollisionPush()
		
 
 
		PathTimer  =     	RunTimerWReset(PathTimer,pathdelay,pathfind,noone)
		AttackcdTimer = RunTimer(AttackcdTimer)
		 
	 
	image_speed = 1
	
	
	//keeps the animation looping 
	LoopAnimation(walkstart,walkend)
		 
		break}
	
		
		
					case enemystate.attacking:
	{ 
		//stops pathfinding
		target = noone
		
			//stops movement
			 UpdatePos(0,0)
		
			//starts attack sequence 
			SingleAttackSequence(attackstart,attackduration)
			
		AttackStateTimer=	RunTimerWReset(AttackStateTimer,attackduration,AttackReset,noone)
		
		//sets the image speed to match attack duration
		FitAnimationSpeed(attackduration,attackstart,attackend)

	   //if on the ''damaging'' frame
		if floor (image_index >= attackstart +1)
		CreateHitbox(0,0,dmg,10,knockback,id,1,1)
			   
		break}
	
	
		
			case enemystate.hit:
	{ 
		//stops the animation, keeps the xscale the same as before getting hit
		image_speed = 0
		
		IsHit = true
		
		//stunlocks 
		AttackcdTimer = attackcooldown
		
		//knockback
		var len = oWeapon.recoil_push
		UpdatePos(-len,dir)
		
		
		HitTimer = RunTimerWReset(HitTimer,hitduration,HitReset,defaultstate)
		
		//starts dying state
		if hp <= 0
		DyingState()

		
		
		break}
	
	
	
		case enemystate.dying:
	{
		IsHit = false 
		
		UpdatePos(0,0)
		
		//changes animation speed and deletes hitbox
		image_speed = 0.8 //0.8
		DeleteHitbox()
		
		//delete lighting
		radius = 0
		
		//starts death animation
		LoopAnimation(deathstart,deathend)
		
		//if the animation ended
		if floor(image_index) = deathend
		{
		for (var i = 0 ; i < xpdrop; i++){
			
	     rarity = RandomizeUncertain(array) //get xp rarity 
		GetXpDrops(rarity,pool,id)	//spawns xp
		}
		DeathManager(sprite_index,deathend,darken,id,image_xscale) //create the dead sprite on the corpse surface
		}
		
		
		
		
		break}	
	
	
}

WallCollision()

//update location
x += hm
y += vm

depth = -y