///@param array_to_copy_from
///array_copy_1d(array to copy)
//returns a copy of the array
var array=argument[0,0];
var copy;
var ii, jj;
for (ii=0; ii<array_height_2d(array); ii++)
{	
	for (jj=0; jj<array_length_2d(array,ii); jj++)
	{
		copy[ii,jj] = array[ii,jj]
	}
}

return(copy);