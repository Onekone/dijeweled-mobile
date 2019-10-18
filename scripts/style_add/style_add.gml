///@param points
///@param combo_true
var c = combo
if argument1 c = 1
var value = argument0*xplier + c*50*xplier
style += value

if global.online
{
	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_STYLE_ADD)
		buffer_write(buffer,buffer_u16,value)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
}