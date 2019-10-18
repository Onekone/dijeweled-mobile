/// @description Insert description here
var ydist = y-sprite_height
draw_self()
draw_sprite(spr_cred7,0,x,ydist)
ydist -= 239
draw_sprite(spr_cred6,0,x,ydist)
ydist -= 370
draw_sprite(spr_cred5,0,x,ydist)
ydist -= 288
draw_sprite(spr_cred4,0,x,ydist)
ydist -= 160
draw_sprite(spr_cred3,0,x,ydist)
ydist -= 208
draw_sprite(spr_cred2,0,x,ydist)
ydist -= 295
draw_sprite(spr_cred1,0,x,ydist)

if showblack
{
	draw_sprite_ext(spr_black,0,0,0,room_width,room_height,0,c_white,alpha)
	draw_sprite_ext(spr_credits0,0,0,512,1,1,0,c_white,alpha2)
}