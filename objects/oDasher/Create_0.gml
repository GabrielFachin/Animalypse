//Enumerators
event_inherited()




//Color config
intensity = 0.1 //0.1
col = make_color_rgb(200,200,200)
radius = 1 //0.1


//Corpse surf value
darken = 0.5

//Speed
tot_spd = 1.5
spd = tot_spd
pool = Tier.Common



//animation variables

//death animation
deathstart = 9
deathend = 10

//walk animation
walkstart = 0
walkend = 8


//amount of xp drops
minxp = 1
maxxp = 2


//hp
tot_hp = 10
hp = tot_hp


//dmg
tot_dmg = 10
dmg = tot_dmg


//set knockback dealt to player
knockback  = 2


//movement code
hm = 0
vm = 0


//amount of time to stay on the hit state
hitduration = 10

//hit variable to trigger hit state if possible
TryHit = false

//the enemy got hit with success
IsHit = false


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
alarm_set(1,codedelay)


//keeps track of the image xscale, so it doesn't change when hit
spriteside = image_xscale

//keeps track of the pathfinding update rate
newpath = false