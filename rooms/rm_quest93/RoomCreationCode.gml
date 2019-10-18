room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "9:4"
global.chl_to_succeed = "9:3"
with(Gamerule_1)
{
	//points_xpliered_auto = true
	levelcompleteallowed = false
	multiswap_allowed = true
	compliments_allowed = false
	end_on_nomoves = false
	AHM_allowed = true
	illegals_allowed = true
	hypeallowed = false
	replay_allowed = false
	points_allowed = true
	autosave_allowed = false
	spawnallowed = true
	force_moves_allowed = false
}

with(obj_quest_control)
{
	C_num_points = 10000
	Gamerule_1.points = C_num_points/2
	L_drain = 3
	L_time = 360
}

with(obj_timebar)
{
	var t = 360
	time_full = t
	time_now = t
}
instance_create(0,0,obj_questmusic)
with(obj_questmusic)
{
	mus_main = mus_challenge1
	mus_win = mus_challenge1_win
	mus_loss = mus_challenge1_loss
	event_user(0)
}