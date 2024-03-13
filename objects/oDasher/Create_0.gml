//Enumerators
event_inherited()


//Corpse surf value
darken = 0.5

//Speed variable definitions

//spd variable on dynamic variables 
spd = tot_spd


pool = Tier.Common

//attack animation duration
attackduration = room_speed * 1

//sets an cooldown for the dash
attackcooldown = room_speed * irandom_range(6,9)

//sets an cooldown for the attack
bitecooldown = room_speed * irandom_range(1,2)

//sets an timer for the bite
BitecdTimer = bitecooldown

//sets attack range
attackrange = 120

//sets dash speed 
dashspeed = 7

//sets hit state on bullet collision
HitState = enemystate.hit

//animation variables

//death animation
deathstart = 27
deathend = 29

//walk animation
walkstart = 0
walkend = 5

//charge animation
chargestart =13
chargeend = 17

//dash animation
dashstart = 18
dashend = 24

//bite animation
bitestart = 6
biteend = 12

//chase offset
OffsetDist = 60

//hp variable on dynamic variables 
hp = tot_hp


//dmg variable on dynamic variables 
dmg = tot_dmg


//set knockback dealt to player
knockback  = 3


//movement code
hm = 0
vm = 0


//amount of time to stay on the hit state
hitduration = 10

//flag variables

//hit variable to trigger hit state if possible
TryHit = false

//the enemy got hit with success
IsHit = false

//keeps track of when the attack state starts, so we can change the sprite once to the attack sequence
attacking = false

//shadow script variables
wid = 1
hei = 1
yoffset = 17
xoffset = -4

//initialize target 
target = noone
target_x = noone
target_y = noone

//rarity (xp drop)

Cchance =70 //common chance 70
Uchance = 25 //Uncommon chance 25
Rchance = 5 //Rare chance 5


//initialize XP drop array with all of the xp chances
array = [Cchance,Uchance,Rchance]

state = enemystate.chasing

//set xp drops amount

xpmax = 3
xpmin = 1
xpdrop = irandom_range(xpmin,xpmax)

//set up pathfinding delay
alarm_set(1,pathdelay)

//keeps track of the image xscale, so it doesn't change when hit
spriteside = image_xscale

//gets if the enemy is ivulnerable 
_CanBeHit = true

//initiates HitTimer
HitTimer = hitduration

//initiates PathTimer
PathTimer = pathdelay

//attack cooldown
AttackcdTimer = attackcooldown


MeleeDist = 30

//bite state duration
BiteDuration = room_speed * 0.7

//bite timer
BiteTimer = BiteDuration

//atack duration
AttackStateTimer = attackduration

//charge duration
ChargeDuration = room_speed * 1.5

ChargeStateTimer = ChargeDuration 

defaultstate = enemystate.chasing

MinDist = 60


HitReset = function(defaultstate)
{
	
state = defaultstate	
IsHit = false	
	
}

offset = irandom_range(-50,50)

pathfind = function()
{
	FindPath(x,y,target_x,target_y)
	UpdateSpriteDir()
	
}

AttackReset = function()
{

attacking = false
contactdamage = false
state = enemystate.chasing
AttackStateTimer= attackduration
HitState = enemystate.hit
CanBeHit(true)

}
	
BiteReset = function()
{
	
	state = enemystate.chasing
	BitecdTimer = bitecooldown
	
}



TriggerCharge = function()
{
	
if oPlayer.OnDash = false 
{
state = enemystate.charging
AttackcdTimer = attackcooldown
image_index = chargestart
}

}

TriggerAttack = function()
{
	
	state = enemystate.dashing
	dashdir = point_direction(x,y,target_x,target_y)
	
}

TriggerBite = function()
{
	
	state = enemystate.bite
	BitecdTimer = BiteDuration
	image_index = bitestart
	UpdateSpriteDir()
	
}
