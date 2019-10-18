/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,1)
draw_set_font(fnt_open24display)
draw_text(x,y,string(time))
draw_set_font(font2)