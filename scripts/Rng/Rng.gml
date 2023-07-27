function RandomizeRarity(cChance,uChance,rChance,lChance,mChance){

var tot = cChance + uChance + rChance + lChance + mChance

if tot > 1000
show_message("burro pra caraikkkkkkkkkk")

var pool = []
pool[0] = "common"
pool[1] = "uncommon"
pool[2] = "rare"
pool[3] = "legendary"
pool[4] = "mythical"



rarity[0] = cChance
rarity[1] = uChance
rarity[2] = rChance
rarity[3] = lChance
rarity[4] = mChance
rarity[5] = 0

var slot = []
slot[0] = 0



var _tier = 0
	
var pool_tier = 0
	
var _total = 0

var i = 0

	
while (_tier < 5){
	
	if i = rarity[_tier]{
   _tier ++
   pool_tier ++
   i = 0
   }
	
	if i = rarity[_tier] and _tier = 4 {
 var n = random_range(0,_total)
 }
	
	if i != rarity[_tier]
	{
	i++
  slot[_total] = pool[pool_tier]
  _total ++
	}


}
	 

rarity = slot[n]
return rarity
}


function RandomizeUncertain(){
	
var pool = []
var rarity = []

var length = array_length(argument0)

for (var i = 0; i < length; i++)
{
 pool[i] = i + 1
 rarity[i] = argument0[i]
}

rarity[array_length(rarity) + 1] = 0

var slot = []
slot[0] = 0




var _tier = 0
	
var pool_tier = 0
	
var _total = 0

var i = 0

	
while (_tier < length + 1){
	
	if i = rarity[_tier]{
   _tier ++
   pool_tier ++
   i = 0
   }
	
	if i = rarity[_tier] and _tier = length {
 var n = random_range(0,_total)
 }
	
	if i != rarity[_tier]
	{
	i++
  slot[_total] = pool[pool_tier]
  _total ++
	}


}
	 

choosen = slot[n]
return choosen
}







//get drops infos

function GetXpDrops(_rarity,_pool)
{
Item_Pool()

 var _selected = []
 
 for (var i = 0; i < array_length(XPs); i ++){
	 var _item = XPs[i]
	 	 
	 
	 if _item.Pool == _pool and _item.Rarity == _rarity
	 array_push(_selected, _item)}
   
array_shuffle(_selected,_item)
 
drop = _selected[0]

return drop
 
}

function GetItemDrops(rarity,Pool)
{
	
}

