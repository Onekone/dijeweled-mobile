/// @description Insert description here

sum_pos = 0 //number of fruit spawns, for match replay

light = 0
perc = 0 //percentage for lerp at flow width
filler = 0 //current filler width
def_filler = 0 //base filler width
fill_to_go = 0 //future fill in lerp function
bar_gap = 64 //the gap between each bar (gets smaller as the xplie increases)
bar_sprite = 0 //number of bars to show
xplier_index = 0 //number of gaps filled (for checking for fruit)
xplier_real = 1 //real section for multiplier
xx = x 
perc = 0

if global.replay_match_isplaying
{	
	Replay_load = ds_map_create()
	var file = ini_open(global.replay_string)
		var sect = ini_read_string("replay","data","-")
		ds_map_read(Replay_load,sect)
	ini_close()
}