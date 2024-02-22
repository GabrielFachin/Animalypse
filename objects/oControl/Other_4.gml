var RoomW = round(room_width/16)   //900
var RoomH =round(room_height/16)   //1200


var array = [910,50,10,1,2,5]



var lay_id = layer_get_id("Tiles_1")

var map_id = layer_tilemap_get_id(lay_id)

for (var width = 0; width < RoomW; width ++){
 for (var height = 0; height < RoomH; height ++){
	  var tile = RandomizeUncertain(array) + 1 //+1 so it takes in consideration the null tile and removes it
        var quality = tile
	   
	  
	  tilemap_set(map_id,quality,width,height)
 }}