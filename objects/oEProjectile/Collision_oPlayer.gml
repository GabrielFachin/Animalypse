  if other.IsHit = false
  {
 other.hp -= damage
 other.IsHit = true
 other.alarm[0] = other.ivulnerability
 other.alarm[1] = 5
 other.hpcolor = c_red
 oControl.alarm[0] = oControl.hp_delay
 instance_destroy(self)
  }