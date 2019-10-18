room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "7:4"
global.chl_to_succeed = "7:3"
with(Gamerule_1)
{
	//points_xpliered_auto = true
	compliments_allowed = false
	end_on_nomoves = false
	AHM_allowed = true
	illegals_allowed = true
	hypeallowed = false
	replay_allowed = false
	points_allowed = false
	autosave_allowed = false
	spawnallowed = true
	force_moves_allowed = false
}

with(obj_quest_control)
{
	C_num_lightning = 30
	L_time = 180
}

with(obj_timebar)
{
	var t = 180
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