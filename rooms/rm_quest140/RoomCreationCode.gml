room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "14:1"
global.chl_to_succeed = "14:0"
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
		C_pattern[1,2] = 0; C_pattern[1,3] = 2; C_pattern[1,4] = 2; C_pattern[1,5] = 0;
		C_pattern[2,2] = 3; C_pattern[2,3] = 6; C_pattern[2,4] = 6; C_pattern[2,5] = 3;
		C_pattern[3,2] = 6; C_pattern[3,3] = 3; C_pattern[3,4] = 3; C_pattern[3,5] = 6;
		C_pattern[4,2] = 6; C_pattern[4,3] = 3; C_pattern[4,4] = 3; C_pattern[4,5] = 6;
		C_pattern[5,2] = 3; C_pattern[5,3] = 6; C_pattern[5,4] = 6; C_pattern[5,5] = 3;
		C_pattern[6,2] = 0; C_pattern[6,3] = 2; C_pattern[6,4] = 2; C_pattern[6,5] = 0;
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
