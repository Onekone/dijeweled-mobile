room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "21:5"
global.chl_to_succeed = "21:4"
with(Gamerule_1)
{
	//points_xpliered_auto = true
	compliments_allowed = false
	levelcompleteallowed = false
	
	end_on_nomoves = false
	illegals_allowed = true
	AHM_allowed = true
	hypeallowed = false
	
	replay_allowed = false
	points_allowed = true
	autosave_allowed = false
	spawnallowed = true
	force_moves_allowed = false
	multiswap_allowed = false
}

with(obj_quest_control)
{
	C_num_septa = 1
	//L_time = 300
	//L_onemove = true
}
with(obj_questmusic)
{
	mus_main = mus_takeyourtime
	mus_win = mus_takeyourtimewin
	mus_loss = mus_takeyourtimeloss
	event_user(0)
}
/*
var tb = instance_create(576,1088,obj_timebar)
with(tb)
{
	var t = 300
	time_full = t
	time_now = t
}
