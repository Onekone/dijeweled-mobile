/// @description Insert description here
// You can write your code in this editor
if o.index = 26
{
	var stati = custom_status
}
else
{
	var stati = o.AR_status[o.index,index]
}

if stati != 1
{
	alpha = 1
	var i = o.index
	var j = index
	var allow = instance_create(0,0,obj_challenges_allowances)
	with(allow)
	{
		ini_open("challenges.ini")
			var str = string(i)+":"+string(j)
			AR_info[0] = ini_read_string("Info",str+"-Matchless Moves","untick")
			AR_info[1] = ini_read_string("Info",str+"-Challenge Bonus","untick")
			AR_info[2] = ini_read_string("Info",str+"-Multiplier","untick")
			AR_info[3] = ini_read_string("Info",str+"-multiswap_allowed","untick")
			
			AR_info[4] = ini_read_string("Info",str+"-Hypercubes","untick")
			AR_info[5] = ini_read_string("Info",str+"-Bombs","untick")
			AR_info[6] = ini_read_string("Info",str+"-Dooms","untick")
			AR_info[7] = ini_read_string("Info",str+"-Skulls","untick")
			AR_info[8] = ini_read_string("Info",str+"-Locks","untick")
			AR_info[9] = ini_read_string("Info",str+"-Ice","untick")
			AR_info[10] = ini_read_string("Info",str+"-Coals","untick")
			AR_info[11] = ini_read_string("Info",str+"-Time","untick")
			AR_info[12] = ini_read_real("Info",str+"-Difficulty",0)
		ini_close()
	}
}