///@param points
if Gamerule_1.points_allowed
{
	if Gamerule_1.points_type == 2
	{
		var g = Gamerule_1.points_base_value;
		var value = argument0 + g*(xplier-1)
	}
	else {var value = argument0*xplier}
	points += value
	
	if global.online
	{
		with(global.mynet)
		{
			buffer_seek(buffer,buffer_seek_start,0)
			buffer_write(buffer,buffer_u8,NN_POINTS_ADD)
			buffer_write(buffer,buffer_u16,value)
			network_send_packet(client_socket,buffer,buffer_tell(buffer))
		}
	}
}

