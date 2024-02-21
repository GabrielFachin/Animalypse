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


dash_dir = 0

dsh_spd_multiplier = 1.5
dsh_spd = mv_spd *dsh_spd_multiplier

OnDash = false


//manages hit state duration, not related to the Iframes
HitDuration = 10

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