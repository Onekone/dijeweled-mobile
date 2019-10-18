/// @description Check how many gaps/empty grids we have in the board
/// @param Board_index
var mylist = ds_list_create()
var yy = argument0.y
var xx = argument0.x
var _gem = Gem_1;
var counter;

for(i=0;i<8;i++)
{
	counter = collision_line_list(xx + i*64, yy - 32, xx + i*64, yy*7 + 32, _gem, false, true,mylist,true)
	gaps[i] = 8 - counter	
}
ds_list_destroy(mylist)
