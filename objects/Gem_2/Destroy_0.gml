if !amInvisible
{
	if create_col 
	{
		with(instance_position(x,y-64,Gem_2)) {dont_fall_yet = true; alarm[7] = 10}
	}
	var diss = instance_create_depth(x,y,depth,MyDiss)
			with(diss) 
			{
				image_index = other.skinnum
			}
	#region gempower conditions
				if amHype
				{
					var cube = instance_create(x,y,obj_hypercube_detonate2)
					cube.image_index = hyper_anim
					cube.skin_to_hype = skin_to_hype
					Gamerule_2.hypeOn = true
				}
				else if gempower = 5
				{
					#region gempower 5
					//with(MyGamerule) {points_add(600,false); compliment_add(600)}
					audio_play_sound(snd_septanovaexplode,2,false)
					instance_create(x,y,obj_novaexplode)
					part_particles_create(global.sys_above_gem,x,y,global.partSeptaExplosion,50)
					part_particles_create(global.sys_above_gem,x,y,global.partSeptaExplosion2,5)
					for(i=0;i<=7;i++)
					{	
						var lek = instance_create(MyBoard.x+32*7, MyBoard.y + 64*i, MyLightObj)
						with(lek) skinnum = other.skinnum
					}
					#endregion
				}
				else if gempower = 4
				{
					#region gempower 4
					//with(MyGamerule) {points_add(500,false); compliment_add(500)}
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
				
						if position_meeting(x - (i-2)*64,MyBoard.y+32*7,MyBoard) 
						{
							le[i] = instance_create(x - (i-2)*64,MyBoard.y+32*7,MyLightObj)
							with(le[i]) {skinnum = other.skinnum; image_angle = 90}
						}
					}
					#endregion
				}
				else if gempower = 3
				    {
						#region gempower 3
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
						#endregion
				    }
				else if gempower = 2
				    {
						#region gempower 2
						var le1 = noone;
						var le2 = noone;
				        audio_play_sound(snd_electro,1,false)
				        le1 = instance_create(MyBoard.x +32*7,y,MyLightObj)
				        le2 = instance_create(x,MyBoard.y +32*7,MyLightObj)
				        with(le1) skinnum = other.skinnum
				        with(le2) {image_angle += 90; skinnum = other.skinnum}
						#endregion
				    }
				else if gempower = 1
				{
					#region gempower 1
						magnify(x,y,true)
						var modi = 1
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
					#endregion
				}
	#endregion
}