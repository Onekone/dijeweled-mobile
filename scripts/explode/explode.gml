/// @param Gem
if argument0 = Gem_1 gmrl = Gamerule_1
else gmrl = Gamerule_2
with(gmrl)
	{
		flameon = true
		alarm[5] = 10
	}
audio_play_sound(snd_explode,0,0)
for(i=1;i<=15;i++)
{
	part_particles_create(global.sys_above_gem,irandom_range(x-96,x+96),irandom_range(y-96,y+96),global.gemexplodetype,1)
    part_particles_create(global.sys_above_gem,irandom_range(x-96,x+96),irandom_range(y-96,y+96),global.gemexplodetype2,1)
}
part_particles_create(global.sys_above_gem,x,y,global.gemexplodetype3,1) 
for(i=-1;i<=1;i++)
{
	for(j=-1;j<=1;j++)
	{
		if instance_position(x + 64*j, y + 64*i, argument0) != id with(instance_position(x + 64*j, y + 64*i, argument0))
		{
			if !amPowered && matchme <= 0
			{
				with(other.gmrl) {points_add(20,true); style_add(20,true)}
				create_score_text_big(other.x,other.y,20,false)
				dontshake = true
				if gempower = 0 instance_destroy()
				else if gempower = 6
				{
					if !amFruitExploding
						{
						
							if Gamerule_1.fruit_exploding ds_list_add(Gamerule_1.list_of_fruits,id)
							else
							{
								Gamerule_1.fruit_exploding = true
								fruit_explode()
							}
						}	
						amFruitExploding = true	
				}			
				else alarm[1] = 10
			}
		}
	}
}
//instance_destroy()