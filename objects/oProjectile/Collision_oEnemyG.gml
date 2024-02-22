var  dir = image_angle

if other.CanBeHit
if ds_list_find_index(enemies_hit,other.id) = -1
{
ds_list_add(enemies_hit,other.id)
piercing --
with(other)
{
	CheckProjectileCollision()
}
 if piercing <= 0
 { 
 instance_destroy()
BulletExplosion(0.2,0.2,dir,x,y)  
 }
  
EnemyHit(other.x,other.y,sizemin,sizemax,partmin,partmax,dir - 30,dir + 30,speedmin,speedmax,1,1.55) 
}