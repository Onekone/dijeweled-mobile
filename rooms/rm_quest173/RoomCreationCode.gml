room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "17:4"
global.chl_to_succeed = "17:3"
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
	multiswap_allowed = true
}

with(obj_quest_control)
{
	C_num_points = 100000
	L_time = 300
	//L_onemove = true
}

with(obj_coal_control)
{
	CoalSpawnLevelMin = -1 //When do we start allowing coals to spawn? (-1 = infinite)
CoalSpawnLevelMax = -1 //When do we stop allowing coals? (-1 = infinite)

/*1*/TurnsToSpawnRandom = true //Is the turns to spawn randomized? If so, it wont be levelbased
	TurnsToSpawnChance = 4 //if above is true, what is the chance out of 100 to spawn?
/*2*/TurnsToSpawnLevelBased = false //Does the variable turntospawn consist of the level variable?
CoalMax = 8 //Max amount of coals on screen
}


var tb = instance_create(576,1088,obj_timebar)
with(tb)
{
	var t = 300
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