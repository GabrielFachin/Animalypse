//BodiesSurf = -2

BodiesSurf = surface_create(room_width,room_height)


intensity = 0.2
col = make_color_rgb(200,200,200)
radius = 0.1

darken = 0.5

tot_spd = 1.2
spd = tot_spd
self_pool = "Common Enemies"

deathsprite = 0

min_xp_drop = 1
max_xp_drop = 2 

hp = 10 //10


dmg = 5
Edmg_multiplier = 1


level = 1

hm = 0
vm = 0

ivulnerability = 15

IsHit = false

self_push = 2
knockback = 3

enum enemystate
{
	chasing,
	distancing,
	hit,
	approaching,
	dashing,
	charging,
	attacking,
	evading,
	shooting,
	in_range,
	dead,
}


oa_sensor_count = 24 //set initial sensor count
oa_interest_sensor = array_create(oa_sensor_count) //initialize array for interest sensors
oa_danger_sensor = array_create(oa_sensor_count) //initialize array for danger sensors
oa_sensor_length = 256 //sensor length
oa_result = 0 //initialize resulting direction variable

//initialize target location variables
target = oPlayer
target_x = target.y
target_y = target.y