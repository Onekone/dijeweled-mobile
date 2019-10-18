/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr_zenify,index_temp,x,y,1,1,0,c_rainbow,1)
draw_self()
draw_set_font(font0)
centerize_text()
if !cooldown draw_text_color(x,y,"ZENIFY",c_rainbow,c_rainbow,c_rainbow,c_rainbow,1)
else draw_text_color(x,y,string(zenify_points_temp),c_rainbow,c_rainbow,c_rainbow,c_rainbow,1)