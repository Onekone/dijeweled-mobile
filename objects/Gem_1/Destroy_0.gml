/// @description Begone THOT!
// You can write your code in this editor
if (Gamerule_1.gem_board1[_i,_j] == id) Gamerule_1.gem_board1[_i,_j] =noone

if !amInvisible
{
	#region online
	if global.online
	{
		with(global.mynet)
		{
			buffer_seek(buffer,buffer_seek_start,0)
			buffer_write(buffer,buffer_u8,NN_MATCH_GEM_DEATH)
			buffer_write(buffer,buffer_u8,other.myid)
			buffer_write(buffer,buffer_bool,other.create_col)
			if other.amHype buffer_write(buffer,buffer_u8,other.skin_to_hype)
			network_send_packet(client_socket,buffer,buffer_tell(buffer))
		}
		Gamerule_1.GEM_ID[myid] = -1
	}
	#endregion
	with(obj_avalanchedeposit) event_user(0)
	#region remove gem if selected
		with(player1)
		{
			if (gem1 = other.id) gem1 = noone //delete list of gems in player when this is included
			if (gem2 = other.id) gem2 = noone //delete list of gems in player when this is included
			if (gemtocheck = other.id) gemtocheck = noone
		}
		with(player1_matchreplay)
		{
			if (gem1 = other.id) gem1 = noone //delete list of gems in player when this is included
			if (gem2 = other.id) gem2 = noone //delete list of gems in player when this is included
			if (gemtocheck = other.id) gemtocheck = noone
		}
	#endregion
	
	if Gamerule_1.isQuest
	{
		if obj_quest_control.L_nospecialgems != -1
		{
			if (amHype || gempower > 0)
			{
				obj_quest_control.L_nospecialgems = 1
			}
		}
	}
	if !amHype
	{
		if Gamerule_1.isQuest with(obj_quest_control)
		{
			if (other.amCompanion) L_badgem = true
			switch(other.gempower)
			{
				case 1: S_destroyed_flames++ break;
				case 2: S_destroyed_lights++ break;
				case 3: S_destroyed_novas++ break;
				case 4: S_destroyed_septas++ break;
				case 5: S_destroyed_octas++ break;
				case 6: S_destroyed_fruits++ break;
			}
		}
		#region close call
		if countdown = 0
		{
			if Gamerule_1.combo > 2 Gamerule_1.closecall = true
		}
		#endregion
			

		if MyGamerule.combo >= 1 && !dontshake && !Gamerule_1.fruit_exploding
		{
			add_xymover(MyGem)
		}

		if amCompanion
		{
			audio_play_sound(snd_bombexplosion,0,0)
			part_emitter_region(global.sys_above_gem, global.emit_newstar,x-32,x+32,y-32,y+32,ps_shape_ellipse,ps_distr_gaussian)
			part_emitter_burst(global.sys_above_gem, global.emit_newstar,global.part_companion_br1,5)
			part_emitter_burst(global.sys_above_gem, global.emit_newstar,global.part_companion_br2,4)
			part_emitter_burst(global.sys_above_gem, global.emit_newstar,global.part_companion_br3,2)
			part_emitter_burst(global.sys_above_gem, global.emit_newstar,global.part_companion_br4,5)
		}
		if skinnum != 7 //if im not coal
		{
			#region gempower conditions
	
			if gempower = 5
			{
				#region gempower 5
				if Gamerule_1.isQuest with(obj_quest_control) {if (L_noslightning != -1) L_noslightning = 1}
				//with(MyGamerule) {points_add(600,false); compliment_add(600)}
				audio_play_sound(snd_septanovaexplode,2,false)
				instance_create(x,y,obj_novaexplode)
				part_particles_create(global.sys_above_gem,x,y,global.partSeptaExplosion,50)
				part_particles_create(global.sys_above_gem,x,y,global.partSeptaExplosion2,5)
				for(i=0;i<=7;i++)
				{
					var lk = instance_create(MyBoard.x+32*7, MyBoard.y + 64*i, MyLightKiller)		
					var lek = instance_create(MyBoard.x+32*7, MyBoard.y + 64*i, MyLightObj)
					with(lek) skinnum = other.skinnum
					with(lk) skinnum = other.skinnum
				}
				#endregion
			}
			else if gempower = 4
			{
				#region gempower 4
				if Gamerule_1.isQuest with(obj_quest_control) {if (L_noslightning != -1) L_noslightning = 1}
				//with(MyGamerule) {points_add(500,false); compliment_add(500)}
				//audio_play_sound(snd_novaexplode,1,false)
				audio_play_sound(snd_septanovaexplode,2,false)
				instance_create(x,y,obj_novaexplode)
				part_particles_create(global.sys_above_gem,x,y,global.partSeptaExplosion,50)
				part_particles_create(global.sys_above_gem,x,y,global.partSeptaExplosion2,5)
				for(i=0;i<=4;i++)
				{
					le[i] = noone
					if position_meeting(MyBoard.x +32*7,y + (i-2)*64,MyBoard)
					{
						le[i] = instance_create(MyBoard.x +32*7,y+ (i-2)*64,MyLightObj)		
						with(le[i]) skinnum = other.skinnum
					}
					var lek = instance_create(x,y + (i-2)*64,MyLightKiller)
					with(lek) skinnum = other.skinnum
				
					if position_meeting(x - (i-2)*64,MyBoard.y+32*7,MyBoard) 
					{
						le[i] = instance_create(x - (i-2)*64,MyBoard.y+32*7,MyLightObj)
						with(le[i]) {skinnum = other.skinnum; image_angle = 90}
					}
					var lek = instance_create(x - (i-2)*64,y,MyLightKiller)
					with(lek) skinnum = other.skinnum
				}
				#endregion
			}
			else if gempower = 3
			    {
					#region gempower 3
					if Gamerule_1.isQuest with(obj_quest_control) {if (L_noslightning != -1) L_noslightning = 1}
					var le1 = noone;
					var le2 = noone;
					var le3 = noone;
					var le4 = noone;
					var le5 = noone;
					var le6 = noone;
					//with(MyGamerule) {points_add(300,false); compliment_add(300)}
			        audio_play_sound(snd_novaexplode,1,false)
					instance_create(x,y,obj_novaexplode)
			        if position_meeting(MyBoard.x +32*7,y,MyBoard) le1 = instance_create(MyBoard.x +32*7,y,MyLightObj)
					if position_meeting(MyBoard.x +32*7,y-64,MyBoard) le2 = instance_create(MyBoard.x +32*7,y-64,MyLightObj)
					if position_meeting(MyBoard.x +32*7,y+64,MyBoard) le3 = instance_create(MyBoard.x +32*7,y+64,MyLightObj)
			        if position_meeting(x,MyBoard.y +32*7,MyBoard) le4 = instance_create(x,MyBoard.y +32*7,MyLightObj)
					if position_meeting(x+64,MyBoard.y +32*7,MyBoard) le5 = instance_create(x+64,MyBoard.y +32*7,MyLightObj)
					if position_meeting(x-64,MyBoard.y +32*7,MyBoard) le6 = instance_create(x-64,MyBoard.y +32*7,MyLightObj)
			        with(le4) image_angle += 90
					with(le5) image_angle += 90
					with(le6) image_angle += 90
			        with(le1) skinnum = other.skinnum
			        with(le2) skinnum = other.skinnum
					with(le3) skinnum = other.skinnum
					with(le4) skinnum = other.skinnum
			        with(le5) skinnum = other.skinnum
					with(le6) skinnum = other.skinnum
			        var lek = instance_create(x,y,MyLightKiller) 
					with(lek) skinnum = other.skinnum
					var lek = instance_create(x,y-64,MyLightKiller) 
					with(lek) skinnum = other.skinnum
					var lek = instance_create(x,y+64,MyLightKiller)
					with(lek) skinnum = other.skinnum
					var lek = instance_create(x-64,y,MyLightKiller) 
					with(lek) skinnum = other.skinnum
					var lek = instance_create(x+64,y,MyLightKiller) 
					with(lek) skinnum = other.skinnum
					#endregion
			    }
			else if gempower = 2
			    {
					#region gempower 2
					if Gamerule_1.isQuest with(obj_quest_control) {if (L_noslightning != -1) L_noslightning = 1}
					var le1 = noone;
					var le2 = noone;
			        audio_play_sound(snd_electro,1,false)
			        le1 = instance_create(MyBoard.x +32*7,y,MyLightObj)
			        le2 = instance_create(x,MyBoard.y +32*7,MyLightObj)
			        with(le2) image_angle += 90
			        with(le1) skinnum = other.skinnum
			        with(le2) skinnum = other.skinnum
			        var lek = instance_create(x,y,MyLightKiller)
					with(lek) skinnum = other.skinnum
					#endregion
			    }
			else if gempower = 1
			{
				#region gempower 1
				magnify(x,y,true)
				var modi = 1
				var stle = 0
				if Gamerule_1.isReplay modi = 1.5
				with(MyGamerule) {compliment_add(150)}
				//flame parts
				with(MyGamerule)
				{
					flameon = true
					alarm[5] = 11*modi
				}
					with(MyGem) acc = 0
					audio_play_sound(snd_explode,0,0)
			        for(i=1;i<=15;i++)
			        {
				        part_particles_create(global.sys_above_gem,irandom_range(x-96,x+96),irandom_range(y-96,y+96),global.gemexplodetype,1)
				        part_particles_create(global.sys_above_gem,irandom_range(x-96,x+96),irandom_range(y-96,y+96),global.gemexplodetype2,1)
			        }
			        part_particles_create(global.sys_above_gem,x,y,global.gemexplodetype3,1)
					for (var I=-1;I<=1;I++)
					{
						for (var J=-1;J<=1;J++)
						{
							var ITOUSE = clamp(_i + I, 0, 7)
							var JTOUSE = clamp(_j + J, 0, 7)
							if (i!=0 || j!=0)
							{
								with(Gamerule_1.gem_board1[ITOUSE,JTOUSE])
								{
									if !amPowered && matchme <= 0
									{
										create_col = false
										make_inv_dis = true
										stle+=20
										create_score_text_big(other.x,other.y,20,false)
										dontshake = true
										if amHype
										{									
											gem_to_hype = other.id
											skin_to_hype = other.skinnum
											instance_destroy()
										}
										else if gempower = 6
										{
											if !amFruitExploding
											{
												if Gamerule_1.fruit_exploding 
												{
													ds_list_add(Gamerule_1.list_of_fruits,id)
												}
												else
												{
													Gamerule_1.fruit_exploding = true
													fruit_explode()
												}
											}
											amFruitExploding = true
										}
										else if gempower != 1 instance_destroy()
										else 
										{
											alarm[1] = 10*modi
										}
									}
								}
							}
						}
					}
				for(i=-1;i<=1;i++)
				{
					with(instance_position(x + 64*i, y - 128, MyGem)) if !amPowered push_up(MyGem)
				}
				with(MyGamerule) {points_add_nocombo(stle); compliment_add(stle); style_add(stle,false)}
				#endregion
			}
			#endregion
		}
		else if amLocked = 0 && skinnum = 7//if i am coal (and not doom)
		{
			#region coal
			if Gamerule_1.isQuest with(obj_quest_control) S_destroyed_coals++
			instance_create(x,y,obj_coalnova)
			ds_list_delete(Gamerule_1.list_of_coals,ds_list_find_index(Gamerule_1.list_of_coals,id))
			var coal = instance_create(x,y,Coal_break)
			var dex = 0
			repeat(geodenum)
			{		
				var g = instance_create(x,y,geode)
				g.mycoal = coal
				g.myscore = geodenum_points[dex]
				dex++
			}
			#endregion	
		}

		if amexplode explode(MyGem)

		#region dissapearing gem, particles and collision
		if create_col {with(instance_position(x,y-64,Gem_1)) {dont_fall_yet = true; alarm[7] = 10}}
		var diss = instance_create_depth(x,y,depth,MyDiss)
		with(diss) 
		{
			if other.cascade_diss
			{
				scaleplus = 0.08
			}
			
			if !other.anim_happening image_index = other.skinnum 
			else //put the anim sprite index instead of the spr_gems if its spinning
			{
				sprite_index = other.sprite_index
				image_index = other.image_index
			}
			
			if (other.dragXX != 0) || (other.make_inv_dis) image_alpha = 0
		}	

		if global.OPT_lightallowed
		{
			for(i=1;i<=10;i++)
			{
				xr = irandom_range(-32,32)
				yr = irandom_range(-32,32)
				part_particles_create(global.sys_below_gem,x+xr,y+yr,global.pr_gembreak,1)
			}
		}
		#endregion
		
		#region bad gem conditions
		if amBomb //BOMB\\
		{
			destroy_bomb()
		}
		else if amLocked > 0 //LOCKS\\
		{
			if amLocked = 1 //Normal lock
			{
				destroy_lock()	
			}
			else if amLocked = 2 //Doom
			{
				if amBeingLocked = 0
				{
					destroy_doom()
				}
				else
				{
					audio_play_sound(snd_lock_break,0,0)
				}
			}
			else if amLocked = 3 //Ice
			{
				destroy_ice_lock()
				with(Gamerule_1)
				{
					var l = ds_list_size(list_of_hiddengems)
					for(var i = 0; i<l; i++)
					{
						with(list_of_hiddengems[| i]) delete_gem()
					}
					var l = ds_list_size(list_of_ice_locks)
					for(var i = 0; i<l; i++)
					{
						with(list_of_ice_locks[| i]) ice_create_hiddengems()
					}
				}
			}
			else if amLocked = 4 //Skull
			{
				destroy_skull()
			}
			
		}
		#endregion
	}
	else //if i am hypercube
	{
		#region Hypercube
		if Gamerule_1.isQuest with(obj_quest_control)
		{
			S_destroyed_hypes++
		}
		var cube = instance_create(x,y,obj_hypercube_detonate)
		cube.image_index = hyper_anim
		cube.index = skin_to_hype
		cube.gem[0] = gem_to_hype
		#endregion
	}
	
	#region add up destroyed gems on gamerule 1
		with(Gamerule_1)
		{
			if other.allowgemdestroytext
			{
			gemdestroyonemove++
			with(obj_zenify) event_user(0)
			if gemdestroyonemove > 8 && !global.online { instance_destroy(gems_text); instance_create(Board_1.x - 32*7, Board_1.y + (Board_1.sprite_height/2) - 96, gems_text)}
			}
		}
	#endregion
	if Gamerule_1.isQuest with(obj_quest_control) {S_matched_gems++; S_destroyed_gems++}
}