
if global.pause = true{
image_speed = 0
exit
}
else
image_speed = global.total_game_spd

#region sprite control (horizontal)

if state != enemystate.hit and state != enemystate.charging
{
if hm < 0
image_xscale = 1
else
image_xscale = -1

#endregion

}

#region collision(and attack)

if place_meeting(x,y,oEnemyG) and state != enemystate.dashing
{
	vm += random_range(-30,30)
	hm += random_range(-30,30)
}



if place_meeting(x,y + vm,oCollision) 
vm = 0


if place_meeting(x + hm,y,oCollision) 
hm = 0

if instance_exists(oPlayer) and place_meeting(x + hm,y,oPlayer){
  if !oPlayer.IsHit and do_contact_damage{
 oPlayer.hp -= contact_dmg * Edmg_multiplier
 oPlayer.IsHit = true
 oPlayer.alarm[0] = oPlayer.ivulnerability
 oPlayer.alarm[1] = 5
 oControl.hpcolor = c_red
 oControl.alarm[0] = oControl.hp_delay
  }

  
  if state != enemystate.dashing
hm = 0}

if instance_exists(oPlayer) and place_meeting(x,y + vm,oPlayer) { 
  if !oPlayer.IsHit and do_contact_damage{
 oPlayer.hp -= contact_dmg * Edmg_multiplier
 oPlayer.IsHit = true
 oPlayer.alarm[0] = oPlayer.ivulnerability
   oPlayer.alarm[1] = 5
 oControl.hpcolor = c_red
  oControl.alarm[0] = oControl.hp_delay
  }


 if state != enemystate.dashing
vm = 0}



#endregion

#region //time control
image_speed *= global.total_game_spd
hm *= global.total_game_spd 
vm *= global.total_game_spd

#endregion


x += hm
y += vm


#region death and xp

 var _amount = random_range(min_xp_drop,max_xp_drop) + oPlayer.xp_drop_bonus


if hp <= 0
{
	
	state = enemystate.dead
	
oPlayer.hp += oWeapon.lifesteal

global.Enemies --

global.Eliminated ++


for (var i = 0 ; i < _amount; i++){
	
	 var _xoffset = random_range(-20,20)
	 var _yoffset = random_range(-20,20)
	
RandomizeRarity(950,50,0,0,0)

GetXpDrops(rarity,self_pool)

var drop_value = drop.Value

var drop_sprite =  drop.Sprite

with instance_create_layer(x + _xoffset, y + _yoffset,"Instances",oXP)
{
value = drop_value

sprite_index = sXP

image_index = drop_sprite
}

}

DeathManager(sprite_index,image_index,darken,id)
}



#endregion