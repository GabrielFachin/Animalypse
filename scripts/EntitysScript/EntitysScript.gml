//get Xp drops
function GetXpDrops(_rarity,_pool,entity)
{
Item_Pool()

 var _selected = []
 
 for (var i = 0; i < array_length(XPs); i ++){
	 var _item = XPs[i]
	 	 
	 
	 if _item.Pool == _pool and _item.Rarity == _rarity
	 array_push(_selected, _item)}
   
array_shuffle(_selected,_item)
 
drop = _selected[0]

var drop_value = drop.Value

var drop_sprite =  drop.Sprite
    
     var _xoffset = random_range(-20,20)
     var _yoffset = random_range(-20,20)

 with instance_create_layer(entity.x + _xoffset, entity.y + _yoffset,"Instances",oXP)
{
value = drop_value

sprite_index = sXP

image_index = drop_sprite

rarity = drop_sprite
}

 
}






function DrawShadow(entity,wid,hei,y_offset)
{
 draw_sprite_ext(sShadow,-1,entity.x, entity.y + y_offset, wid,hei,1,c_white,0.5)


}


