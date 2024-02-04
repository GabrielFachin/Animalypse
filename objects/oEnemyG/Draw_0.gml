
draw_self()


event_inherited();

   


if IsHit{
gpu_set_fog(true,c_white,0,0)
draw_self()
gpu_set_fog(false,c_white,0,0)
}

if global.debug = true
{

draw_set_alpha(.2)
                                           //----- Draw Danger Sensors -----\\
var i,current,len,dir;
draw_set_color(c_red)
for (i=0;i<oa_sensor_count;i++)
    {
    current = oa_danger_sensor[i]
    len = current * oa_sensor_length
    dir = (360 / oa_sensor_count) * i
    draw_line_width(x,y,x+lengthdir_x(len,dir),y+lengthdir_y(len,dir),3)
    }

draw_set_alpha(.7)

                                      // ----- Draw Interest Sensors -----\\
draw_set_color(c_lime)
for (i=0;i<oa_sensor_count;i++)
    {
    current = oa_interest_sensor[i]
    len = current * oa_sensor_length
    dir = (360 / oa_sensor_count) * i
    draw_line(x,y,x+lengthdir_x(len,dir),y+lengthdir_y(len,dir))
    }

                                       // ----- Draw Resulting Direction -----\\
 draw_set_alpha(1)
 
draw_set_color(c_aqua)
len = 256
dir = oa_result
draw_line(x,y,x+lengthdir_x(len,dir),y+lengthdir_y(len,dir))



draw_text(x,y-30,distance_to_object(target))

draw_set_color(c_white)

}



