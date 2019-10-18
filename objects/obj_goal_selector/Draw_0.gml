/// @description Insert description here
centerize_text()
draw_self()
//draw_text(x+16,y+16,hover)
if hover > -1
{
	draw_sprite(spr_goal_glow,0,16*10 +144*xx, 32 + 32*yy)
	draw_text(857,258,info[hover,0])
	draw_set_valign(fa_top)
	draw_text_transformed(857,300,info[hover,1],0.6,0.6,0)
}
else
{
	draw_text(857,258,"Information")
	draw_set_valign(fa_top)
	draw_text_transformed(857,300,"Hover onto an option to read its functionality!",0.6,0.6,0)
}