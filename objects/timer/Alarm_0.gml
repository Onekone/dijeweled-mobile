/// @description Insert description here
// You can write your code in this editor
time--
if time = 10 instance_create(0,512,obj_danger)
if time = 0
{
	Gamerule_1.controlallowed = false
	Gamerule_2.controlallowed = false
	Gamerule_1.multiallowed = false
	Gamerule_2.multiallowed = false
	alarm[2] = 60
	instance_destroy(obj_danger)
	create_text(spr_timeup,"stayer")
	audio_play_sound(vo_timeup,1,0)
}
if time != 0 alarm[0] = 60

switch time
{
	case 60: audio_play_sound(vo_1min,1,0) break;
	case 30: audio_play_sound(vo_30secs,1,0) break;
	case 10: audio_play_sound(vo_10,1,0) break;
	case 9: audio_play_sound(vo_9,1,0) break;
	case 8: audio_play_sound(vo_8,1,0) break;
	case 7: audio_play_sound(vo_7,1,0) break;
	case 6: audio_play_sound(vo_6,1,0) break;
	case 5: audio_play_sound(vo_5,1,0) break;
	case 4: audio_play_sound(vo_4,1,0) break;
	case 3: audio_play_sound(vo_3,1,0) break;
	case 2: audio_play_sound(vo_2,1,0) break;
	case 1: audio_play_sound(vo_1,1,0) break;
}