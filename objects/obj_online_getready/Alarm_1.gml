/// @description GO
audio_play_sound(vo_go,0,false)
with(obj_glassbar) ready = true
alarm[2] = 60
with(obj_rotator) alarm[0] = 60
Gamerule_1.controlallowed = true
with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_MATCH_GO)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}

