/// @description MOVE
if keyboard_check(vk_left) || keyboard_check(vk_right)
{
	if keyboard_check(vk_left) left = true
	else left = false
	event_user(1)
	alarm[1] = 2
}
else alarm[1] = -1