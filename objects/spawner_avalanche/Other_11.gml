/// @description Insert description here
var x1,y1,G,mskin;
for(i=0;i<3;i++)
{
	for(j=0;j<8;j++)
	{
		x1 = Board_2.x + 64*j
		y1 = Board_2.y - 64*(i+1)
		mskin = gem_array[i,j]
		G = instance_create_depth(x1, y1,-1,Gem_2) 
		with(G) 
		{
			set_skin(other.gem_array[other.i,other.j])
			scr_add_gemid(Gamerule_2)
		}
	}
}