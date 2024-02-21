/// @description Reset hit state

image_speed = 1

if hp <= 0
state = enemystate.dying
else
state = enemystate.chasing

IsHit = false

