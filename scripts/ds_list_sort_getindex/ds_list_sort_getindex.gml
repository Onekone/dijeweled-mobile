///@param list
///@param ascending
///@description Sorts a list and returns the index of the value that got sorted as first
var _l = argument0
var _sort = argument1

var _list_indexes = ds_list_create()					//Create a list that will hold exactly what the given list has
ds_list_copy(_list_indexes,_l)							//Copy the given list stuff to the new list
ds_list_sort(_l,_sort)									//Sort the given list
var ret = ds_list_find_index(_list_indexes, _l[| 0])	//Find the index whose value got put in first order
ds_list_destroy(_list_indexes)							//Destroy the dynamic list that we created

//show_message(ret)
return ret;