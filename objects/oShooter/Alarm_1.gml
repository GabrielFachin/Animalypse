/// @description run pathfind code

//updates pathfinding if in chasing state and has a target
if target != noone and state = enemystate.chasing
{
FindPath(x,y,oPlayer.x,oPlayer.y,spd)
newpath = true //tells the object that the path got updated, so it can ignore spriteside
}

alarm_set(1,codedelay)

