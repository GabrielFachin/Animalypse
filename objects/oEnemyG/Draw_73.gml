if global.debug 
{

var _state = state

if state = 0
_state = "chasing"

if state = 1 
_state = "distancing"

if state = 2 
_state = "hit"

if state = 3
_state = "approaching"

if state = 4
_state = "dashing"

if state = 5
_state = "charging"

if state = 6
_state = "attacking"

if state = 7
_state = "evading"

if state = 8
_state = "shooting"




draw_text(x,y-60,_state)
}