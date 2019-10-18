/// @description Insert description here
if global.SET_gamemode = 0
{
	if global.SET_gamemode2 = 0 global.timer = 300
			else if global.SET_gamemode2 = 1 global.timer = 180
			else global.timer = 60
	deftime = global.timer 
	audio_play_sound(vo_getready,0,false)
	alarm[0] = 90
	if global.IAMHOST alarm[1] = 60*8
	depth = -1000
}
else alarm[0] = 60*3

