//Enumerators
event_inherited()


//Corpse surf value
darken = 0.5

//Speed variable definitions

//spd variable on dynamic variables 
spd = tot_spd


pool = Tier.Common

//attack animation duration
attackduration = room_speed * 0.5

//sets an cooldown for the attack
attackcooldown = room_speed * 2

//sets attack range
attackrange = 10


//animation variables

//death animation
deathstart = 4
deathend = 6

//walk animation
walkstart = 0
walkend = 3

//attack animation
attackstart = 7
attackend = 9


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
wid = 0.8
hei = 0.8
yoffset = 7

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

AttackcdTimer = attackcooldown

AttackStateTimer = attackduration

defaultstate = enemystate.chasing


HitReset = function(defaultstate)
{
	
state = defaultstate	
IsHit = false	
	
}


pathfind = function()
{
	
	FindPath(x,y,target_x,target_y)
	UpdateSpriteDir()
	
}
	

AttackReset = function()
{

attacking = false
state = enemystate.chasing
	
}
