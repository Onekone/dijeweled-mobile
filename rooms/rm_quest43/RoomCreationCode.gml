room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "4:4"
global.chl_to_succeed = "4:3"
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
	C_num_green = 22
	C_num_red = 22
}

instance_create(0,0,obj_questmusic)
with(obj_questmusic)
{
	mus_main = mus_takeyourtime
	mus_win = mus_takeyourtimewin
	mus_loss = mus_takeyourtimeloss
	event_user(0)
}