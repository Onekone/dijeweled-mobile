room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "22:4"
global.chl_to_succeed = "22:3"
with(Gamerule_1)
{
	//points_xpliered_auto = true
	compliments_allowed = false
	end_on_nomoves = false
	AHM_allowed = true
	illegals_allowed = false
	hypeallowed = true
	replay_allowed = false
	points_allowed = false
	autosave_allowed = false
	spawnallowed = false
	force_moves_allowed = false
}

with(obj_quest_control)
{
	C_gemsare0 = true
}
with(obj_questmusic)
{
	mus_main = mus_takeyourtime
	mus_win = mus_takeyourtimewin
	mus_loss = mus_takeyourtimeloss
	event_user(0)
}