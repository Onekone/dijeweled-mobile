/// @description Insert description here

#region keyboard_controls
	var key_right = keyboard_check(vk_right) || gamepad_button_check(global.gp[0],gp_padr);
	var key_left = keyboard_check(vk_left) || gamepad_button_check(global.gp[0],gp_padl);
	var key_down = keyboard_check(vk_down) || gamepad_button_check(global.gp[0],gp_padd);
	var key_up = keyboard_check(vk_up) || gamepad_button_check(global.gp[0],gp_padu);
	
	var mx = mouse_x;
	var my = mouse_y;
	var cycle_cw = gamepad_button_check_pressed(global.gp[0], global.GP_clockwise2) || gamepad_button_check_pressed(global.gp[0], global.GP_clockwise1) || keyboard_check_pressed(vk_space);
	var cycle_ccw = gamepad_button_check_pressed(global.gp[0], global.GP_cclockwise1) || gamepad_button_check_pressed(global.gp[0], global.GP_cclockwise2) || keyboard_check_pressed(vk_shift);
	
	if (os_type != os_android) {
		var cycle_cw = mouse_check_button_pressed(mb_left) || cycle_cw;
		var cycle_ccw = mouse_check_button_pressed(mb_right) || cycle_ccw;
	} else {
		
		var touch_x = [device_mouse_x(0),device_mouse_x(1),device_mouse_x(2),device_mouse_x(3),device_mouse_x(4)];
		var touch_y = [device_mouse_y(0),device_mouse_y(1),device_mouse_y(2),device_mouse_y(3),device_mouse_y(4)];
		
		touchedBoard = false;
		touchedCCW   = false;
		
		// check up to three touches
		for(var i=0;i<2;i++) {
			if (touch_x[i]-Board_1.x) div 64 >= 0 and (touch_x[i]-Board_1.x) div 64 <= 8
			and (touch_y[i]-Board_1.y) div 64 >= 0 and (touch_y[i]-Board_1.y) div 64 <= 8 {
				// else if on the gameboard, set the spinner on the board
				mx = touch_x[i]; my = touch_y[i];
				// and if touch was released that frame, spin it
				if device_mouse_check_button_released(i,mb_left) {
					touchedBoard = true;
				}
			}
			
			// if holding down touch
			if device_mouse_check_button(i,mb_left) {
				// and in the region of directional button, swap to ccw direction
				touchedCCW = (touch_x[i] >= 63 and touch_x[i] < 318 and touch_y[i] >= 843 and touch_y[i] < 970) || touchedCCW;
			} 
			
			
		}
				
		var cycle_cw = (touchedBoard && !touchedCCW) || cycle_cw;
		var cycle_ccw = (touchedBoard && touchedCCW) || cycle_ccw;
	}
#endregion

if (prev_mousey != my || prev_mousex != mx)
{
	keyboard_control = false
}
prev_mousex = mx
prev_mousey = my

var previ = pos_i
var prevj = pos_j

if !keyboard_control
{
pos_j = (mx - Board_1.x) div 64
pos_i = (my - Board_1.y) div 64
}

	#region keyboard/gamepad
	var pres = false
	if key_right { keyboard_control = true; pres = true}
	if key_left {keyboard_control = true; pres = true}
	if key_down { keyboard_control = true; pres = true}
	if key_up {keyboard_control = true; pres = true}
	if pres
	{ 
		if (gamepad_can_move <= 0)
		{
			if gamepad_first_hit {gamepad_can_move = 10; gamepad_first_hit = false}
			else {gamepad_can_move = 5}
			if key_right {if pos_j < 6 pos_j++; keyboard_control = true}
			if key_left {if pos_j > 0 pos_j--;keyboard_control = true}
			if key_down {if pos_i < 6 pos_i++;keyboard_control = true}
			if key_up {if pos_i > 0 pos_i--;keyboard_control = true}
		}
		else gamepad_can_move--
	}
	else {gamepad_can_move = 0; gamepad_first_hit = true}
	#endregion


var out_of_bounds = false

if pos_j == 7 pos_j = 6
else if (pos_j > 7) || (pos_j < 0) {pos_j =-1; out_of_bounds = true}
if pos_i == 7 pos_i = 6
else if (pos_i > 7) || (pos_i < 0) {pos_i = -1; out_of_bounds = true}

rot-= 1 - touchedCCW*2
while rot<0 rot+=360;
while rot>=360 rot-=360;

if !out_of_bounds
{
	if (previ != pos_i || pos_j != prevj) audio_play_sound(snd_twist_select,0,0)
	x = Board_1.x +32 +64*pos_j
	y = Board_1.y + 32 + 64*pos_i
	
	var cc = 0 //clockwise = 1, counter-clockwise = 2, 0 = no mouse pressed
	if cycle_cw { 
		cc = 1
	} else if cycle_ccw {
		cc = 2
	}
	
	if cc != 0
	{
		var canmove;
		if (!Gamerule_1.lightOn && !Gamerule_1.moving && Gamerule_1.controlallowed && !Gamerule_1.bombis0 && !Gamerule_1.fruit_exploding && !Gamerule_1.fruit_want_to_spawn && !Gamerule_1.fruit_spawning && Gamerule_1.illegal_cando) canmove = true
		else canmove = false
		
		if !Gamerule_1.multiswap_allowed && !Gamerule_1.IsGemActive2 //Gamerule_1.moving
		{
			canmove = false
		}
		
		if canmove
		{
			
			var gems;
			gems[0] = Gamerule_1.gem_board1[pos_i,pos_j]
			gems[1] = Gamerule_1.gem_board1[pos_i,pos_j+1]
			gems[2] = Gamerule_1.gem_board1[pos_i+1,pos_j+1]
			gems[3] = Gamerule_1.gem_board1[pos_i+1,pos_j]
		
			var ready = true;
			for(var i = 0; i<4;i++)
			{
				if (gems[i] == noone)
				{
					ready = false
					break;
				}
				else if gems[i].ammoving
				{
					ready = false
					break;
				}
				else if gems[i].acc != 0
				{
					ready = false
					break;
				}
				else if gems[i].amLocked > 0
				{
					ready = false
					break;
				}
			}
			
			if ready
			{
				with(obj_avalanchedeposit) ammoving = true
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_TWIST_SWAP)
						buffer_write(buffer,buffer_u8,gems[0].myid)
						buffer_write(buffer,buffer_u8,gems[1].myid)
						buffer_write(buffer,buffer_u8,gems[2].myid)
						buffer_write(buffer,buffer_u8,gems[3].myid)
						buffer_write(buffer,buffer_u8,cc)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
				Gamerule_1.moving = true
				gems[0].ammoving = true
				gems[1].ammoving = true
				gems[2].ammoving = true
				gems[3].ammoving = true
				var col = instance_create(x-64,y-64,obj_twist_collider)
				with(col)
				{
					for(var i = 0; i<4;i++)
					{
						gem[i] = gems[i]
						gemxxdef[i] = gems[i].x
						gemyydef[i] = gems[i].y
					}
					if cc == 1
					{
						gemxx[0] = gems[0].x + 64 //first gem going right
						gemyy[0] = gems[0].y
						gemxx[1] = gems[1].x	  //second gem going down
						gemyy[1] = gems[1].y  +64
						gemxx[2] = gems[2].x - 64 //third gem going left
						gemyy[2] = gems[2].y
						gemxx[3] = gems[3].x	  //fourth gem going up
						gemyy[3] = gems[3].y - 64
					}
					else
					{
						gemxx[0] = gems[0].x      //first gem going down
						gemyy[0] = gems[0].y + 64
						gemxx[1] = gems[1].x - 64 //second gem going left
						gemyy[1] = gems[1].y
						gemxx[2] = gems[2].x      //third gem going up
						gemyy[2] = gems[2].y - 64
						gemxx[3] = gems[3].x + 64  //fourth gem going right
						gemyy[3] = gems[3].y 
					}
				}
				with(Gamerule_1)
				{
					if !isReplay
					{
						//show_message("I am true now")
						swap_happened = true
						alarm[9] = 1 
					}
					combo = 0
					juststarted = false; 
					gemdestroyonemove =0; 
					reset_compliments()
				}
				var list_of_bombs = Gamerule_1.list_of_bombs
				var list_of_skulls = Gamerule_1.list_of_skulls
				for(i=0;i<ds_list_size(list_of_bombs);i++)
				{
					with(list_of_bombs[| i])
					{
						countdown_decrease()
					}
				}
				for(i=0;i<ds_list_size(list_of_skulls);i++)
				{
					with(list_of_skulls[| i])
					{
						countdown_decrease()
					}
				}
				
			}
		}
	}
	
}

