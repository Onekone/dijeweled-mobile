/// @description Insert description here
// You can write your code in this editor
if !global.paused
{
var multiswap_allowed; //if multiswap_allowed is allowed, we dont care if gems are stationary.
if Gamerule_1.multiswap_allowed multiswap_allowed = true
else
{
	if Gamerule_1.IsGemActive2 multiswap_allowed = true
	else multiswap_allowed = false
}
var canmove;
if !Gamerule_1.moving && !dont_swap && !Gamerule_1.lightOn && !Gamerule_1.fruit_exploding && !Gamerule_1.fruit_want_to_spawn && !Gamerule_1.fruit_spawning && Gamerule_1.illegal_cando canmove = true
else canmove = false

if gem1 != noone && !visible //instance_exists(gem1)
{
	#region Refresh xlim,ylim on moving gem
	if gem1.acc != 0
	{
		mouse_xx_pos = gem1.x
		mouse_yy_pos = gem1.y
		xlimprevious = xlim
		ylimprevious = ylim
		xlim = gem1._j
		ylim = gem1._i
		x = Board_1.x + 64*xlim -32
		y = Board_1.y + 64*ylim -32
	}
	#endregion
}

if !Gamerule_1.bombis0 && Gamerule_1.controlallowed && !Gamerule_1.isReplay //&& !global.bot1 && Gamerule_1.summoves2 > 0
{
if (image_index == 1) image_index = 0

if mouse_check_button_pressed(mb_left) //PRESSED ONCE (MOUSE)\\
	{
		if instance_position(mouse_x,mouse_y,Gem_1) != noone //if mouse is onto a gem when clicked
		{
			visible = false
			gemtocheck = instance_position(mouse_x,mouse_y,Gem_1)
			gemtocheck = scr_gem_click_script(gemtocheck,mouse_x,mouse_y,canmove,multiswap_allowed,true)
		}
	}
else if mouse_check_button(mb_left)
	{
		#region MOUSE HOLD
		if !Gamerule_1.lightOn
		{
			if gem1 != noone //instance_exists(gem1)
			{
				if gem1.acc != 0
				{
					mouse_yy_pos = gem1.y
					mouse_xx_pos = gem1.x
					gemtocheck = noone
					xlimprevious = xlim
					ylimprevious = ylim
					xlim = gem1._j
					ylim = gem1._i
				}
				else
				{
					var makematch = false
					var mousexx = mouse_x
					var mouseyy = mouse_y
					if (abs(mouse_xx_pos - mousexx) > 16) || (abs(mouse_yy_pos - mouseyy) > 16)
					{
						if abs(mouse_xx_pos - mousexx) > abs(mouse_yy_pos - mouseyy)
						{
							var makematch = true
							var s = sign(mousexx - mouse_xx_pos)
							if s = -1
							{
								if (xlim + s >= 0)
								{
									 gemtocheck = Gamerule_1.gem_board1[ylim,xlim+s]
								}
							}
							else if s = 1
							{
								if (xlim + s <= 7)
								{
									 gemtocheck = Gamerule_1.gem_board1[ylim,xlim+s]
								}
							}
						}
						else
						{
							var makematch = true
							var s = sign(mouseyy - mouse_yy_pos)
							if s = -1
							{
								if (ylim + s >= 0)
								{
									 gemtocheck = Gamerule_1.gem_board1[ylim+s,xlim]
								}
							}
							else if s = 1
							{
								if (ylim + s <= 7)
								{
									 gemtocheck = Gamerule_1.gem_board1[ylim+s,xlim]
								}
							}
						}
					}
					#region all conditions
					if instance_exists(gemtocheck) && makematch && (gemtocheck != gem1) //gemtocheck != noone
					{
						if gemtocheck.acc = 0 && !gemtocheck.ammoving  && !gemtocheck.amLocked
						{	
							if canmove && multiswap_allowed //!Gamerule_1.moving && !dont_swap && !Gamerule_1.fruit_exploding && !Gamerule_1.fruit_want_to_spawn && !Gamerule_1.fruit_spawning
							{
								gem2 = gemtocheck
								if (gem1._i == gem2._i && abs(gem1._j - gem2._j) == 1) || ((gem1._j == gem2._j) && abs(gem1._i - gem2._i) == 1)
								{
									if gem1.acc = 0 && !gem1.ammoving //!gem1.amLit && !gem2.amLit &&
									{
										if (gem1.amHype && gem2.amInvisible) || (gem1.amHype && !Gamerule_1.IsGemActive2) || (gem2.amHype && !Gamerule_1.IsGemActive2)//dont match if hype goes with inv
										{
											gem2 = noone
											gemtocheck = noone
										}
										else
										{
											xlimprevious = xlim
											ylimprevious = ylim
											xlim = gem2._j
											ylim = gem2._i
											x = Board_1.x + 64*xlim - 32
											y = Board_1.y + 64*ylim - 32
											//if gem1.x == gem2.x show_debug_message("HOLD (V): " +string(abs(gem1.y-gem2.y)))
											//else show_debug_message("HOLD (H): " +string(abs(gem1.x-gem2.x)))
											with(gem1) unspin()
											gemtocheck = noone
											do_match(Gamerule_1)
											#region match_replay
												if match_replay
												{
													ds_map_add(Gamerule_1.Replay_match_map,string(Gamerule_1.cur_time),Gamerule_1.cur_time)
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
											gem2 = noone
										}
									}
									else gem2 = noone
									gemtocheck = noone
								}
								else
								{
									gem2 = noone
									gemtocheck = noone
								}
							}
							else //if canmove = false
							{
								mouse_yy_pos = gem1.y
								mouse_xx_pos = gem1.x
								gemtocheck = noone
								xlimprevious = xlim
								ylimprevious = ylim
								xlim = gem1._j
								ylim = gem1._i
							}
						}
						else gemtocheck = noone
					}
					#endregion
				}
			}
		}
		#endregion
	}
	
#region GAMEPAD
	var press = false
	var distx = 0
	var disty = 0
	#region swap buttons
	if !Gamerule_1.moving
	{
		var condition;
		var xxx,yyy,xxx2,yyy2;
		var swap_pressed = false;
		if gamepad_button_check(global.gp[0],global.GP_swapdown) || keyboard_check(ord("S")) //swap down
		{
			swap_pressed = true
			condition = (ylim < 7)
			xxx = xlim
			xxx2 = xlim
			yyy = ylim
			yyy2 = ylim+1
		}
		else if gamepad_button_check(global.gp[0],global.GP_swapright) || keyboard_check(ord("D"))//swap right
		{
			swap_pressed = true
			condition = (xlim < 7)
			xxx = xlim
			xxx2 = xlim+1
			yyy = ylim
			yyy2 = ylim
		}
		else if gamepad_button_check(global.gp[0],global.GP_swapup) || keyboard_check(ord("W"))//swap up
		{
			swap_pressed = true
			condition = (ylim > 0)
			xxx = xlim
			xxx2 = xlim
			yyy = ylim
			yyy2 = ylim-1
		}
		else if gamepad_button_check(global.gp[0],global.GP_swapleft) || keyboard_check(ord("A"))//swap left
		{
			swap_pressed = true
			condition = (xlim > 0)
			xxx = xlim
			xxx2 = xlim-1
			yyy = ylim
			yyy2 = ylim
		}

		if swap_pressed //swap down
		{
			if condition
			{
				var g1 = instance_position(Board_1.x + 64*xxx,Board_1.y + 64*yyy,Gem_1)
				var g2 = instance_position(Board_1.x + 64*xxx2,Board_1.y + 64*yyy2,Gem_1)
				if instance_exists(g1) && instance_exists(g2)
				{
					if (!g1.amLocked && !g2.amLocked) && (!g1.amInvisible)
					{
						with(gem1) unspin()
						with(gem2) unspin()
						gem1 = g1
						gem2 = g2
						if canmove && multiswap_allowed
						{
							if !gem1.amLit && !gem2.amLit && gem2.acc = 0
							{
								if (gem1.amHype && !Gamerule_1.IsGemActive2) || (gem2.amHype && !Gamerule_1.IsGemActive2)
								{
									gem1 = noone
									gem2 = noone
								}
								else
								{
									with(gem1) unspin()
									with(gem2) unspin()
									xlimprevious = gem1._j
									ylimprevious = gem1._i
									xlim = gem2._j //set xlim, ylim to these values so replay works
									ylim = gem2._i //same for ylim
									xx1 = gem1.x
									yy1 = gem1.y
									xx2 = gem2.x
									yy2 = gem2.y
									do_match(Gamerule_1)
									#region match_replay
										if match_replay
										{
											ds_map_add(Gamerule_1.Replay_match_map,string(Gamerule_1.cur_time),Gamerule_1.cur_time)
											var key = "gamepad" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,false)
											var key = "xlim_previous" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,xxx)
											key = "ylim_previous" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,yyy)
											key = "xlim_" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,xxx2)
											key = "ylim_" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,yyy2)
										}
									#endregion
									xlim = xlimprevious //and return it to the previous position
									ylim = ylimprevious
								}
							}
						}
					}
				}
			}
			gem1 = noone
			gem2 = noone
			gemtocheck = noone
		}
	}
	#endregion

	#region move buttons
	if gamepad_button_check(global.gp[0],gp_padd) || keyboard_check(vk_down)
	{
		//alarm[0] = -1
		press = true
		disty++
	}
	if gamepad_button_check(global.gp[0],gp_padu) || keyboard_check(vk_up)
	{
		//alarm[0] = -1
		press = true
		disty--
	}
	if gamepad_button_check(global.gp[0],gp_padl) || keyboard_check(vk_left)
	{
		//alarm[0] = -1
		press = true
		distx--
	}
	if gamepad_button_check(global.gp[0],gp_padr) || keyboard_check(vk_right)
	{
		//alarm[0] = -1
		press = true
		distx++
	}
	#endregion

	if press
	{
		if (gamepad_can_move <= 0)
		{
			if gamepad_first_hit {gamepad_can_move = 10; gamepad_first_hit = false}
			else {gamepad_can_move = 5}
		var cond;
		visible = true
		#region xlim
		if distx > 0 //right
		{
			cond = (xlim < 7)
		}
		else if distx < 0
		{
			cond = (xlim > 0)
		}
		else cond = false
		
		if cond
		{
			xlimprevious = xlim
			xlim += sign(distx)
			x+= distx*64
		}
		#endregion
		#region ylim
		if disty > 0 //right
		{
			cond = (ylim < 7)
		}
		else if disty < 0
		{
			cond = (ylim > 0)
		}
		else cond = false
		
		if cond
		{
			ylimprevious = ylim
			ylim += sign(disty)
			y+= disty*64
		}
		#endregion
		}
		else gamepad_can_move--
	}
	else {gamepad_can_move = 0; gamepad_first_hit = true} //0 = you can press. 5 = time limit like an alarm
	
#endregion
}

if !Gamerule_1.illegal_cando image_index = 1
else image_index = 0

}
//


