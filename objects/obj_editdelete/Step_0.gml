/// @description Insert description here
var amontop = (mouse_x > x) && (mouse_x <= x + 48*2) && (mouse_y >= y) && (mouse_y <= y+48)
if amontop
{
	if mouse_x <= x+48
	{
		glow = 1
		if mouse_check_button_pressed(mb_left)
		{
			global.challenge_index = index
			room_goto(rm_quest_editor)
		}
		//edit
	}
	else
	{
		glow = 2
		if mouse_check_button_pressed(mb_left)
		{
			file_delete(string(index)+".ini")
			#region make it default
				ini_open("challenges.ini") //unlock all custom challenges
					{
						var j = index
						ini_write_real("Info","26:"+string(j)+"-Status",0)
						ini_write_string("Challenges","26:"+string(j),"Create a Custom Quest")
						ini_write_string("Info","26:"+ string(j)+"-Matchless Moves","untick")
						ini_write_string("Info","26:"+ string(j)+"-Challenge Bonus","untick")
						ini_write_string("Info","26:"+ string(j)+"-Multiplier","untick")
						ini_write_string("Info","26:"+ string(j)+"-multiswap_allowed","untick")
						ini_write_string("Info","26:"+ string(j)+"-Hypercubes","untick")
						ini_write_string("Info","26:"+ string(j)+"-Bombs","untick")
						ini_write_string("Info","26:"+ string(j)+"-Dooms","untick")
						ini_write_string("Info","26:"+ string(j)+"-Skulls","untick")
						ini_write_string("Info","26:"+ string(j)+"-Locks","untick")
						ini_write_string("Info","26:"+ string(j)+"-Ice","untick")
						ini_write_string("Info","26:"+ string(j)+"-Coals","untick")
						ini_write_string("Info","26:"+ string(j)+"-Time","untick")
						ini_write_real("Info","26:"+ string(j)+"-Difficulty",0) //1-10
					}
			ini_close()
			#endregion
			create_deledit(true)
		}
		//delete
	}
	mouse_clear(mb_left)
	
}
else glow = 0