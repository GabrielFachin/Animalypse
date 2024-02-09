// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BulletExplosion(_min,_max,angle,_x,_y)
{
	
	var part1 = part_type_create()
part_type_sprite(part1,sBulletExplode,true,true,false)
part_type_life(part1,room_speed *_min,room_speed * _max)
part_type_orientation(part1,angle,angle,0,0,0)
part_type_direction(part1,0,0,0,0)

	
	part_particles_create(global.partsystem,_x,_y,part1,1)
}



function EnemyHit(_x,_y,sizemin,sizemax,partmin,partmax,dirmin,dirmax,speedmin,speedmax,_min,_max)
{
 var part2 = part_type_create()
 part_type_sprite(part2,sHitParticle,true,true,false)
 part_type_size(part2,sizemin,sizemax,0,0)
 part_type_life(part2, room_speed * _min, room_speed * _max)
 part_type_direction(part2,dirmin,dirmax,0,false)
 part_type_speed(part2,speedmin,speedmax,0,false)
 
 part_particles_create(global.partsystem,_x,_y,part2,irandom_range(partmin,partmax))
	
}



function WalkEffect(_x,_y)
{
	var part = part_type_create()
	part_type_sprite(part,sWalkParticle,true,true,false)
	part_type_size(part,1,1,false,false)
	part_type_life(part,room_speed * 0.4,room_speed * 0.4)
	part_type_speed(part,0,0,false,false)
	
	part_particles_create(global.partsystem2,_x,_y,part,1)
	
	
	
	
	
	
}





function RollEffect(_x,_y)
{
	var part = part_type_create()
	part_type_sprite(part,sRollParticle,true,true,false)
	part_type_size(part,1,1,false,false)
	part_type_life(part,room_speed * 0.8,room_speed * 0.8)
	part_type_speed(part,0,0,false,false)
	
	part_particles_create(global.partsystem2,_x,_y,part,1)
	
	
}