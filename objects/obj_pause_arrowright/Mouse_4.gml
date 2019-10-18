/// @description Insert description here
var choice = obj_pause.choice

if choice < 3 
{
	obj_pause.choice++
}
else obj_pause.choice = 0

with(obj_pause) event_user(0)