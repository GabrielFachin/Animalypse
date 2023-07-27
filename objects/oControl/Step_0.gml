if global.pause
exit

if global.xp >= global.maxXP{
global.levelup = true
global.pause = true
global.level ++
global.xp = global.xp - global.maxXP
global.maxXP *= xp_scaling


upgrade_list = ds_list_create()

repeat(oPlayer.upgrade_num){
var _upgrade = irandom(ds_grid_height(upgrades_grid) - 1)

     while ds_list_find_index(upgrade_list,_upgrade) != -1
    var _upgrade = irandom(ds_grid_height(upgrades_grid) - 1)


ds_list_add(upgrade_list,_upgrade)
}


		


}

global.time += wave_duration

global.time = clamp(global.time,0,global.cap)

if global.time = 24
global.time = 0

if keyboard_check_pressed(vk_f5)
global.debug = !global.debug
