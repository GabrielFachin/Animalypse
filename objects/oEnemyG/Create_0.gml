enum EnemyTier
{
Common,
Uncommon,
Rare,
}

enum enemystate
{
    chasing,
	hit,
	dashing,
	orbiting,
    dying,
	attacking,
} 

push = 1

contactdamage = false

pathdelay = room_speed * 0.1		

oa_sensor_count = 24 //set initial sensor count
oa_interest_sensor = array_create(oa_sensor_count) //initialize array for interest sensors
oa_danger_sensor = array_create(oa_sensor_count) //initialize array for danger sensors
oa_sensor_length = 200 //sensor length 256
oa_result = 0 //initialize resulting direction variable