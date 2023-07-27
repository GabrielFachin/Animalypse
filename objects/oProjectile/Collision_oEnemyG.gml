if ds_list_find_index(self.enemies_hit,other.id) = -1
{
ds_list_add(self.enemies_hit,other.id)
other.hp -= oWeapon.damage * global.damage_multiplier
global.totaldamage += oWeapon.damage
other._dir = point_direction(other.x,other.y,xprevious,yprevious)
piercing --
 if piercing <= 0
 instance_destroy(self)
 
 other.IsHit = true
 
other.alarm[0] = other.ivulnerability
}

