/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(vk_anykey) && pressed = 0 && window_has_focus()
{
	pressed = 1
	{
		audio_sound_gain(mus_intro,0,120)
		image_speed = 0
		image_index = 1
		alarm[0] = 1
	}
}