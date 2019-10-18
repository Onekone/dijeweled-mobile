/// @description Insert description here
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,id)) || gamepad_button_check_pressed(global.gp[0],gp_select) || keyboard_check_pressed(ord("P"))
{
if !global.paused
{
	if obj_avalanchedeposit.myturn && Gamerule_1.IsGemActive2 && obj_avalanchedeposit.gems_existing < 64
	{
		with(obj_avalanchedeposit) {avalanche_end_turn(); ammoving = true; Gamerule_1.controlallowed = false}
		audio_play_sound(snd_pass,0,false)
		with(global.mynet)
		{
			buffer_seek(buffer,buffer_seek_start,0)
			buffer_write(buffer,buffer_u8,NN_MATCH_AVALANCHE_PASS)
			network_send_packet(client_socket,buffer,buffer_tell(buffer))
		}
	}
	else audio_play_sound(snd_xplier_illegal,0,false)
}
}