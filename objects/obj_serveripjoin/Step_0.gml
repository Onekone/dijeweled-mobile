/// @description Insert description here
// You can write your code in this editor
if mouse_check_button_pressed(mb_right)
{
	if clipboard_has_text() field = clipboard_get_text()
}

if keyboard_check_pressed(vk_enter)
    {
        
    if field != ""
        {
			global.ip = field
			instance_create(x,y,obj_client)
        }
            
    }

if keyboard_check_pressed(vk_backspace)
    {
    if once field = string_delete(field, string_length(field), 1);
	else
		{
			field = ""
			once = true
		}
    }
else if keyboard_check_pressed(vk_anykey)
    {
    if (keyboard_lastkey > 48 && keyboard_lastkey  < 91) || keyboard_lastchar = "." || keyboard_lastchar = "0"
        {
        if string_length(field) <= 18
            {
				if !once {field = "";once = true}
                field = string(field) + string(keyboard_lastchar)   
            } 
        }
    }




