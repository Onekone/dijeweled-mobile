/// @description Insert description here
done++
if global.IAMHOST && (done == 2)
{
	alarm[1] = 3*60
}
else if (done == 2) audio_play_sound(vo_gameover,0,false)
