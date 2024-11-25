/// @description Insert description here
// You can write your code in this editor
switch (global.state)
{
	case STATE.INTERMISSION:
		if keyboard_check_pressed (vk_tab)
		{
			next_ability();
		}
		
		if keyboard_check_pressed (vk_space)
		{
			select_ability();
		}
	break;
}