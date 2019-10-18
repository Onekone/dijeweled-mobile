/// @description Victory or death
if victory 
{
//with(instance_position(mybomb.x,mybomb.y,Gem)) instance_destroy()
//with(mybomb) event_user(0)
audio_play_sound(bombvictory,0,0)
/*
ended = true
    if rot <= 22.5 dest = 0
    else if rot <= 45 dest = 45
    else if rot <= 67.5 dest = 45
    else if rot <= 90 dest = 90
    else if rot <= 112.5 dest = 90
    else if rot <= 135 dest = 135
    else if rot <= 157.5 dest = 135
    else if rot <= 180 dest = 180
alarm[10] = 1
func = 0
yy = y
alarm[6] = 60*/
alarm[11] = 30
} else {instance_destroy(obj_button_undo); instance_destroy(obj_button_reset); audio_play_sound(snd_bomblose,0,0)}
//else
//{
	//game_over()
//}

ended = true
    if rot <= 22.5 dest = 0
    else if rot <= 45 dest = 45
    else if rot <= 67.5 dest = 45
    else if rot <= 90 dest = 90
    else if rot <= 112.5 dest = 90
    else if rot <= 135 dest = 135
    else if rot <= 157.5 dest = 135
    else if rot <= 180 dest = 180
alarm[10] = 1
func = 0
yy = y
alarm[6] = 60
