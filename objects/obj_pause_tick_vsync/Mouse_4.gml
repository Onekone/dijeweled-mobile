/// @description Insert description here
if global.VSync
{
	image_index = 0
	 global.VSync = false
	 display_reset(display_aa,global.VSync)
}
else
{
	image_index = 1
	global.VSync = true
	display_reset(display_aa,global.VSync)
}

ini_open("settings.ini")
	ini_write_real("Settings","VSync",image_index)
ini_close()