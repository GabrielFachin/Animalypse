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
	charging,
	bite,
} 

push = 1

contactdamage = false

pathdelay = room_speed * 0.1		

function DyingState()
{
	
image_index = deathstart	
state = enemystate.dying

}

function CanBeHit(arg){_CanBeHit = arg}

oa_sensor_count = 24 //set initial sensor count
oa_interest_sensor = array_create(oa_sensor_count) //initialize array for interest sensors
oa_danger_sensor = array_create(oa_sensor_count) //initialize array for danger sensors
oa_sensor_length = 200 //sensor length 256
oa_result = 0 //initialize resulting direction variable

MeleeDist = 15

CloseDist = 60

MediumDist = 120

HighDist = 240