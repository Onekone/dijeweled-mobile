room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "15:0"
global.chl_to_succeed = "14:5"
with(Gamerule_1)
{
	//points_xpliered_auto = true
	compliments_allowed = false
	multiswap_allowed = false
	
	end_on_nomoves = false
	illegals_allowed = true
	AHM_allowed = true
	hypeallowed = false
	
	replay_allowed = false
	points_allowed = false
	autosave_allowed = false
	spawnallowed = true
	force_moves_allowed = false
}

with(obj_quest_control)
{
	C_pattern_enabled = true
	#region pattern
		C_pattern[0,0] = 0; C_pattern[0,1] = 6; C_pattern[0,2] = 0; C_pattern[0,3] = 6; C_pattern[0,4] = 0; C_pattern[0,5] = 6; C_pattern[0,6] = 0; C_pattern[0,7] = 6;
		C_pattern[1,0] = 6; C_pattern[1,1] = 3; C_pattern[1,6] = 3; C_pattern[1,7] = 0;
		C_pattern[2,0] = 0; C_pattern[2,2] = 3; C_pattern[2,5] = 3; C_pattern[2,7] = 6;
		C_pattern[3,0] = 6; C_pattern[3,1] = 5; C_pattern[3,2] = 5; C_pattern[3,3] = 3; C_pattern[3,4] = 3; C_pattern[3,5] = 5; C_pattern[3,6] = 5; C_pattern[3,7] = 0;
		C_pattern[4,0] = 0; C_pattern[4,1] = 5; C_pattern[4,2] = 5; C_pattern[4,3] = 3; C_pattern[4,4] = 3; C_pattern[4,5] = 5; C_pattern[4,6] = 5; C_pattern[4,7] = 6;
		C_pattern[5,0] = 6; C_pattern[5,2] = 3; C_pattern[5,5] = 3; C_pattern[5,7] = 0;
		C_pattern[6,0] = 0; C_pattern[6,1] = 3; C_pattern[6,6] = 3; C_pattern[6,7] = 6;
		C_pattern[7,0] = 6; C_pattern[7,1] = 0; C_pattern[7,2] = 6; C_pattern[7,3] = 0; C_pattern[7,4] = 6; C_pattern[7,5] = 0; C_pattern[7,6] = 6; C_pattern[7,7] = 0;
	#endregion
	//L_onemove = true
	//L_time = 60
}

instance_create(0,0,obj_questmusic)
with(obj_questmusic)
{
	mus_main = mus_takeyourtime
	mus_win = mus_takeyourtimewin
	mus_loss = mus_takeyourtimeloss
	event_user(0)
}