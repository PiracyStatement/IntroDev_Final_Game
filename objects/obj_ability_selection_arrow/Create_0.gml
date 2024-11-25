/// @description Insert description here
// You can write your code in this editor
//default_x = obj_enemy_manager.enemy_zone_x1 + (obj_enemy_manager.enemy_zone_width / 2); //places cursor in the middle of the enemy zone, as though there was only 1 enemy there
default_x = window_get_width();
default_y = window_get_height() + (window_get_height() / 2) + 128;

target_x = default_x;
target_y = default_y;

target_index = 0;

function next_ability()
{
	if ds_list_size(global.abilities_select) > 1
	{
		if target_index == (ds_list_size(global.abilities_select) - 1)
		{
			target_index = 0;
		}
		else
		{
			target_index++;
		}
	}
}

function select_ability()
{
	assign_ability(obj_player, global.abilities_select[| target_index].ability_ref);

	move_to_region();

	broadcast(SIGNAL.ABILITY_CHOSEN);
	global.state = STATE.COMBAT;
	broadcast(SIGNAL.COMBAT_START);
}