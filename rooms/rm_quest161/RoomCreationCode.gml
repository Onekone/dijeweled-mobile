room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "16:2"
global.chl_to_succeed = "16:1"
with(Gamerule_1)
{
	//points_xpliered_auto = true
	compliments_allowed = false
	
	end_on_nomoves = false
	illegals_allowed = true
	AHM_allowed = true
	hypeallowed = false
	
	replay_allowed = false
	points_allowed = false
	autosave_allowed = false
	spawnallowed = true
	force_moves_allowed = false
	multiswap_allowed = true
}

with(obj_quest_control)
{
	C_num_chain = 85
	L_time = 180
}

var tb = instance_create(576,1088,obj_timebar)
with(tb)
{
	var t = 180
	time_full = t
	time_now = t
}

instance_create(0,0,obj_questmusic)
with(obj_questmusic)
{
	mus_main = mus_challenge2
	mus_win = mus_challenge2_win
	mus_loss = mus_challenge2_loss
	event_user(0)
}