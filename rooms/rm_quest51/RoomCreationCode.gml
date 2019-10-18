room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "5:2"
global.chl_to_succeed = "5:1"
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
	C_destroy_gems = 80
	L_movesleft = 20
	//L_time = 60
}
instance_create(0,0,obj_questmusic)
with(obj_questmusic)
{
	danger_enable = true
	mus_main = mus_timerunning
	mus_danger = mus_timerunning_danger
	mus_win = mus_takeyourtimewin
	mus_loss = mus_takeyourtimeloss
	event_user(0)
}