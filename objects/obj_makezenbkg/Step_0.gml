/// @description Insert description here
if room = rm_zen
{
	if Gamerule_1.IsGemActive && Gamerule_1.controlallowed
	{
		if !doonce
		{
			doonce = true
			alarm[0] = 60*30
		}
	}
	else {doonce = false; alarm[0] = -1}

	if hidden
	{
		if (mouse_x_prev != mouse_x) || mouse_check_button_pressed(mb_left)
		{
			hidden = false
			//set visible for all
			Board_1.visible = true
			Gem_1.visible = true
			obj_score.visible = true
			obj_zenify.visible = true
			obj_levelbar.visible = true
			player1.visible = true
			if instance_exists(replay) replay.visible = true
			doonce = false
		}
		mouse_x_prev = mouse_x	
	}
}