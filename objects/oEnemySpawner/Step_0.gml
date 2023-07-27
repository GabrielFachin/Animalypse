if global.pause = true or global.game_spd = 0
{
exit
}

global.timer *= global.total_game_spd


var offset = 60
 
var hei = room_height - offset

var wid = room_width - offset


var _side = irandom(2)
 
 if _side = 0 {
  var _xx = 5 + offset
  var _yy = random_range(offset,hei)
 }
 
 if _side = 1{
 var _xx = random_range(offset,wid)
 var _yy = hei
 }
 
 if _side = 2{
  var _xx = wid
  var _yy = random_range(offset,hei)
 }
 
  

 if global.Eliminated = global.WaveEnemies
 {
	   if current_wave = 5 and done = false
 {
 global.timer /= 2
 global.WaveEnemies *= 2
 global.MaxEnemies *=2
 done = true
 }
 
  if current_wave = 8 and _done = false
  {
 global.timer /= 2
 global.WaveEnemies *= 2
 global.MaxEnemies *=2
 _done = true
  }
  
 global.Eliminated = 0
 global.cap ++
 current_wave ++
 current_wave_enemies = global.WaveEnemies
 }
 
 #region wave manager
 
 global.MaxEnemies = clamp(global.MaxEnemies,0,global.WaveEnemies)
 
 #endregion
 
 if timer <= 0 and global.Enemies != global.MaxEnemies and current_wave_enemies != 0{
 var width = ds_grid_width(ds_spawn_info) - 1
 var _argument = []
 
 
 for (var i = 0; i < width ; i ++)
   array_push(_argument, ds_spawn_info[# i , current_wave])
   
var enemy = WaveManager(_argument)
 enemy = asset_get_index(ds_spawn_info [# enemy , object])
   
   
   
  instance_create_layer(_xx,_yy,"Instances",enemy)
  
current_wave_enemies --
  global.Enemies ++
  
  timer = global.timer
 }
 
timer --

