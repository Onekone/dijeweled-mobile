/// @description Insert description here
if mouse_check_button_pressed(mb_left)
{
	if position_meeting(mouse_x,mouse_y,id)
	{
		obj_challenges_room.page++
		with(obj_challenges_selection) 
		{			
			index += 6
			with(obj_challenges_selection) custom_challengemenu_getinfo()
		}
		instance_destroy(obj_editdelete)
		create_deledit(false)
	}
}