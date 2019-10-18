room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "1:2"
global.chl_to_succeed = "1:1"
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
	C_destroy_locks = 15
	L_time = 1
}

with(obj_lock_control)
{
	LockSpawnLevelMin = 0 //When do we start allowing coals to spawn? (-1 = infinite)
	LockSpawnLevelMax = -1 //When do we stop allowing coals? (-1 = infinite)

/*1*/TurnsToSpawnRandom = false //Is the turns to spawn randomized? If so, it wont be levelbased
	TurnsToSpawnChance = 1 //if above is true, what is the chance out of 100 to spawn?
/*2*/TurnsToSpawnLevelBased = true //Does the variable turntospawn consist of the level variable?
	TurnsToSpawnLevelBasedEnd = 1 //After which level do we stop changing the turns to spawn value?
	TurnsToSpawnDefault = 6
	TurnsToSpawn = 6; //After how many turns will a coal spawn? This changes every level if it is level based.
	TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
LockMax = 10 //Max amount of locks on screen
}

with(obj_timebar)
{
	var t = 300
	time_full = t
	time_now = t
	//alarm[0] = 60
}

instance_create(0,0,obj_questmusic)
with(obj_questmusic)
{
	mus_main = mus_challenge2
	mus_win = mus_challenge2_win
	mus_loss = mus_challenge2_loss
	event_user(0)
}