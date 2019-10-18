myturn = false
gemsmatched = 0
num_turns++
ammoving = false
xdestination = Board_2.x - 32 + sprite_width/2
with(global.mynet)
{
	buffer_seek(buffer,buffer_seek_start,0)
	buffer_write(buffer,buffer_u8,NN_MATCH_AVALANCHE_END_TURN)
	buffer_write(buffer,buffer_u8,other.gems_to_send) //make pass2 sound effect?
	network_send_packet(client_socket,buffer,buffer_tell(buffer))
}
make_avalanche_compliment()		

var non_inv_gems = 0;
with(Gem_2) {if !amInvisible non_inv_gems++}
hidden_gems = gems_to_send + non_inv_gems - 64
if hidden_gems < 0 hidden_gems = 0
gems_existing = hidden_gems + non_inv_gems
gems_to_send = 1