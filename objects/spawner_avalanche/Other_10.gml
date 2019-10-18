/// @description Spawn gems in my board
#region obsolete
/*var finished = false
do
{
	var numgems = obj_avalanchedeposit.gems_to_send
	var gaps = Gamerule_1.gaps
	var board = Gamerule_1.gemboard
	var gemcount = instance_number(Gem_1)

	while (gemcount < 64) && (numgems > 0)
	{
		do
		{
			var r = irandom(7) //chose a random gap
		}
		until gaps[r] > 0
		
		gaps[r]--
		numgems--
		gemcount++
		var i = 7
		while(i >= 0) //and put the skin in the board where the gap is
		{
			if board[i,r] == -1
			{
				board[i,r] = irandom(6)
				i = -1
				break;
			}
			else i--
		}
	}
	
//2) make the Gem_1s not match
	var amready2 = false
	var amready = true
	for(i=0;i<=global.board_rows-1;i++)
	{
		for(var j=0;j<=7;j++)
		{
			if i >= 1 && i <= global.board_rows-2
			{
				if (board[i-1,j] == board[i,j]) && (board[i,j] == board[i+1,j]) && board[i,j] != -1
					{
						amready = false
						break;
					}
			}
			
			if j >= 1 && j <= 6
			{
				if (board[i,j-1] == board[i,j]) && (board[i,j] == board[i,j+1]) && board[i,j] != -1
					{
						amready = false
						break;
					}
			}
			
			
		}
	}
	
	//3 always have moves at start
	if amready
		{
			for(i=0;i<8;i++)
			{
				for(j=0;j<=7;j++)
				{
				
						if j <= 6 && i < 6
						{
							if (board[i+1,j] == board[i+2,j+1]) && (board[i+1,j] == board[i,j+1]) && board[i+1,j] != -1
							{
								amready2 = true
								break;
							}
						}
						if j >= 1 && i < 6
						{
							if (board[i+1,j] == board[i+2,j-1]) && (board[i+1,j] == board[i,j-1]) && board[i+1,j] != -1
							{
								amready2 = true
								break;
							}
						}
						if j <= 4 && i < 7
						{
							if (board[i+1,j] == board[i+1,j+2]) && (board[i+1,j] == board[i+1,j+3]) && board[i+1,j] != -1
							{
								amready2 = true
								break;
							}
						}
						if j >= 3 && i < 7
						{
							if (board[i+1,j] == board[i+1,j-2]) && (board[i+1,j] == board[i+1,j-3]) && board[i+1,j] != -1
							{
								amready2 = true
								break;
							}
						}
				
				}
			}
		}
		
	if (amready && amready2) finished = true
}
until finished*/
#endregion

with(Gamerule_1) check_gaps(Board_1)
obj_avalanchedeposit.spawn_invs = true

do
{
	var finished = false
	var numgems = obj_avalanchedeposit.gems_to_send
	var gaps = Gamerule_1.gaps
	var col_num_create = -1;
	for(var i =0; i <8; i++) col_num_create[i] = 0
	var board = Gamerule_1.gemboard
	var gemcount = instance_number(Gem_1)
	var gemstobesorted = 0
	var amready = true; //no matches done by default
	var amready2 = false //no moves found by default
	
	if numgems > 0 //More than 1 gem
	{
		#region More than 1 gem
		#region create all gems in the needed spots
			while (gemcount < 64 && numgems > 0)
			{
				var r = 0
				for(var i = 1; i<8; i++)
				{
					if gaps[i] >= gaps[r]
					{
						r = i
					}
				}

				if gaps[r] > 0
				{
					if board[gaps[r]-1,r] != -1 show_message("not empty board changes skin lol")
					board[gaps[r]-1,r] = irandom(Gamerule_1.num_skin) //make a gem for that place with random skin
					col_num_create[r]++
					gaps[r]--
					gemcount++
					gemstobesorted++
					numgems--
				}
				//ds_list_clear(list)		
			}
		#endregion

	
		if gemstobesorted > 3 //if more than 3 gems spawned
		{
			#region Make them not match
	
			for (var i = 0; i<8; i++)
			{		
				for(var j = 0; j < 8; j++)
				{
					if (j > 0 && j < 7)
					{
						if (board[i,j] == board[i,j-1]) && (board[i,j] == board[i,j+1]) && (board[i,j] != -1)
						{
							amready = false; //we have a cascade :( REDO!
							break;
						}
					}
		
					if (i > 0 && i < 7)
					{
						if (board[i,j] == board[i-1,j]) && (board[i,j] == board[i+1,j]) && (board[i,j] != -1)
						{
							amready = false; //we have a cascade :( REDO!
							break;
						}
					}
				}
				if !amready break; //if we already made a match, get out of this loop
			}
			#endregion
	
			if amready //if we succesfully have no matches done by itself
			{
				#region Make sure we have moves to do
				for(var i = 0; i <8; i++)
				{			
					for(var j =0; j <8; j++)
					{
						//1
						if i > 2
						{
							if board[i,j] == board[i-2,j] && board[i,j] == board[i-3,j] && board[i,j] != -1
							{
								amready2 = true //Yay! we have at least one move to do, we are done here
								break;
							}
						}				
						//2
						if i < 5
						{
							if board[i,j] == board[i+2,j] && board[i,j] == board[i+3,j] && board[i,j] != -1
							{
								amready2 = true //Yay! we have at least one move to do, we are done here
								break;
							}
						}
						//3
						if j < 5
						{
							if board[i,j] == board[i,j+2] && board[i,j] == board[i,j+3] && board[i,j] != -1
							{
								amready2 = true //Yay! we have at least one move to do, we are done here
								break;
							}
						}				
						//4
						if j > 2
						{
							if board[i,j] == board[i,j-2] && board[i,j] == board[i,j-3] && board[i,j] != -1
							{
								amready2 = true //Yay! we have at least one move to do, we are done here
								break;
							}
						}				
						//5
						if (j < 7 && i < 7 && i > 0)
						{
							if board[i,j] == board[i-1,j+1] && board[i,j] == board[i+1,j+1] && board[i,j] != -1
							{
								amready2 = true //Yay! we have at least one move to do, we are done here
								break;
							}
						}				
						//6
						if (j > 0 && i < 7 && i > 0)
						{
							if board[i,j] == board[i-1,j-1] && board[i,j] == board[i+1,j-1] && board[i,j] != -1
							{
								amready2 = true //Yay! we have at least one move to do, we are done here
								break;
							}
						}				
						//7
						if (i > 0 && j < 7 && j > 0)
						{
							if board[i,j] == board[i-1,j-1] && board[i,j] == board[i-1,j+1] && board[i,j] != -1
							{
								amready2 = true //Yay! we have at least one move to do, we are done here
								break;
							}
						}
						//8
						if (i < 7 && j < 7 && j > 0)
						{
							if board[i,j] == board[i+1,j-1] && board[i,j] == board[i+1,j+1] && board[i,j] != -1
							{
								amready2 = true //Yay! we have at least one move to do, we are done here
								break;
							}
						}
					}
					if amready2 break;
				}
				#endregion
			}
		}
		else amready2 = true //no need to search for matches with less than 3 gems spawned.
	
		if (amready && amready2) finished = true
		#endregion
	}
	else
	{
		#region One gem only
		if gemcount < 64
			{
				var r = 0
				for(var i = 1; i<8; i++)
				{
					if gaps[i] >= gaps[r]
					{
						r = i
					}
				}

				if gaps[r] > 0
				{
					var s = irandom(Gamerule_1.num_skin)
					var stop = 0
					while(stop < 4)
					{
						stop = 0
						if r == 0
						{
							if s != board[gaps[r]-1,r+1] && s != board[gaps[r]-1,r+2] stop++
						}
						else
						{
							if r < 7
							{
								if (s != board[gaps[r]-1,r-1] && s!= board[gaps[r]-1,r+1]) stop++
							}
							else stop++
						}
						
						if r == 7
						{
							if s != board[gaps[r]-1,r-1] && s != board[gaps[r]-1,r-2] stop++
						}
						else
						{
							if r < 7
							{
								if (s != board[gaps[r]-1,r-1] || s!= board[gaps[r]-1,r+1]) stop++
							}
							else stop++
						}
						
						if gaps[r]-1 == 0
						{
							if s != board[gaps[r]-1+1,r] && s != board[gaps[r]-1+2,r] stop++
						}
						else
						{
							if gaps[r]-1 < 7
							{
								if (s != board[gaps[r]-1-1,r] && s!= board[gaps[r]-1+1,r]) stop++
							}
							else stop++
						}
						
						if gaps[r]-1 == 7
						{
							if s != board[gaps[r]-1-1,r] && s != board[gaps[r]-1-2,r] stop++
						}
						else
						{
							if gaps[r]-1 < 7
							{
								if (s != board[gaps[r]-1-1,r] || s!= board[gaps[r]-1+1,r]) stop++
							}
							else stop++
						}
						
						if stop < 4 s = irandom(Gamerule_1.num_skin)
					}
					if board[gaps[r]-1,r] != -1 show_message("not empty board changes skin lol")
					board[gaps[r]-1,r] = irandom(Gamerule_1.num_skin) //make a gem for that place with random skin
					col_num_create[r]++
					gaps[r]--
					gemcount++
					gemstobesorted++
					numgems--
					
				}	
			}
			finished = true
		#endregion
	}
}
until finished

obj_avalanchedeposit.gems_to_send = 1
obj_avalanchedeposit.hidden_gems = numgems
var gaps2 = Gamerule_1.gaps
for(var j=0; j<8;j++)
{
	for(var i =0; i < col_num_create[j]; i++)
	{
		var g = instance_create(Board_1.x + j*64, Board_1.y - 64*(i+1), Gem_1)
		var sk = board[gaps2[j]-1,j]
		with(g)
		{
			set_skin(sk)
			#region online
			if Gamerule_1.ONLINE_give_gem_id
			{
				scr_add_gemid(Gamerule_1)
				with(global.mynet)
				{
					buffer_seek(buffer,buffer_seek_start,0)
					buffer_write(buffer,buffer_u8,NN_MATCH_GEM_SPAWN)
					buffer_write(buffer,buffer_u8,j)
					buffer_write(buffer,buffer_u8,sk)
					//SECOND BUFFER\\
					network_send_packet(client_socket,buffer,buffer_tell(buffer))
				}
			}
			#endregion
		}
		gaps2[j]--
	}
}


