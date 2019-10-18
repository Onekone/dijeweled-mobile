/// @description Insert description here
if pos_i != -1 && pos_j != -1
{
	draw_sprite_ext(spr_spinner2,touchedCCW,x,y,1,1,rot,c_white,1)
	draw_self()
}

draw_rectangle_colour(63,843,318,970,0,0,0,0,0)
var c = touchedCCW ? c_teal : $444444 
draw_rectangle_colour(67,847,314,966,c,c,c,c,0)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(190,906, touchedCCW ? "COUNTERCLOCKWISE" : "CLOCKWISE");