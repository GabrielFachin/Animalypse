event_inherited();

state = enemystate.chasing

shoot_cd_min = 4 *room_speed

shoot_cd_max = 7 * room_speed

_shoot_range = 170

projectile_speed = 5

projectile_damage = 20

hp = 3

shoot_cooldown = random_range(shoot_cd_min,shoot_cd_max) 

approaching = 1

kiting_tot_cd = 30
kiting = kiting_tot_cd

switch_delay = 60

range_boundary = 50

tot_spd = 1
spd = tot_spd

waiting = 300 + random_range(-60,60)