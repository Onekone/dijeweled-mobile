///@param Gem_index
///@description Used on Avalanche Gameover
audio_play_sound(snd_gemdrop,0,0)
if argument0 = 1
{
	with(Gem_1)
	{
		drop = instance_create(x,y,gem_drop)
		with(drop) image_index = other.skinnum
		delete_gem()
	}
}
else
{
	with(Gem_2)
	{
		drop = instance_create(x,y,gem_drop)
		with(drop) image_index = other.skinnum
		delete_gem()
	}
}