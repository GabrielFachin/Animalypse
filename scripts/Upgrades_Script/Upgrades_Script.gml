function Upgrades(Selected)
{

if oWeapon.weapon = ActualWeapon.Rifle	
{
	
if Selected = "Projectiles ++"
oWeapon.Projectiles_amount ++

if Selected = "Damage ++" 
oWeapon.damage *= 1.2

if Selected = "Attack Speed ++"
oWeapon.cooldown *= 0.8

if Selected = "Projectile Size ++"
oWeapon.projectile_size += 0.3

if Selected = "Piercing Amount ++"
oWeapon.tot_piercing ++

if Selected = "Clip Size ++"
oWeapon.max_ammo += 20

if Selected = "Reload Speed ++"
oWeapon.reload_time *= 0.9

if Selected = "Projectile Speed ++"
oWeapon.bulletspeed += 1

if Selected = "Focused Shots"
oWeapon.Tot_Focused_Shots = 5

if Selected = "Life Steal"
oWeapon.lifesteal += 0.5

if Selected = "Range ++"
oWeapon.range += 50

if Selected = "Focus Multiplier ++"
oWeapon.focus_multiplier += 0.5



}








if oWeapon.weapon = ActualWeapon.Pistol
{
	
if Selected = "Projectiles ++"
oWeapon.Projectiles_amount ++

if Selected = "Damage ++"
oWeapon.damage *= 1.5

if Selected = "Attack Speed ++"
oWeapon.cooldown *= 1.5	

if Selected = "Projectile Size ++"
oWeapon.projectile_size += 0.3

if Selected = "Piercing Amount ++"
oWeapon.tot_piercing ++

if Selected = "Clip Size ++"
oWeapon.max_ammo += 20

if Selected = "Reload Speed ++"
oWeapon.reload_time -= 20

if Selected = "Projectile Speed ++"
oWeapon.bulletspeed += 1

if Selected = "Focused Shots"
oWeapon.Tot_Focused_Shots = 5

if Selected = "Life Steal"
oWeapon.lifesteal += 0.5

if Selected = "Range ++"
oWeapon.range += 50

if Selected = "Focus Multiplier ++"
oWeapon.focus_multiplier += 0.5
	
}


}