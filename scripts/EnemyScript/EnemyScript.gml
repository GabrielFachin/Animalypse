function FindPath(_x,_y,target_x,target_y)
{	
	
	var weight = 0
	
	//----- Set Interest Sensors -----\\
var i,angle,goal_direction,difference;
goal_direction = point_direction(_x,_y,target_x,target_y) //find target direction
for (i=0;i<oa_sensor_count;i++) //loop through all interest sensors
    {
    angle = (360 / oa_sensor_count) * i //direction of current sensor
    difference = abs(angle_difference(angle,goal_direction)) //find angle difference of sensor from goal direction
    oa_interest_sensor[i] = (180 - difference) / 180 //set sensor to normalized difference
    }

//----- Set Danger Sensors -----\\
var j,n,col,distance,list;
for (i=0;i<oa_sensor_count;i++)
    {
    oa_danger_sensor[i] = 0 //reset danger sensor to 0
    angle = (360 / oa_sensor_count) * i //direction of current sensor
    list = ds_list_create()//create list for collision line detection
    //fill list with collidable targets (par_detectable)
    n = collision_line_list(_x,_y,_x+lengthdir_x(oa_sensor_length,angle),_y+lengthdir_y(oa_sensor_length,angle),oParDetectable,1,1,list,0)
    //loop through list of collidable instances to affect danger sensors
    for (j=0;j<n;j++)
        {
        col = ds_list_find_value(list,j) //get collidable instance
        distance = point_distance(_x,_y,col.x,col.y) //get distance to collidable instance origin
        switch col.object_index //set danger weight based on object type
            {
            case oCollision: weight = 1.0; 
			{
			
			break; //full weight if wall
			}
            case oEnemyG: weight = 0.5; break; //half weight if unit
            }
        //set danger sensor baseds on distance from collidable instance and weight
        oa_danger_sensor[i] = max(oa_danger_sensor[i],(oa_sensor_length - distance) / oa_sensor_length * weight);
        }
    ds_list_destroy(list) //free up collision list
    }

//----- Calculate Resulting Direction -----\\
var i,result_x,result_y,potential_list,dir;

//populate potential direction list with danger directions below a fixed amount
potential_list = ds_list_create()
for (i=0;i<oa_sensor_count;i++)
    {
    //if danger result is < .4 add to "OK" directions list
    if oa_danger_sensor[i] < .4
        {
        ds_list_add(potential_list,i)
        }
    }

//average interest directions from potential list weighted based on interest direction value
var potential_direction,interest,diff;
result_x = 0
result_y = 0
for (i=0;i<ds_list_size(potential_list);i++)
    {
    potential_direction = ds_list_find_value(potential_list,i)
    interest = oa_interest_sensor[potential_direction]
    dir = (360 / oa_sensor_count) * potential_direction
    //further weight based on how close direction is to current direction to favor current direction
    diff = abs(angle_difference(dir,oa_result))
    result_x += lengthdir_x(interest,dir) * sqr((180 - diff) / 180)
    result_y += lengthdir_y(interest,dir) * sqr((180 - diff) / 180)
    }
    
ds_list_destroy(potential_list)
oa_result = point_direction(0,0,result_x,result_y)

//----- Movement and image_angle Update -----\\
hm = lengthdir_x(spd,oa_result)
vm = lengthdir_y(spd,oa_result)

	
	
	
}



function DrawPath()
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
draw_set_color(c_white)
	
	
}






function DeathManager(sprite,index,intensity,entity,side)
{
	
	var wid = window_get_width()
	var hei = window_get_height()
	
	if wid and hei > 0
	{
	
if !surface_exists(global.CorpsesSurf)
global.CorpsesSurf = surface_create(wid,hei)
else
{
	
shader_set(ShGrey)
surface_set_target(global.CorpsesSurf)

var handler = shader_get_uniform(ShGrey,"intensity")

shader_set_uniform_f(handler,intensity)

draw_sprite_ext(sprite,index,entity.x,entity.y,side,1,0,c_white,1)

surface_reset_target()

instance_destroy(entity)
shader_reset()


}
	
}
}

function Dash(damage,entity,distance,duration)
{
	



}