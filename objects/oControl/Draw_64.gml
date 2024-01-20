
var guiH = display_get_gui_height()
var guiW = display_get_gui_width()



draw_sprite(sHudBar,-1,2,2)
if global.xp <= global.maxXP
draw_sprite_ext(sHudXpBar,-1,4,17,global.xp/global.maxXP,1,0,color,alpha)
else
draw_sprite_ext(sHudXpBar,-1,4,17,1,1,0,color,alpha)

draw_text(630,330,string(oWeapon.ammo) + "/" + string(oWeapon.max_ammo))


actual_hp = clamp(oPlayer.hp,0,oPlayer.max_hp) / oPlayer.max_hp

if alarm[0] = -1
delay_hp = lerp(delay_hp,actual_hp,0.02)

draw_sprite_ext(sHudFakeHpBar,-1,4,4,delay_hp,1,0,c_white,1)

if oPlayer.hp <= oPlayer.max_hp
draw_sprite_ext(sHudHpBar,-1,4,4,oPlayer.hp/oPlayer.max_hp,1,0,hpcolor,hpalpha)
else
draw_sprite_ext(sHudHpBar,-1,4,4,1,1,0,hpcolor,hpalpha)


var sprh = sprite_get_height(sLvlUpgrade)
var sprw = sprite_get_width(sLvlUpgrade)

var buffer = 40

var _click = mouse_check_button_pressed(mb_left)

var _xx = display_get_gui_width()/2 - sprw - buffer
var _yy = display_get_gui_height()/2 

var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)


if global.levelup{
	
draw_set_alpha(0.5)
draw_rectangle_color(0,0,display_get_gui_width(),display_get_gui_height(),c_black,c_black,c_black,c_black,false)
draw_set_alpha(1.0)
	
 for (var i = 0; i < oPlayer.upgrade_num ; i++){
	 var _sprx = _xx + (sprw + buffer) * i
	 var _y = upgrade_list[| i]
	 var _name = upgrades_grid[# UpgradesGrid.Name,_y]
	 
	   
  if point_in_rectangle(mx,my,_sprx - sprw/2, _yy - sprh/2, _sprx + sprw/2, _yy + sprh/2){
  upgrade_xscale = 1.1
  upgrade_yscale = 1.1
  draw_sprite_ext(sCardSelect,-1,_sprx - 0.8,_yy +4,upgrade_xscale,upgrade_yscale,0,c_white,1)
   if _click
   {
   ds_list_add(ds_player_upgrades_list,_name)
   global.levelup = false
   global.pause = false
   oPlayer.upgrades_array[_y] ++
   Upgrades(_name)
   }
  }
  else{
  upgrade_xscale = 1
  upgrade_yscale = 1
  }
  
  
  
  draw_sprite_ext(sLvlUpgrade,-1,_sprx,_yy,upgrade_xscale,upgrade_yscale,0,c_white,upgrade_alpha)
  draw_sprite_ext(sUpgradesIcon,_y,_sprx ,_yy -56 * upgrade_yscale ,upgrade_xscale,upgrade_yscale,0,c_white,upgrade_alpha)
  
draw_set_font(fUpgrades)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text_transformed(_sprx,_yy + 10, _name,upgrade_xscale -0.2,upgrade_yscale -0.2,0)
draw_set_font(-1)



  
 }
  
}
 
  