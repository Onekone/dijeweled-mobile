/// @description Insert description here
//application_surface_draw_enable(false)
//draw_set_color(c_white)
depth = 10
shd = 1
num_shaders = 3 //0,1,2...
/*0*/
uni_time_2 = shader_get_uniform(shdr_backdrop1,"iTime");
uni_resolution_2 = shader_get_uniform(shdr_backdrop1,"iResolution");

/*1*/
uni_time = shader_get_uniform(shd_wave,"time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_wave,"mouse_pos");
var_mouse_pos_x = mouse_x - camera_get_view_x(0);
var_mouse_pos_y = mouse_y - camera_get_view_y(0);

uni_resolution = shader_get_uniform(shd_wave,"resolution");
var_resolution_x = camera_get_view_width(0);
var_resolution_y = camera_get_view_height(0);

uni_wave_amount = shader_get_uniform(shd_wave,"wave_amount");
var_wave_amount = 20; //higher = more waves

uni_wave_distortion = shader_get_uniform(shd_wave,"wave_distortion");
var_wave_distortion = 80; //higher = less distortion

uni_wave_speed = shader_get_uniform(shd_wave,"wave_speed");
var_wave_speed = .5; //higher = faster

shader_enabled = true
/**/

/*2*/
srf_tunnel = surface_create(room_width, room_height);
srf_backdrop1 = surface_create(room_width, room_height);
tunnel_offset_x	= 0;
tunnel_offset_y	= 0;
u_deform = shader_get_uniform(shdr_tunnel, "deform");
u_light_size = shader_get_uniform(shdr_tunnel, "light_size");
u_gradient_size	= shader_get_uniform(shdr_tunnel, "gradient_size");
u_light_pos	= shader_get_uniform(shdr_tunnel, "light_pos");
u_overlay_str = shader_get_uniform(shdr_tunnel, "overlay_str");
/**/

/*3*/
uni_time_3 = shader_get_uniform(shdr_backdrop2,"iTime");
uni_resolution_3 = shader_get_uniform(shdr_backdrop2,"iResolution");
/**/