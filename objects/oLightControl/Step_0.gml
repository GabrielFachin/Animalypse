
if global.pause
exit




night = make_color_rgb(_color[0],_color[1],_color[2])

 //_color = TimeManager(_color[0],_color[1],_color[2])

var _time = 5

key_previous = min(floor(_time * keytimes),keytimes - 1)

key_next = (key_previous + 1) mod keytimes

var _lerp = (_time - key_previous/keytimes) * keytimes

color_mix = [lerp(color[key_previous,0],color[key_next,0],_lerp),
            lerp(color[key_previous,1],color[key_next,1],_lerp),
			lerp(color[key_previous,2],color[key_next,2],_lerp)]
