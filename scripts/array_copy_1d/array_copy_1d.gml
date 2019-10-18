///@param array_to_copy_from
///array_copy_2d(array to copy)
//returns a copy of the array
var _array=argument[0];
var _copy;

for(var _i=0;_i<array_length_1d(_array)  ;_i++)
{
  _copy[_i]=_array[_i];
}

return(_copy);