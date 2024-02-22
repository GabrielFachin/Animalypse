stoppart = false

tot_mv_spd = 3
mv_spd = tot_mv_spd

max_hp = 100 //100
hp = max_hp

walkpartdelay = room_speed * 0.3

alarm_set(7,walkpartdelay)

hm = 0
vm = 0

recoil_duration = 5

upgrade_num = 3

pickup_range = 25

xp_drop_bonus = 0

IsHit = false
ivulnerability = 30
vulnerable = true

dash_duration = 25 //25
dash_cooldown = 45



//dash variables
dash_dir = 0

dsh_spd_multiplier = 1.5
dsh_spd = mv_spd *dsh_spd_multiplier

OnDash = false


//flag variable to manage first animation loop
firstloop = true

//manages hit state duration, not related to the Iframes
HitDuration = 10

//lighting variables
intensity = 0.4
col = make_color_rgb(150,110,0)
radius = 0.9

light = false

lightduration = 3

enum State
{
	Idle,
	Walking,
	Dashing,
	Hit,
	Dead,
}

state = State.Idle


UpgradesArray()


//changes to WalkState
function WalkState()
{
	
//sets sprite to the first frame on the walk animation	
image_index = walkstart
state = State.Walking

}

//changes to IdleState
function IdleState()
{
	
//switches to the idle state if no buttons are being pressed
//sets sprite to the first frame on the idle animation
image_index = idle_start	 
state = State.Idle
}

//changes to RollState
function RollState()
{
	
	//changes image speed so it maches dash duration
			    FitAnimationSpeed(dash_duration,dash_start,dash_end)
				
				//sets sprite to the first dash frame
				image_index = dash_start	
				
				//starts dash state reset alarm
				alarm[3] = dash_duration
				
				//sets image direction
				UpdateSpriteDir()
				
				//changes particle flag variable
				stoppart = false
				
				//gets the direction of the dash based on the last direction the player moved
				dash_dir = mv_dir
				
				//finally switch states
				state = State.Dashing
}

#macro stopped hm = 0 and vm = 0

#macro walking hm !=0 or vm != 0