
var  dir = image_angle

if ds_list_find_index(enemies_hit,other.id) = -1
{
ds_list_add(enemies_hit,other.id)
other.hp -= damage * global.damage_multiplier
other._dir = point_direction(other.x,other.y,xprevious,yprevious)
piercing --
 if piercing <= 0
 { 
 instance_destroy()
BulletExplosion(0.2,0.2,dir,x,y)  
 }
 
 other.IsHit = true
 
other.alarm[0] = other.ivulnerability

EnemyHit(other.x,other.y,sizemin,sizemax,partmin,partmax,dir - 30,dir + 30,speedmin,speedmax,1,1.55) 
}

