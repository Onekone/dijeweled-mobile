room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "18:3"
global.chl_to_succeed = "18:2"
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
	C_destroy_dooms = 16
	//L_time = 300
	//L_onemove = true
}
with(obj_doom_control)
{
	DoomSpawnInstant = true //Should it spawn every time it gets destroyed?

DoomCounterLevelBased = false //Is the counter of the Dooms a level based variable?
DoomCounterDefault = 9 //The value to give to the newly spawned Doom
DoomCounter = DoomCounterDefault //The value to give to the newly spawned Doom

}
with(obj_lock_control)
{
	LockSpawnLevelMin = -1 //When do we start allowing coals to spawn? (-1 = infinite)
LockSpawnLevelMax = -1 //When do we stop allowing coals? (-1 = infinite)


/*2*/TurnsToSpawnLevelBased = false //Does the variable turntospawn consist of the level variable?
	TurnsToSpawnDefault = 5
	TurnsToSpawn = 5; //After how many turns will a coal spawn? This changes every level if it is level based.
	TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
LockMax = 12 //Max amount of coals on screen
}
with(obj_questmusic)
{
	danger_enable = true
	mus_main = mus_timerunning
	mus_danger = mus_timerunning_danger
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
