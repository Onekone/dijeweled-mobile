room_speed = 60
draw_texture_flush()
global.chl_to_unlock = "11:1"
global.chl_to_succeed = "11:0"
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
}

with(obj_quest_control)
{
	C_destroy_coals = 7
	L_onemove = true
	//L_time = 60
}

with(obj_coal_control)
{
	CoalSpawnLevelMin = -1 //When do we start allowing coals to spawn? (-1 = infinite)
CoalSpawnLevelMax = -1 //When do we stop allowing coals? (-1 = infinite)

/*1*/TurnsToSpawnRandom = false //Is the turns to spawn randomized? If so, it wont be levelbased
	TurnsToSpawnChance = 1 //if above is true, what is the chance out of 100 to spawn?
/*2*/TurnsToSpawnLevelBased = false //Does the variable turntospawn consist of the level variable?
	TurnsToSpawnLevelBasedEnd = 10 //After which level do we stop changing the turns to spawn value?
	TurnsToSpawnDefault = 5
	TurnsToSpawn = 5; //After how many turns will a coal spawn? This changes every level if it is level based.
	TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
CoalMax = 15 //Max amount of coals on screen
}
instance_create(0,0,obj_questmusic)
with(obj_questmusic)
{
	mus_main = mus_takeyourtime
	mus_win = mus_takeyourtimewin
	mus_loss = mus_takeyourtimeloss
	event_user(0)
}