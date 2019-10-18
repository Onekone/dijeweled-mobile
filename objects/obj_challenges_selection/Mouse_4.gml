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

if global.canbepressed && stati != 1
{	
	global.DIS_quest_category = o.index
	global.DIS_quest_incategory = index
	if o.index != 26 //if its not a custom challenge
	{
		var rm = asset_get_index("rm_quest"+string(o.index)+string(index))
		if room_exists(rm) 
		{
			global.canbepressed = false; 
			global.challenge_desc = o.AR_challenges[o.index,index]; 
			fade_to_room(rm)
		}
	}
	else
	{
		global.challenge_index = index
		if file_exists(string(index)+".ini")
		{
			global.canbepressed = false;	
			global.challenge_desc = custom_description; 
			fade_to_room(rm_quest_custom)
		}
		else
		{
			fade_to_room(rm_quest_editor)
		}
	}
}