draw_set_halign(fa_right)

//var _color = TimeManager(oLightControl._color[0],oLightControl._color[1],oLightControl._color[2])

if global.debug
{

draw_text_transformed(610,10,"fps:" + string(fps_real),0.5,0.5,0)

draw_text_transformed(610,20,"total damage: " + string(global.totaldamage),0.5,0.5,0)

draw_text_transformed(610,30,"Enemies: " + string(global.Enemies),0.5,0.5,0)

draw_text_transformed(610,40,"Ammo: " + string(oWeapon.ammo),0.5,0.5,0)

draw_text_transformed(610,50,"Wave: " + string(oEnemySpawner.current_wave),0.5,0.5,0)

draw_text_transformed(610,60,"Remaining: " + string(oEnemySpawner.current_wave_enemies),0.5,0.5,0)

draw_text_transformed(610,70,"Time: " + string(global.time),0.5,0.5,0)

//draw_text_transformed(610,90,"Red: " + string(_color[0]),0.5,0.5,0)

//draw_text_transformed(610,100,"Green: " + string(_color[1]),0.5,0.5,0)

//draw_text_transformed(610,110,"Blue: " + string(_color[2]),0.5,0.5,0)

draw_text_transformed(610,120,"Killed: " + string(global.Eliminated),0.5,0.5,0)

}