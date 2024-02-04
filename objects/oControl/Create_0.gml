randomize()


global.CorpsesSurf = -1


color = c_white
alpha = 1

AmmoHei = 1

global.debug = false


hpcolor = c_white
hpalpha = 1
display_set_gui_size(640,360)

global.total_game_spd = 1
global.game_spd = global.total_game_spd 


global.damage_multiplier = 1


global.maxXP = 100
global.xp = 0
global.levelup = false
xp_scaling = 1.35


global.level = 1
global.pause = false


global.inshop = false

global.day = 1
global.week = 1
global.event = 0 

global.time = 19 
global.cap = global.time + 1

upgrade_alpha = 1
upgrade_xscale = 1
upgrade_yscale = 1


delay_hp = oPlayer.hp / oPlayer.max_hp
actual_hp = oPlayer.hp

hp_delay = 0

#region character sprite macro

#macro walking1_start 0

#macro walking1_end 5

#macro walking2_start 6

#macro walking2_end 11

#macro walking3_start 12

#macro walking3_end 18

#macro idle1_start 19

#macro idle1_end 21

#macro idle2_start 22

#macro idle2_end 25

#macro idle3_start 26

#macro idle3_end 29

#macro dash_start 30

#macro dash_end 37

#endregion

#region enemies sprite macro

#macro bat_flying_start 0

#macro bat_flying_end 3

#macro dead_bat 4

#endregion





#macro rifleoffset 2

#macro pistoloffset 4


#macro object 0



#macro wave_duration (12 / ( 10 * room_speed * 60))
// 12 waves com uma média de 10 minutos totais



ds_player_upgrades_list = ds_list_create()


enum UpgradesGrid{
	Name,
	Script,
	Frequency,
	Sprite,
	Lenght,
}

upgrades_grid = ds_grid_create(UpgradesGrid.Lenght,0)
ds_grid_add_upgrade("Projectiles ++",                                             -1,-1,-1)
ds_grid_add_upgrade("Damage ++",                                                 -1,-1,-1)
ds_grid_add_upgrade("Attack Speed ++",                                        -1,-1,-1)
ds_grid_add_upgrade("Projectile Size ++",                                       -1,-1,-1)
ds_grid_add_upgrade("Piercing Amount ++",                                 -1,-1,-1)
ds_grid_add_upgrade("Clip Size ++",                                                  -1,-1,-1)
ds_grid_add_upgrade("Reload Speed ++",                                       -1,-1,-1)
ds_grid_add_upgrade("Projectile Speed ++",                                  -1,-1,-1)
ds_grid_add_upgrade("Focused Shots",                                          -1,-1,-1)
ds_grid_add_upgrade("Life Steal",                                                     -1,-1,-1)
ds_grid_add_upgrade("Range ++",                                                    -1,-1,-1)
ds_grid_add_upgrade("Focus Multiplier ++",                                  -1,-1,-1)
