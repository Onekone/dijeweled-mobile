global.version = "1.3" 
global.canbepressed = false
global.vsync_checked_once = false
global.mynet = noone
if !instance_exists(OBJ_GRAPHICS) instance_create(x,y,OBJ_GRAPHICS)
//discord_init_dll()
//discord_init_app("584549707301519391")
//discord_update_presence("In Main Menu",global.version,"ico_512","")
ini_open("settings.ini")
	global.debug = ini_read_real("Debug","value",false)
ini_close()
if !file_exists("binds.ini")
{
	ini_open("binds.ini")
		ini_write_real("binds","GP_swapdown",gp_face1)
		ini_write_real("binds","GP_swapright",gp_face2)
		ini_write_real("binds","GP_swapleft",gp_face3)
		ini_write_real("binds","GP_swapup",gp_face4)
		ini_write_real("binds","GP_pass",gp_select)
		ini_write_real("binds","GP_replay",gp_shoulderr)
		ini_write_real("binds","GP_clockwise1",gp_face2)
		ini_write_real("binds","GP_clockwise2",gp_face1)
		ini_write_real("binds","GP_cclockwise1",gp_face3)
		ini_write_real("binds","GP_cclockwise2",gp_face4)
	ini_close()
}
read_gamepad_binds()

keyboard_set_map(vk_escape,vk_backspace);
keyboard_set_map(vk_backspace,vk_escape);