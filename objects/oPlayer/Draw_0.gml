var _blink = 8

DrawShadow(id,0.6,0.6,7.3)

 if alarm[0] % _blink <= _blink/2 
  draw_self()


var _width = sprite_get_width(sReload) / 2

var _progress = (sprite_get_width(sReload) - 3) / oWeapon.reload_time


if oWeapon.alarm[0] != -1
{
_x += _progress 
draw_sprite(sReload,-1,x ,y-25)
draw_sprite(sReloadProgress,-1,(x - _width) + _x ,y-25)
}
else
_x = 0

