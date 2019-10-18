/// @description Insert description here
draw_sprite(spr_xplier_bottom,0,x,y)
if Gamerule_1.fruit_want_to_spawn
{
	sprite_index = spr_xplier_flow_rainbow
	image_speed = 5
	draw_self()
}
else draw_sprite_part(sprite_index,image_index,0,0,filler,sprite_height,x,y)

draw_sprite(spr_xplier_bars,bar_sprite,x,y)
draw_sprite(spr_xplier_top,0,x,y)
if light > 0 draw_sprite_ext(spr_xplierglow,0,x,y,1,1,0,c_white,light)
