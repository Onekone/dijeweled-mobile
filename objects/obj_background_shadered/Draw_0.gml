/// @description Insert description here
if global.OPT_lightallowed
{
if shd = 0	
{

	var_mouse_pos_x = mouse_x - camera_get_view_x(0);
	var_mouse_pos_y = mouse_y - camera_get_view_y(0);
	var_time_var+=0.01
	shader_set(shdr_backdrop2);
	    shader_set_uniform_f(uni_time_3, var_time_var);
	    shader_set_uniform_f(uni_resolution_3, room_width/2, room_height/2);
		draw_sprite(spr_bck0,0,0,512)
	shader_reset();

}
else if shd = 1
{
	var_time_var+=0.04;

	var_mouse_pos_x = mouse_x - camera_get_view_x(0);
	var_mouse_pos_y = mouse_y - camera_get_view_y(0);
	gpu_set_texrepeat(false);
	if shader_enabled shader_set(shd_wave);
	    shader_set_uniform_f(uni_time, var_time_var);
	    shader_set_uniform_f(uni_mouse_pos, var_mouse_pos_x, var_mouse_pos_y);
	    shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
	    shader_set_uniform_f(uni_wave_amount, var_wave_amount);
	    shader_set_uniform_f(uni_wave_distortion, var_wave_distortion );
	    shader_set_uniform_f(uni_wave_speed, var_wave_speed);
		draw_sprite_ext(spr_bck1,0,x,y,1.2,1.2,0,c_white,1)
	shader_reset();
}
else if shd = 2
{
	if (!surface_exists(srf_tunnel)) srf_tunnel = surface_create(room_width, room_height);
	surface_set_target(srf_tunnel);
	draw_sprite_tiled_ext(spr_bck2, 0, round(tunnel_offset_x), round(tunnel_offset_y), 1, 1, c_white, 1);
	surface_reset_target();

	tunnel_offset_x	+= 1;
	tunnel_offset_y	-= 3;
	var deform_x = 1.0;
	var deform_y = 0.72;
	var deform_size	= 0.8;
	var max_distortion = -sqrt(0.25 - power(-deform_x * 0.5, 2.0)) * deform_size + deform_size * 0.5;
	
	gpu_set_tex_filter(true);
shader_set(shdr_tunnel);
	shader_set_uniform_f(u_deform, deform_x, deform_y, deform_size, max_distortion);
	draw_surface(srf_tunnel, 0, 0);
shader_reset();
	gpu_set_tex_filter(false);
}
else if shd = 3
{
	var_time_var+=0.01;
	shader_set(shdr_backdrop1);
	    shader_set_uniform_f(uni_time_3, var_time_var);
	    shader_set_uniform_f(uni_resolution_3, room_width*1.1, room_height*1.5);
		draw_sprite(spr_bck0,0,0,512)
	shader_reset();
}
else
{
	//Reset time variables to default
	tunnel_offset_x	= 0;
	tunnel_offset_y	= 0
	var_time_var = 0
}

}
