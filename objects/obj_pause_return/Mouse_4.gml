/// @description Insert description here
if room = rm_menu_options
{
	room_goto(rm_menu)
}
else
{
	mouse_clear(mb_left)
	keyboard_key_press(vk_escape)
	keyboard_key_release(vk_escape)	
}