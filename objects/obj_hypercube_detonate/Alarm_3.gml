/// @description Insert description here
if instance_number(obj_hypercube_detonate) <= 1 //only me exists
{
	Gamerule_1.moving = false
	Gamerule_1.hypeOn = false
	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_MATCH_HYPE_OFF)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
}
instance_destroy()