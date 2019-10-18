room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "23:3"
global.chl_to_succeed = "23:2"
with(Gamerule_1)
{
	//points_xpliered_auto = true
	compliments_allowed = false
	end_on_nomoves = false
	AHM_allowed = true
	illegals_allowed = false
	hypeallowed = true
	replay_allowed = false
	points_allowed = true
	autosave_allowed = false
	force_moves_allowed = false
	levelcompleteallowed = false
}

with(obj_quest_control)
{
	C_num_zenifycombo = 4000
	L_onemove = true
	//C_movesneeded = 10
}

with(obj_zenify)
{
	zen_multiplier = 3
	zen_countdown_multiplier = 0.5
}

with(obj_questmusic)
{
	mus_main = mus_takeyourtime
	mus_win = mus_takeyourtimewin
	mus_loss = mus_takeyourtimeloss
	event_user(0)
}