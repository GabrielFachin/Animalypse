if distance_to_object(oPlayer) <= oPlayer.pickup_range{
	var _dir = point_direction(x,y,oPlayer.x,oPlayer.y)
	hm = lengthdir_x(spd, _dir)
	vm = lengthdir_y(spd, _dir)
}
else{
hm = 0
vm = 0
}

//common
if rarity = 0
{
intensity = 1
col = make_color_rgb(16,52,166)
radius = 0.1	
}


//if uncommon
if rarity = 1
{
intensity = 1
col = make_color_rgb(160,32,240)
radius = 0.1	
}


//rare
if rarity = 2
{
intensity = 1
col = make_color_rgb(196,196,0) //196,80,0
radius = 0.1	
}


x += hm
y += vm
 