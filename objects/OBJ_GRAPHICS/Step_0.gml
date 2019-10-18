/// @description Insert description here
// You can write your code in this editor
//cur_time+
if window_has_focus()
{
		var w = window_get_width()
		var h = window_get_height()
		/* I have to see when the screen size changes so I can reload the surface and make it clean and sharp again */
		if (mysizex != w) || (mysizey != h)
		{	
			//if !window_get_fullscreen() window_set_size(display_get_gui_width(), display_get_gui_width()/(16/9))
			surface_resize(application_surface, w, h)	
		}

		mysizex = w
		mysizey = h
	/*---------------------*/

	if keyboard_check_pressed(vk_f11)
	{
		window_set_fullscreen(!window_get_fullscreen())
		ini_open("settings.ini")
			ini_write_real("Settings","Fullscreen",window_get_fullscreen())
		ini_close()
	}
}