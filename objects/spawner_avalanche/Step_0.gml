/// @description Insert description here
if !Gamerule_1.IsGemActive && !Gamerule_1.fruit_exploding && !Gamerule_1.hypeOn && !Gamerule_1.lightOn && Gamerule_1.spawnallowed && !Gamerule_1.flameon
{
	with(Gamerule_1) check_gaps(Board_1)	
	for(j=0;j<=7;j++)
	{
		if obj_avalanchedeposit.hidden_gems > 0
		{
			if Gamerule_1.gaps[j] > 0
			{
				if !collision_line( Board_1.x + j*64, Board_1.y-64, Board_1.x + j*64, Board_1.y+4, Gem_1, false, true ) && !position_meeting(Board_1.x + j*64, Board_1.y, gem_dissappear)
				{
				#region BODY
				var canspawn = true 
				if canspawn
					{
						with(Gamerule_1) check_summoves()				
						//FOR COAL\\					
						Gem_create = instance_create_depth(Board_1.x + j*64,Board_1.y-64,-1,Gem_1)
						obj_avalanchedeposit.hidden_gems--
						acctosend = 0
						idtosend1 = Gem_create.myid
						with(global.mynet)
						{
							buffer_seek(buffer,buffer_seek_start,0)
							buffer_write(buffer,buffer_u8,NN_MATCH_AVALANCHE_HIDDENMINUS)
							network_send_packet(client_socket,buffer,buffer_tell(buffer))
						}
						with(Gem_create) //set same speed
							{						
								#region online
								if Gamerule_1.ONLINE_give_gem_id
								{
									scr_add_gemid(Gamerule_1)
									with(global.mynet)
									{
										buffer_seek(buffer,buffer_seek_start,0)
										buffer_write(buffer,buffer_u8,NN_MATCH_GEM_SPAWN)
										buffer_write(buffer,buffer_u8,other._j)
										buffer_write(buffer,buffer_u8,other.skinnum)
										//SECOND BUFFER\\
										network_send_packet(client_socket,buffer,buffer_tell(buffer))
									}
									
								}
								#endregion
								
								#region Take vsp
								take_othervsp = true //take other vsp if its not glitching
								//unglitch
								if instance_place(x,y,Gem_1)
								{
									take_othervsp = false
									do y--
									until !instance_place(x,y,Gem_1)
								}
								if take_othervsp//get same vertical speed
								{
									l = 1
									found = false
									do
										{
											gemtofind = instance_position(x,y + l*64, Gem_1)
											if gemtofind != noone
												{
													acc = gemtofind.acc
													other.acctosend = acc
													found = true
												}
											l++
										}
									until l > 8 || found = true
								}
								#endregion
							}
					
						if Gamerule_1.summoves2 = 0 && !havedone && Gamerule_1.AHM_allowed// && !Gamerule_1.juststarted
							{
								spawn_script(Gamerule_1,Gem_1)
							}	
					}
				#endregion
				}
			}
		}
	}
}

if Gamerule_1.IsGemActive2
{
	if obj_avalanchedeposit.gems_existing >= 64
	{
		with(obj_music) if !isdanger event_user(0)
	}
	else
	{
		with(obj_music) if isdanger event_user(1)
	}
}