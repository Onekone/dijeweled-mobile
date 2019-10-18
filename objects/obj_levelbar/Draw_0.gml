/// @description Insert description here
//draw_text(x,y+64,string((obj_score.scoretemp-previous_points)))
draw_sprite(spr_lvlbar_bot,0,x-8,y)
if !Gamerule_1.time_allowed
{
	draw_sprite_part(spr_flow,image_index,0,0,((obj_score.scoretemp-previous_points)/(Gamerule_1.levelpointsneeded-previous_points))*bar_end,32,x,y+8)
}
else
{
	draw_sprite_part(spr_flow,image_index,0,0,(time_now/time_full)*bar_end,32,x,y+8)
}
draw_sprite(spr_lvlbar_top,0,x-8,y)
