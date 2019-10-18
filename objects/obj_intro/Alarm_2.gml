/// @description Insert description here
// You can write your code in this editor
image_alpha -= 0.1
if image_alpha > 0 alarm[2] = 1
else {audio_stop_sound(mus_intro); instance_destroy();}