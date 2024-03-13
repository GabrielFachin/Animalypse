//state machine
switch state
{
	
		
		case enemystate.chasing: //preciso settar um offset no alvo em ambos os lados direito e esquerdo player, pelo menos se eu estiver na range melee(ou levemente menor, close range?) (pra poder morder)
	{
		//updates pathfinding
    	target = oPlayer
		
		 UpdateTargetPos(offset,OffsetDist)
		 AllyCollisionPush()
 
 
		PathTimer  =     	RunTimerWReset(PathTimer,pathdelay,pathfind,noone)
		AttackcdTimer = RunTimer(AttackcdTimer)
		BitecdTimer = RunTimer(BitecdTimer)
		 
	 
	image_speed = 1
	
	
	//keeps the animation looping 
	LoopAnimation(walkstart,walkend)
	WallCollision()
		 
		 if AttackcdTimer = 0
		CheckTargetSight(MediumDist,TriggerCharge,noone)
		
		
		if BitecdTimer = 0
		CheckTargetXYSight(CloseDist,MeleeDist,TriggerBite,noone)
		else if CheckTargetSight(MeleeDist,noone,noone)
			UpdatePos(0,0)
		
		 
		break}
	
	
	
	
	
	
			case enemystate.charging:
			{
				UpdatePos(0,0)
				UpdateTargetPos(0,0)
				
				image_speed = 0.8
				
				if floor(image_index) = chargeend 
				image_index = chargeend
				
		   	ChargeStateTimer = RunTimerWReset(ChargeStateTimer,ChargeDuration,TriggerAttack,noone)
				
				
				
				
				
			break}
		
		
		case enemystate.bite:
		{
			
			
			FitAnimationSpeed(BiteDuration,bitestart,biteend)

			
			UpdatePos(0,0)
			
			BiteTimer = RunTimerWReset(BiteTimer,BiteDuration,BiteReset,noone)
			
			if floor(image_index) = biteend - 2
			CreateHitbox(image_xscale * 25,0,dmg / 2,2,knockback,id,1.2,1)
			
			
			break}
			
			
			
			
			
		
		
		
					case enemystate.dashing:
	{ 
		//stops pathfinding
		target = noone
		HitState = noone
		CanBeHit(false)
		
			//dashes
			 UpdatePos(dashspeed,dashdir)
			 
			 	UpdateSpriteDir()
				
				SingleAttackSequence(dashstart,attackduration)
				
				FitAnimationSpeed(attackduration,dashstart,dashend)
			 
			 //pushes nearby allies
			 AllyCollisionPush()
					
		AttackStateTimer=	RunTimerWReset(AttackStateTimer,attackduration,AttackReset,noone)
		

		contactdamage = true
		
		CheckWallCollision(AttackReset,noone)
		WallCollision()
					   
		break}
	
	
	
	
	
	
		
			case enemystate.hit:
	{ 
		//stops the animation, keeps the xscale the same as before getting hit
		image_speed = 0
		
		IsHit = true
		
		//starts death state
			if hp <= 0
			DyingState()
		
		//knockback
		var len = oWeapon.recoil_push
		UpdatePos(-len,dir)
		
		BitecdTimer = bitecooldown
		
		
		HitTimer = RunTimerWReset(HitTimer,hitduration,HitReset,defaultstate)
		WallCollision()

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




//update location
x += hm
y += vm

depth = -y