room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "8:4"
global.chl_to_succeed = "8:3"
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
	C_movesneeded = 125
	//L_time = 60
}

with(obj_bombcontrol)
{
	/// @description Insert description here
TurnsToSpawnLevelBased = true //Does the variable turntospawn consist of the level variable?
TurnsToSpawnLevelBasedEnd = 9 //After which level do we stop changing the turns to spawn value?
BombSpawnLevelMin = 1 //When do we start allowing bombs to spawn? (-1 = infinite)
BombSpawnLevelMax = -1 //When do we stop allowing bombs? (-1 = infinite)
TurnsToSpawnDefault = 5
TurnsToSpawn = TurnsToSpawnDefault; //After how many turns will a bomb spawn? This changes every level if it is level based.
TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
BombCounterLevelBased = true //Is the counter of the bombs a level based variable?
BombCounterLevelBasedEnd = 15 //After which level do we stop changing the bomb counter value?
BombCounterDefault = 9 //The value to give to the newly spawned bomb
BombCounter = BombCounterDefault //The value to give to the newly spawned bomb
BombMax = 5 //Max amount of bombs on screen
ExaggerateOnce = false
BombExaggerate = -1 //Make bombs spawn in less time (1/3 of turns to spawn). -1 = disabled, 0-100 percent of bar to pass to enable it
}

with(obj_doom_control)
{

DoomCounterLevelBased = false //Is the counter of the Dooms a level based variable?
DoomCounterDefault = 9 //The value to give to the newly spawned Doom
DoomCounter = DoomCounterDefault //The value to give to the newly spawned Doom
DoomSpawnInstant = true

}

/*
with(obj_timebar)
{
	var t = 60
	time_full = t
	time_now = t
}*/

with(obj_lock_control)
{
	LockSpawnLevelMin = 1 //When do we start allowing coals to spawn? (-1 = infinite)
LockSpawnLevelMax = -1 //When do we stop allowing coals? (-1 = infinite)


/*2*/TurnsToSpawnLevelBased = true //Does the variable turntospawn consist of the level variable?
	TurnsToSpawnLevelBasedEnd = 1 //After which level do we stop changing the turns to spawn value?
	TurnsToSpawnDefault = 3
	TurnsToSpawn = TurnsToSpawnDefault; //After how many turns will a coal spawn? This changes every level if it is level based.
	TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
LockMax = 7 //Max amount of coals on screen
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