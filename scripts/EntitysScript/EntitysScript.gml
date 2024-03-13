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



function DrawShadow(entity,wid,hei,y_offset,x_offset)
{
 draw_sprite_ext(sShadow,-1,entity.x + x_offset, entity.y + y_offset, wid,hei,1,c_white,0.5)


}

function LoopAnimation(start,last)
{
	if floor(image_index) > last
	 image_index = start
}

function UpdatePos(len,dir)
{
	
hm = lengthdir_x(len,dir)
vm = lengthdir_y(len,dir)

}

function UpdateSpriteDir()
{
	
		 //changes sprites xscale to direction in case the new direction has already been set
	 if sign(hm) !=0
	image_xscale = sign(hm)
	
}

function DeleteHitbox()
{

mask_index = sNoCollision

}

function FitAnimationSpeed(duration,start,last)
{

var totalduration = duration / 10
image_speed = (last - 1 - start) /  totalduration //-1
	
}

function WallCollision()
{
	
if place_meeting(x,y+vm,oCollision){
	while !place_meeting(x,y + sign(vm),oCollision){
	y += sign(vm)
	}
vm = 0
}

if place_meeting(x + hm,y,oCollision){
	while !place_meeting(x + sign(hm),y,oCollision){
		x += sign(hm)
	}
hm = 0
}	
	
}


function RunTimerWReset(timer,reset,firefunc,arg) 
{
	if timer --= 0
	 {
		 timer = reset
		 if firefunc != noone
		 firefunc(arg)
	 }
	return(timer)
	
}


function RunTimer(timer)
{
	
	if timer > 0
	timer --
	
	return(timer)
	
}

function CheckWallCollision(firefunc,arg)
{
	
if place_meeting(x + hm,y + vm,oCollision)	
firefunc(arg)
	
}