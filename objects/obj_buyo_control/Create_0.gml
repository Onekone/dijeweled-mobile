/// @description Insert description here
image_angle = 0 // 0 = up, 90 = right, 180 = down, 270 = left
xx = 0 //x for second gem. Changes on rotation
yy = -64 //y for second gem. Changes on rotation
scr_buyo_findij()
left = false
gem1 = irandom(6) //center gem
gem2 = irandom(6) //outer gem
with(Gamerule_1)
{
	combo = 0
	reset_compliments()
}

spd_def = (Gamerule_1.level div 2) + 1
spd = spd_def

doonce = false
doonce2 = false
//alarm[0] = spd //start falling
