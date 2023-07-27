           target_x = oPlayer.x
            target_y = oPlayer.y

if IsHit and state != enemystate.dashing
{
state = enemystate.hit
target_x = noone
target_y = noone
}


#region sensors

var weight = 0

//----- Set Interest Sensors -----\\
var i,angle,goal_direction,difference;
goal_direction = point_direction(x,y,target_x,target_y) //find target direction
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
    n = collision_line_list(x,y,x+lengthdir_x(oa_sensor_length,angle),y+lengthdir_y(oa_sensor_length,angle),oParDetectable,1,1,list,0)
    //loop through list of collidable instances to affect danger sensors
    for (j=0;j<n;j++)
        {
        col = ds_list_find_value(list,j) //get collidable instance
        distance = point_distance(x,y,col.x,col.y) //get distance to collidable instance origin
        switch col.object_index //set danger weight based on object type
            {
            case oCollision: weight = 1.0; 
			{
				if distance_to_object(target) < 50
				weight = .2
				else
				weight = 1
			
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

#endregion

#region sprite control

if image_index > bat_flying_end
image_index = bat_flying_start

#endregion

switch state
{
           
		   case enemystate.approaching :
		   {

                    target_x = oPlayer.x
                    target_y = oPlayer.y
				
			  if distance_to_object(oPlayer) <= dash_start_range and alarm[1] = -1 and dash_cooldown <= 0
			  {
				if  !collision_line(x,y,target_x,target_y,oCollision,false,false)
				{
			   state = enemystate.charging
			   dash_cooldown = total_dash_cooldown
				}
			  }

			  break
		   }
		   
		          case enemystate.charging :
		      {
		         hm = 0
		       	 vm = 0
			 
             if alarm [1] = -1
				 alarm[1] = dash_delay


			  break
		   }
		   
		  	          case enemystate.dashing :
		      {
				if alarm[2] = -1
				{
			  alarm[2] = dash_duration	
           	  do_contact_damage = true
			  knockback = 0
				}

			  image_index = 1
			  
			  hm = lengthdir_x(dash_dist,Ddir)
              vm = lengthdir_y(dash_dist,Ddir)
			  
			  	    if place_meeting(x,y + vm,oCollision)  or place_meeting(x + hm,y,oCollision) 
					{
					state = enemystate.approaching
                    do_contact_damage = false
                     knockback = 3
					 alarm[2] = -1
					}
				  
			  
			  break
		   }
		    
		
	      
	
	         case enemystate.hit :
		      {
          
                hm = -lengthdir_x(oWeapon.recoil_push, _dir) 
 
                vm = -lengthdir_y(oWeapon.recoil_push, _dir) 

			  break
		   }
	
	
}


dash_cooldown --
event_inherited();