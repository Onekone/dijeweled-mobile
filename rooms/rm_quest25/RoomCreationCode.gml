room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "3:0"
global.chl_to_succeed = "2:5"
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
	C_summoves = 40
	L_time = 60
}

with(obj_timebar)
{
	var t = 60
	time_full = t
	time_now = t
}
with(obj_questmusic)
{
	mus_main = mus_takeyourtime
	mus_win = mus_takeyourtimewin
	mus_loss = mus_takeyourtimeloss
	event_user(0)
}