if distance_to_object(oPlayer) <= oPlayer.pickup_range{
	var _dir = point_direction(x,y,oPlayer.x,oPlayer.y)
	hm = lengthdir_x(spd, _dir)
	vm = lengthdir_y(spd, _dir)
}
else{
hm = 0
vm = 0
}

x += hm
y += vm
 