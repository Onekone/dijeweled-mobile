/// @description Insert description here
// You can write your code in this editor
func += 0.02
image_xscale = lerp(0.1,5,func)
image_yscale = image_xscale
if func >= 1
{
	if !done
	{
		done = true
		var leave = instance_create(0,0,obj_white_fade)
		if (!Gamerule_1.isQuest)
		{
			switch room
			{
				case rm_timeattack:
					leave.room_to_go = rm_stats_normal
					if !file_exists("stats_arcade.ini") stats_create_arcade()
					global.STATS_file = "stats_arcade.ini"
					global.STATS_points = Gamerule_1.points
					global.STATS_level = Gamerule_1.level
					break;
				case rm_twist:
					leave.room_to_go = rm_stats_normal
					if !file_exists("stats_twist.ini") stats_create_twist()
					global.STATS_file = "stats_twist.ini"
					global.STATS_points = Gamerule_1.points
					global.STATS_level = Gamerule_1.level
					break;
				case rm_swift:
					leave.room_to_go = rm_stats_normal
					if !file_exists("stats_swift.ini") stats_create_swift()
					global.STATS_file = "stats_swift.ini"
					global.STATS_points = Gamerule_1.points
					global.STATS_level = Gamerule_1.level
					break;
				case rm_survivor:
					leave.room_to_go = rm_stats_survivor
					if !file_exists("stats_survivor.ini") stats_create_survivor()
					global.STATS_file = "stats_survivor.ini"
					global.STATS_points = Gamerule_1.Moves_Made
					break;
				case rm_blitz:
					leave.room_to_go = rm_stats_blitz
					if !file_exists("stats_blitz"+string(global.timer)+".ini") stats_create_blitz()
					global.STATS_file = "stats_blitz"+string(global.timer)+".ini"
					global.STATS_points = Gamerule_1.points
					break;
				default:
					leave.room_to_go = rm_menu
					break;
			}	
		}
		else
		{
			leave.room_to_go = rm_menu_challenges
		}
	}
}