///add_xymover(GEM_INDEX)
// Adds to the xmover or ymover of the near gems after a cascade
if argument0 = Gem_1 gmid = Gamerule_1
else gmid = Gamerule_2

if !gmid.lightOn && !gmid.hypeOn
{
	with(collision_point(x+64,y,argument0,false,true))
		{
			xmover2 = 5
			ymover2 = 0
			alarm[0] = 1
		}
	with(collision_point(x-64,y,argument0,false,true))
		{
			xmover2 = -5
			ymover2 = 0
			alarm[0] = 1
		}
	with(collision_point(x,y+64,argument0,false,true))
		{
			xmover2 = 0
			ymover2 = 5
			alarm[0] = 1
		}
	with(collision_point(x,y-64,argument0,false,true))
		{
			xmover2 = 0
			ymover2 = -5
			alarm[0] = 1
		}
}