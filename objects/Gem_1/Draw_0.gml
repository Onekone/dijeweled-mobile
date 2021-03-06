/// @description Insert description here
// You can write your code in this editor
var X = x+xmover+SWAP_X
var Y = y+ymover+SWAP_Y
if !amInvisible
{
	if amCompanion
	{
		draw_sprite(spr_companion_glow,0,X,Y)
		draw_sprite_ext(spr_companion,amLocked,X,Y,image_xscale,image_yscale,0,c_white,1)
	}
	else if !amHype //if I am not a hypercube
	{
		#region powered bloom
		if global.OPT_lightallowed && candraw
		{
			if (gempower > 0 && gempower < 6) || bloom
			{
				var value = random_range(.2,.4)
					shader_set(shd_bright_contrast);
				    shader_set_uniform_f(uni_time, var_time_var);
				    shader_set_uniform_f(uni_mouse_pos, var_mouse_pos_x, var_mouse_pos_y);
				    shader_set_uniform_f(uni_resolution, 64, 64);
				    shader_set_uniform_f(uni_brightness_amount, value);
				    shader_set_uniform_f(uni_contrast_amount, var_contrast_amount );
			}
			else if amLit
			{
				var value = 1
					shader_set(shd_bright_contrast);
				    shader_set_uniform_f(uni_time, var_time_var);
				    shader_set_uniform_f(uni_mouse_pos, var_mouse_pos_x, var_mouse_pos_y);
				    shader_set_uniform_f(uni_resolution, 64, 64);
				    shader_set_uniform_f(uni_brightness_amount, value);
				    shader_set_uniform_f(uni_contrast_amount, var_contrast_amount );
			}
	
		}
		#endregion

		#region draw self or bomb
		
		if !amBomb && amLocked < 2 || amLocked = 3//draw me
		{
			if !Gamerule_1.zenify //default gem
			{
				if global.OPT_lightallowed
				{
				if (gempower = 0 && !bloom && skinnum < 7) draw_sprite_ext(shadow_index,image_index,X,Y,0.5,0.5,0,c_white,1)
				}
				draw_sprite_ext(sprite_index,image_index,X,Y,image_xscale,image_yscale,0,c_white,1)
			}
			else //zenify
			{				
				draw_sprite_ext(sprite_index,image_index,X,Y,image_xscale,image_yscale,0,c_white,1)	
			}
		}
		else if amLocked = 4
		{
				draw_set_font(fnt_open24display_skull)
				centerize_text()
				draw_sprite_ext(spr_skull,skinnum,X,Y,image_xscale,image_yscale,0,c_white,1)
				draw_text_outline(X,Y-12,countdown,c_white,c_green)
				draw_set_font(font0)
		}
		else //draw bomb/doom
		{
			if amBeingLocked = 0
			{
				draw_set_font(fnt_open24display)
				centerize_text()
				if amBomb draw_sprite_ext(spr_bombs,skinnum,X,Y,image_xscale,image_yscale,0,c_white,1)
				else if amBeingLocked = 0 draw_sprite_ext(spr_doomgem,skinnum,X,Y,image_xscale,image_yscale,0,c_white,1)
				draw_text_outline(X,Y,countdown,c_white,c_black)
				draw_set_font(font0)
			}
		}
		#endregion

		#region draw locks/frozen locks if fully locked
		if amLocked = 1 && !amBeingLocked //lock
		{
			draw_sprite(spr_lockgem,0,x,y)
		}
		else if amLocked = 3 && !amBeingLocked //ice
		{
			draw_sprite(spr_icefreeze,9,x,y)
		}
		#endregion	

		shader_reset()
	}
	else //if I am a hypercube
	{
		draw_sprite(spr_hypercube,hyper_anim,X,Y)
		draw_set_blend_mode(bm_add)
		draw_sprite(spr_hypeglow,hyper_anim,X,Y)
		draw_set_blend_mode(bm_normal)
	}

	if spinning //if im selected
	{
		if (!Gamerule_1.illegal_cando || !Gamerule_1.controlallowed)
		{
			draw_sprite(spr_gemselectglow,2,x,y)
		}
		else draw_sprite(spr_gemselectglow,Gamerule_1.illegals_allowed,x,y)
	}
}
else if Gamerule_1.debug draw_sprite(spr_hiddengem,0,X,Y)
//draw_text(x,y,geodenum)
//if skinnum = 7 draw_text(x,y,geodenum_points[0])