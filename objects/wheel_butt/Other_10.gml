if clicked = 0
    {
        clicked = 1
        image_alpha = 0
        with (wheel_spinner)
        {
			acc = maxacc
            if !alreadydone
            {
                if acc >= maxacc //8
                {
                audio_play_sound(timpani,0,0)
                audio_stop_sound(tick)
				
				#region Determine where we fall depending if we need to lose or win!
				    var addmore = 8
					if Gamerule_1.isReplay addmore = 0
					var alarm_index = 1;
					var future_rot = rot + 96+addmore //96 is the angle it completes when deaccelerating + 8 after doing alarm = 1
					if future_rot >= 180 future_rot -= 180


					switch Gamerule_1.bomb_danger
					{
						case 1:
							if !Gamerule_1.bomb_win
							{
								while(future_rot < 68.5 || future_rot > 112)
								{
									alarm_index++
									future_rot += 8
									if future_rot >= 180 future_rot -= 180
								}
							}
							else
							{
								while(future_rot >= 68.5 && future_rot <= 112)
								{
									alarm_index++
									future_rot += 8
									if future_rot >= 180 future_rot -= 180
								}
							}
						break;
						
						case 2:
							if !Gamerule_1.bomb_win
							{
								while(future_rot < 22.5 || future_rot > 112)
								{
									alarm_index++
									future_rot += 8
									if future_rot >= 180 future_rot -= 180
								}
							}
							else
							{
								while(future_rot >= 22.5 && future_rot <= 112)
								{
									alarm_index++
									future_rot += 8
									if future_rot >= 180 future_rot -= 180
								}
							}
						break;
						
						default:
							if !Gamerule_1.bomb_win
							{
								while(future_rot < 22.5 || future_rot > 157.5)
								{
									alarm_index++
									future_rot += 8
									if future_rot >= 180 future_rot -= 180
								}
							}
							else
							{
								while(future_rot >= 22.5 && future_rot <= 157.5)
								{
									alarm_index++
									future_rot += 8
									if future_rot >= 180 future_rot -= 180
								}
							}
						break;
						
						
					}

				#endregion
				alarm[3] = alarm_index
				//======================\\
				wheel_spinner.texttowrite = future_rot
                alreadydone = true
                }
            }
        }
    }

