///@param GM
///@param mouse_x
///@param mouse_y
///@param canmove
///@param multiswap_allowed
///@param change_xy
var GM = argument0
var canmove = argument3
var multiswap_allowed = argument4
var amnotgamepad = argument5


if !GM.amLocked //&& !GM.ammoving //if gem that we want to check is not locked or moving due to match
		{	
			var domatch = false;
				xlimprevious = xlim
				ylimprevious = ylim
				xlim = GM._j
				ylim = GM._i
				x = Board_1.x + 64*xlim - 32
				y = Board_1.y + 64*ylim - 32
		
				if gem1 = noone //if we havent selected any gems yet
				{
					if !GM.amInvisible //if its not invinsible
					{
						gem1 = GM //we now have gem1
						mouse_xx_pos = argument1
						mouse_yy_pos = argument2	
						GM = noone
						audio_play_sound(snd_gemselection,0,0)
						with(gem1) spin()
					}
					else {gem1 = noone; GM = noone}
				}
				else if gem1 = Gamerule_1.gem_board1[ylim,xlim] //if we have a gem1 and that gem1 is the gem we just selected
				{
					with(gem1) unspin() //unselect
					gem1 = noone
					GM = noone
				}
				else if is_close_distance(gem1,xlim,ylim)
					{
						if canmove && multiswap_allowed
						{
							gem2 = Gamerule_1.gem_board1[ylim,xlim]
							if !gem1.amLit && !gem2.amLit && gem2.acc = 0 && ((gem1.y - Board_1.y) mod 64 <= 1|| (gem1.y - Board_1.y) mod 64 >= 62)
							{
								if (gem1.amHype && gem2.amInvisible) || (gem1.amHype && !Gamerule_1.IsGemActive2) || (gem2.amHype && !Gamerule_1.IsGemActive2)//dont match if hype goes with inv
								{
									gem2 = noone
								}
								else
								{
									with(gem1) unspin()
									xx1 = gem1.x
									yy1 = gem1.y
									xx2 = gem2.x
									yy2 = gem2.y
									//if xx1 == xx2 show_debug_message("CLICK (V): " +string(abs(yy1-yy2)))
									//else show_debug_message("CLICK (H): " +string(abs(xx1-xx2)))
									do_match(Gamerule_1)
									#region match_replay
										if match_replay
										{
											ds_map_add(Gamerule_1.Replay_match_map,string(Gamerule_1.cur_time),Gamerule_1.cur_time)
											var key = "gamepad" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,false)
											var key = "xlim_previous" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,xlimprevious)
											key = "ylim_previous" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,ylimprevious)
											key = "xlim_" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,xlim)
											key = "ylim_" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,ylim)
										}
									#endregion
									domatch = true
								}
							}
							else gem2 = noone
							GM = noone
						}
					}
				else //if gem1 exists, and we select a gem far away
					{
						if !GM.amInvisible
						{
							mouse_xx_pos = argument1
							mouse_yy_pos = argument2
							with(gem1) unspin()
							gem1 = Gamerule_1.gem_board1[ylim,xlim] //make new gem1
							with(gem1) spin()
						}
						//else gem1 = noone
						GM = noone
					}
					
			}
			else GM = noone
return noone;