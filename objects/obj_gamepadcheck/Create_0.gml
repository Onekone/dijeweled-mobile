/// @description Insert description here
// You can write your code in this edit
var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)
   {
		if gamepad_is_connected(i) {global.gp[0] = true; break}
   }
global.gp[0] = 0

