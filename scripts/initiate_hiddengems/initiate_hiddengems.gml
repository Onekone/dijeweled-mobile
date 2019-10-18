///@description make hidden gems on empty spots (used for challenge mode)
for (var i =0; i<8;i++)
{
	for (var j = 0; j<8; j++)
	{
		if Gamerule_1.gem_board1[i,j] != noone
		{
			if Gamerule_1.gem_board1[i,j].amInvisible
			{
				instance_destroy(Gamerule_1.gem_board1[i,j])
				Gamerule_1.gem_board1[i,j] = noone
			}
		}
	}
}
for (var j =0; j<8;j++)
{
	var stop = false
	for (var i = 0; i<8; i++)
	{
		if Gamerule_1.gem_board1[i,j] = noone
		{
			var gem = instance_create(Board_1.x + j*64, Board_1.y + i*64,Gem_1)
			gem.amInvisible = true
			with(gem) set_skin(7)
		}
		else stop = true
		if stop break;
	}
}