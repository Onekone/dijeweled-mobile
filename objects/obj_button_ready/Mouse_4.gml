/// @description Insert description here
if global.IAMHOST
{
	if global.mynet.client_connected
	{
		if !LOB_circle.enabled
		{
			audio_play_sound(snd_lobby_ready,0,false)
			LOB_circle.enabled = !LOB_circle.enabled
			with(global.mynet)
			{
				buffer_seek(buffer,buffer_seek_start,0)
				buffer_write(buffer,buffer_u8,NN_LBY_READY)
				network_send_packet(client_socket,buffer,buffer_tell(buffer))
			}
		}
	}
}
else
{
	if !LOB_circle2.enabled
	{
		LOB_circle2.enabled = !LOB_circle2.enabled
		{
			audio_play_sound(snd_lobby_ready,0,false)
			with(global.mynet)
			{
				buffer_seek(buffer,buffer_seek_start,0)
				buffer_write(buffer,buffer_u8,NN_LBY_READY)
				network_send_packet(client_socket,buffer,buffer_tell(buffer))
			}
		}
	}
}

if (LOB_circle.enabled && LOB_circle2.enabled)
{
	fade_to_room(rm_ONLINE)
	global.SET_multiswap = LOB_multiswap.enabled
	global.SET_hyper = LOB_hypercubes.enabled
	global.SET_matchless = LOB_matchless.enabled
	global.SET_twist = LOB_twist.enabled
	global.SET_skin = LOB_skins.val
	global.SET_gamemode = LOB_gamemode.val
	global.SET_ultranovas = LOB_ultranovas.enabled
	if (LOB_gamemode.val = 0) global.SET_gamemode2 = LOB_gamemode_2.val
	else if (LOB_gamemode.val = 1) global.SET_gamemode2 = LOB_gamemode_defence.enabled
}
