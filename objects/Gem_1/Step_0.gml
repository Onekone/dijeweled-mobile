if anim_happening && !spinning
{
	if image_index = 0
	{
		if !Gamerule_1.zenify sprite_index = spr_gems
		else {sprite_index = spr_zen_gems}
		shadow_index = spr_shadows
		image_speed = 0
		image_index = skinnum
		anim_happening = false
	}
}


#region accspeed and replay slowmo modifier
	var accspeed = 0.6;
	modifier = 1;
	if Gamerule_1.isReplay
	{
		accspeed = 0.3
		modifier = 2
	}
#endregion

#region xmover/ymover and Bomb

if amBomb || amLocked =2 || amLocked = 4
{
	if !bombappear && amBomb
	{
		if Gamerule_1.IsGemActive
		{
			instance_create(x,y,obj_gemoutlines)
			bombappear = true
			make_infobox(Gamerule_1.FirstTime_Bomb,2)
			audio_play_sound(bomb5,0,0)
		}
	}
	else if countdown <= 7
	{
		if playcountdown
		{
			if (countdown >= 0 && countdown <= 5)
			{
				if Gamerule_1.IsGemActive2
				{
					if amBomb instance_create(x,y,obj_gemoutlines)
					else if (amLocked == 4) instance_create(x,y,obj_skull_glow)
					playcountdown = false
					var snd = asset_get_index("bomb"+string(countdown))
					audio_play_sound(snd,0,0)
				}
			}
		}		
		xmover = irandom_range(countdown-8,8-countdown)
		ymover = irandom_range(countdown-8,8-countdown)
		if countdown = 0
		{
			if (amBomb || amLocked = 2) Gamerule_1.bombis0 = true //if am Bomb/Doom
			else //if am Skull
			{
				if Gamerule_1.IsGemActive2
				{
					if !instance_exists(obj_bombexplosion)
					{
						if _i < 7
						{
							with(Gamerule_1.gem_board1[_i+1,_j])
							{
								part_particles_create(global.sys_above_gem, x, y, global.part_BombSmoke, 3);
								part_particles_create(global.sys_above_gem, x, y, global.part_BombSmoke2, 3);
							}
							instance_destroy(Gamerule_1.gem_board1[_i+1,_j])
							part_particles_create(global.sys_above_gem,x,y+32,global.part_skullgembreak,15)
							audio_play_sound(snd_skull_gem_break,0,0)
							//countdown += obj_skull_control.SkullCounter
						}
						else
						{
							Gamerule_1.controlallowed = false
							Gamerule_1.spawnallowed = false
							Gamerule_1.autosave_allowed = false
							countdown = 20 //something to stop redoing this block of code
							file_delete("autosave_"+string(room_get_name(room)))
							audio_play_sound(snd_bombgameover,0,0)
							audio_play_sound(vo_gameover,0,0)
							var ded = instance_create(x,y,obj_bombexplosion)
							ded.image_index = 0
							ded.sprite_index = spr_skull
							amInvisible = true
						}
					}
				}
			}
		}
	}
	else
	{
		xmover = 0
		ymover = 0
	}
}
else
{
	if shake
	{
		xmover = irandom_range(-2,2)
		ymover = irandom_range(-2,2)
	}
	else
	{
		xmover = xmover2
		ymover = ymover2
	}
}
#endregion

#region Lighting
if MyGamerule.lightOn
{
	if collision_rectangle(x-35,y-35,x+35,y+35,MyLightObj,false,true)
	{
		bloom = true

	}
	else
	{
		bloom = false
	}
}
else bloom = false
#endregion

if !lvlcomplete
{
#region Gem movement and collision
var shouldmove = true
if (ammoving) || (dont_fall_yet) shouldmove = false
else if (amInvisible) shouldmove = false
else if (MyGamerule.lightOn) shouldmove = false
else if (MyGamerule.hypeOn) shouldmove = false
else if (amLocked = 3) shouldmove = false
else if (MyGamerule.fruit_exploding_dontmove) shouldmove = false
//var shouldmove = (!amInvisible && amLocked != 3 && !MyGamerule.hypeOn && !MyGamerule.lightOn && !ammoving && !MyGamerule.fruit_exploding_dontmove)
if shouldmove
{

//if (_i != 7) || acc != 0 //no need to check for collisions at the very bottom
	{		
			acc += accspeed
			if (y + acc > Board_1.y + 512-64)
			{
				acc = 0
				y = Board_1.y + 512-64
			}
			else
			{
				if _i < 0
				{
					var toucher = noone
				}
				else
				{
					var toucher = collision_point(x,y+acc+(sprite_height/2),Gem_1,false,true)
				}
				if (toucher != noone) && (toucher != id)
				{
					if toucher.acc = 0
					{
						acc = 0
						y = toucher.y - toucher.sprite_yoffset - (sprite_height/2)//...find the other y, and depending on the y origin, move it exactly above it
					}
					else if acc >= toucher.acc
					{
						acc = toucher.acc - accspeed
						y = toucher.y - toucher.sprite_yoffset - (sprite_height/2)//...find the other y, and depending on the y origin, move it exactly above it
					}
				}
				else
				{
					if !Gamerule_1.flameon || acc < 0
					{
						y+=acc
					}
					else acc = 0
				}	
			}
			
	}
	//else {acc = 0; y = MyBoard.y + 64*_i}
} else acc = 0




#endregion
}
else
{
	x = Board_1.x + X
}

#region _i and _j
var previous_i = _i
_i = (y-MyBoard.y+63) div 64
_j = (x-MyBoard.x) div 64
if amLocked = 4
{
	if _i > previous_i
	{
		 countdown += obj_skull_control.SkullCounter
	}
	else if (_i < previous_i) countdown -= obj_skull_control.SkullCounter
}
#endregion

#region Gempower particles
var luck,sys;
if gempower > 0 && visible
{
	if gempower = 1
	{
		part_particles_create(global.sys_below_gem,x,y,global.partFire,1)
	}
	else if gempower = 2 //lighting
	{
		luck = irandom(10)
		if luck < 2 sys = global.sys_above_gem
		else sys = global.sys_below_gem
		part_emitter_region(sys,global.emit_newstar,x-32,x+32,y-32,y+32,ps_shape_ellipse,ps_distr_gaussian)
		part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
	}
	else if gempower = 3 //nova
	{
		luck = irandom(10)
		if luck < 2 sys = global.sys_above_gem
		else sys = global.sys_below_gem
		part_emitter_region(sys,global.emit_newstar,x-32,x+32,y-32,y+32,ps_shape_ellipse,ps_distr_gaussian)
		part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
		part_particles_create(global.sys_below_gem,x,y,global.partNovaFire,1)
	}
	else if gempower = 4 //septa
	{
		part_particles_create(global.sys_below_gem,x,y,global.partFire,1)
		part_particles_create(global.sys_below_gem,x,y,global.partCinder,1)
		luck = irandom(10)
		if luck < 2 sys = global.sys_above_gem
		else sys = global.sys_below_gem
		part_emitter_region(sys,global.emit_newstar,x-32,x+32,y-32,y+32,ps_shape_ellipse,ps_distr_gaussian)
		part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
		part_particles_create(choose(global.sys_below_gem,global.sys_above_gem),x,y,global.partSeptafractal,1)
	}
	else if gempower = 5 //octa
	{
		part_particles_create(global.sys_below_gem,x,y,global.partFire,1)
		part_particles_create(global.sys_below_gem,x,y,global.partCinder,1)
		luck = irandom(10)
		if luck < 2 sys = global.sys_above_gem
		else sys = global.sys_below_gem
		part_emitter_region(sys,global.emit_newstar,x-32,x+32,y-32,y+32,ps_shape_ellipse,ps_distr_gaussian)
		part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
		part_particles_create(choose(global.sys_below_gem,global.sys_above_gem),x,y,global.partOctafractal,1)
	}
	else if gempower = 6 //fruit
	{
		if (sprite_index != spr_fruits) sprite_index = spr_fruits
		if amFruitExploding
		{
			xmover = irandom_range(-2,2)
			ymover = irandom_range(-2,2)
		}
		else
		{
			part_particles_create(global.sys_above_gem,x,y,global.part_fruit_sparkles,1)
		}
	}
}
else if amHype && visible
{
	part_particles_create(global.sys_below_gem,irandom_range(x-24,x+24),irandom_range(y-24,y+24),global.part_hypercube,1)
	if alarm[3] = -1 alarm[3] = 2
}
else if amLocked = 2 //Doom
{
	part_type_direction(global.d_g2,100,120,0,1)
    part_particles_create(global.sys_below_gem,x-16,y-32,global.d_g2,1)
    part_type_direction(global.d_g2,100-45,120-45,0,1)
    part_particles_create(global.sys_below_gem,x+16,y-32,global.d_g2,1) 
    part_type_direction(global.d_g1,100,120,0,1)   
    part_particles_create(global.sys_below_gem,x-16,y-32,global.d_g1,2)
    part_type_direction(global.d_g1,100-45,120-45,0,1)
    part_particles_create(global.sys_below_gem,x+16,y-32,global.d_g1,2)
}

#endregion
