//Weapon,Sprite,Recoil,Recoil Push, Projectile, Startup,  Length, Cooldown, BulletSpeed, Automatic, Damage


//fists
weapons[0] =  ds_map_create(){
ds_map_add(weapons[0],"sprite", -1)
ds_map_add(weapons[0],"recoil", 0)
ds_map_add(weapons[0],"recoil_push",0)
ds_map_add(weapons[0],"self_recoil_push",0)
ds_map_add(weapons[0],"damage",0)
ds_map_add(weapons[0],"projectile",-1)
ds_map_add(weapons[0],"startup",0)
ds_map_add(weapons[0],"length",0)
ds_map_add(weapons[0],"cooldown",0)
ds_map_add(weapons[0],"bulletspeed",0)
ds_map_add(weapons[0],"automatic", false)
ds_map_add(weapons[0],"Projectiles_amount", 1)
ds_map_add(weapons[0],"Tot_piercing", 1)
ds_map_add(weapons[0],"projectile_size", 1)
ds_map_add(weapons[0],"max_ammo", 60)
ds_map_add(weapons[0],"reload_time", 180)
ds_map_add(weapons[0],"range", 100)
ds_map_add(weapons[0],"wield", 1)
}

//pistol
weapons[1] =  ds_map_create(){
ds_map_add(weapons[1],"sprite",sPistol)
ds_map_add(weapons[1],"recoil", 2)
ds_map_add(weapons[1],"recoil_push",0)
ds_map_add(weapons[1],"self_recoil_push",0.5)
ds_map_add(weapons[1],"damage",5)
ds_map_add(weapons[1],"projectile",oBullet)
ds_map_add(weapons[1],"startup",0)
ds_map_add(weapons[1],"length",2)
ds_map_add(weapons[1],"cooldown",30)
ds_map_add(weapons[1],"bulletspeed",10)
ds_map_add(weapons[1],"automatic", false)
ds_map_add(weapons[1],"Projectiles_amount", 1)
ds_map_add(weapons[1],"Tot_piercing", 1)
ds_map_add(weapons[1],"projectile_size", 1)
ds_map_add(weapons[1],"max_ammo", 60)
ds_map_add(weapons[1],"reload_time", 180)
ds_map_add(weapons[1],"range", 100)
ds_map_add(weapons[1],"wield", 2)
}


//shotgun
weapons[2] =  ds_map_create(){
ds_map_add(weapons[2],"sprite",sShotgun)
ds_map_add(weapons[2],"recoil",10)
ds_map_add(weapons[2],"recoil_push",0)
ds_map_add(weapons[2],"self_recoil_push",0.5)
ds_map_add(weapons[2],"damage",12)
ds_map_add(weapons[2],"projectile",oBullet)
ds_map_add(weapons[2],"startup",0)
ds_map_add(weapons[2],"length",0)
ds_map_add(weapons[2],"cooldown",13)
ds_map_add(weapons[2],"bulletspeed",0)
ds_map_add(weapons[2],"automatic", false)
ds_map_add(weapons[2],"Projectiles_amount", 1)
ds_map_add(weapons[2],"Tot_piercing", 1)
ds_map_add(weapons[2],"projectile_size", 1)
ds_map_add(weapons[2],"max_ammo", 60)
ds_map_add(weapons[2],"reload_time", 180)
ds_map_add(weapons[2],"range", 100)
ds_map_add(weapons[2],"wield", 3)
}

//Ak
weapons[3] =  ds_map_create(){
ds_map_add(weapons[3],"sprite",sRifle)
ds_map_add(weapons[3],"recoil",3) //1
ds_map_add(weapons[3],"recoil_push",0.7) //0.7
ds_map_add(weapons[3],"self_recoil_push",0.6)//0.6
ds_map_add(weapons[3],"damage",1)  //1
ds_map_add(weapons[3],"projectile",oBullet)
ds_map_add(weapons[3],"startup",0)
ds_map_add(weapons[3],"length",13)
ds_map_add(weapons[3],"cooldown",15)
ds_map_add(weapons[3],"bulletspeed",20) 
ds_map_add(weapons[3],"automatic", true)
ds_map_add(weapons[3],"Projectiles_amount", 1)
ds_map_add(weapons[3],"Tot_piercing", 1)
ds_map_add(weapons[3],"projectile_size", 1)
ds_map_add(weapons[3],"max_ammo", 60) //60
ds_map_add(weapons[3],"reload_time", 180)
ds_map_add(weapons[3],"range", 250) 
ds_map_add(weapons[3],"wield", 3)

}

//Knife
weapons[4] =  ds_map_create(){
ds_map_add(weapons[4],"sprite",sKnife)
ds_map_add(weapons[4],"recoil",0)
ds_map_add(weapons[4],"recoil_push",0)
ds_map_add(weapons[4],"self_recoil_push",0.5)
ds_map_add(weapons[4],"damage",7)
ds_map_add(weapons[4],"projectile",oMeleeHit)
ds_map_add(weapons[4],"startup",4)
ds_map_add(weapons[4],"length",0)
ds_map_add(weapons[4],"cooldown",4)
ds_map_add(weapons[4],"bulletspeed",0)
ds_map_add(weapons[4],"automatic", false)
ds_map_add(weapons[4],"Projectiles_amount", 1)
ds_map_add(weapons[4],"Tot_piercing", 1)
ds_map_add(weapons[4],"projectile_size", 1)
ds_map_add(weapons[4],"max_ammo", 60)
ds_map_add(weapons[4],"reload_time", 180)
ds_map_add(weapons[4],"range", 100)
ds_map_add(weapons[4],"wield", 2)
}

//Katana
weapons[5] =  ds_map_create(){
ds_map_add(weapons[5],"sprite",sKatana)
ds_map_add(weapons[5],"recoil",0)
ds_map_add(weapons[5],"recoil_push",0)
ds_map_add(weapons[5],"self_recoil_push",0.5)
ds_map_add(weapons[5],"damage",12)
ds_map_add(weapons[5],"projectile",oMeleeHit)
ds_map_add(weapons[5],"startup",2)
ds_map_add(weapons[5],"length",0)
ds_map_add(weapons[5],"cooldown",3)
ds_map_add(weapons[5],"bulletspeed",0)
ds_map_add(weapons[5],"automatic", true)
ds_map_add(weapons[5],"Projectiles_amount", 1)
ds_map_add(weapons[5],"Tot_piercing", 1)
ds_map_add(weapons[5],"projectile_size", 1)
ds_map_add(weapons[5],"max_ammo", 60)
ds_map_add(weapons[5],"reload_time", 180)
ds_map_add(weapons[5],"range", 100)
ds_map_add(weapons[5],"wield", 3)
}

enum ActualWeapon
{
	Fists,
   Pistol,
   Shotgun,
   Rifle,
   Knife,
   Katana,
}

enum Wield
{
null,
Fists,
SingleHand,
BothHands,
}



ammo[array_length(weapons)-1] = 0

weapon = ActualWeapon.Rifle

ChangeWeapon(weapon)

ammo = max_ammo

current_cd = 0
current_delay = -1
current_recoil =  0


Tot_Focused_Shots = 0
Focused_Shots = Tot_Focused_Shots
focus_multiplier = 2


lifesteal = 0

click = false


CurvePos = 0

CurveSpd = 0

tot_CurveSpd = 0.05

_x = x

_xx = 0

_y = 0


_ImgAngle = 0

offset = 0

