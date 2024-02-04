
if global.pause
exit


var _time = global.time / 24

key_previous = min(floor(_time * keytimes),keytimes - 1)

key_next = (key_previous + 1) mod keytimes

var lerp_amt = (_time - key_previous/keytimes) * keytimes

color_mix		=  [lerp(color[key_previous,0], color[key_next,0], lerp_amt),
					lerp(color[key_previous,1], color[key_next,1], lerp_amt),
					lerp(color[key_previous,2], color[key_next,2], lerp_amt)];
			

con_sat_brt_mix	=  [lerp(con_sat_brt[key_previous,0], con_sat_brt[key_next,0], lerp_amt),
					lerp(con_sat_brt[key_previous,1], con_sat_brt[key_next,1], lerp_amt),
					lerp(con_sat_brt[key_previous,2], con_sat_brt[key_next,2], lerp_amt),
					lerp(con_sat_brt[key_previous,3], con_sat_brt[key_next,3], lerp_amt),
					lerp(con_sat_brt[key_previous,4], con_sat_brt[key_next,4], lerp_amt)];

show_debug_message(key_previous)