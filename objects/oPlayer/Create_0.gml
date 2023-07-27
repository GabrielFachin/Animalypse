mv_spd = 3

spr_speed = 8

max_hp = 100
hp = max_hp

_x = 0

hm = 0
vm = 0

recoil_duration = 5

upgrade_num = 3

pickup_range = 25

xp_drop_bonus = 0

IsHit = false
ivulnerability = 20

dash_duration = 25
dash_cooldown = 45

dash_dir = 0

dsh_spd_multiplier = 1.5
dsh_spd = mv_spd *dsh_spd_multiplier

OnDash = false

col = make_color_rgb(15,15,15)
radius = 50

light = false

lightduration = 3

enum State
{
	Idle,
	Walking,
	Dashing,
}

state = State.Idle


enum Upgrades {
	Projectiles,
	Damage,
	AttackSpeed ,
	ProjectileSize ,
	PiercingAmount ,
	ClipSize,
	ReloadSpeed,
	ProjectileSpeed,
	FocusedShots,
	LifeSteal,
	Range,
	FocusMultiplier,
	Lenght
}
	
upgrades_array = [Upgrades.Lenght]

upgrades_array[Upgrades.Projectiles] =                                1    //projectiles ++
upgrades_array[Upgrades.Damage] =                                    0   //damage ++
upgrades_array[Upgrades.AttackSpeed] =                            1    //attack speed ++
upgrades_array[Upgrades.ProjectileSize] =                           0    //Projectile Size ++
upgrades_array[Upgrades.PiercingAmount] =                      0    //Piercing Amount ++
upgrades_array[Upgrades.ClipSize] =                                       0    //Clip Size ++
upgrades_array[Upgrades.ReloadSpeed] =                            0    //Reload Speed ++
upgrades_array[Upgrades.ProjectileSpeed] =                        0    //Projectile Speed ++
upgrades_array[Upgrades.FocusedShots] =                           0    //Focused Shots
upgrades_array[Upgrades.LifeSteal] =                                      0    //Life Steal
upgrades_array[Upgrades.Range] =                                          0    //Range
upgrades_array[Upgrades.FocusMultiplier] =                         0    //Focus Multiplier


