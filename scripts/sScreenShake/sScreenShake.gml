// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screenshake(_time, _magnitude, _vertical,_horizontal,_rotation)
{
   with (oScreenShakeControl)
   {
      shake = true;
      shake_time = _time;
      shake_magnitude = _magnitude;
      horizontal = _horizontal
	  vertical = _vertical
	  rotation = _rotation
	  truecamx = oCamera.x
	  truecamy = oCamera.y
   }
}