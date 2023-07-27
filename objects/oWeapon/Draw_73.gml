 
 if weapon = ActualWeapon.Rifle
 var offset =rifleoffset
 
 if weapon = ActualWeapon.Pistol
 var offset = pistoloffset
  
var __x = lengthdir_x(length + offset,_ImgAngle)
var  __y = lengthdir_y(length + offset,_ImgAngle)

if alarm[1] != -1
draw_sprite_ext(sGunFire,-1,x + __x , y +__y,1 , 1 , _ImgAngle,c_white,1)
