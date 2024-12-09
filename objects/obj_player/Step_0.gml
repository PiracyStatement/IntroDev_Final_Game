/// @description Insert description here
// You can write your code in this editor
switch (global.state)
{
	case STATE.COMBAT:
		if health_current <= 0
		{
			obj_game_manager.lose();
		}
		
		damage_current = damage_base + damage_mod + damage_temp;

		if (ds_list_size(global.enemies) != prev_list_size) //if the list of enemies changed size, do something
		{
			if (target_index > ds_list_size(global.enemies) - 1) && ds_list_size(global.enemies) != 0 //if we were targeting the last enemy on the list and the list decreased in size, causing target_index to exceed the final index of the new list, bring it down until we are on a valid final index again
			{
				target_index = ds_list_size(global.enemies) - 1;
			}
			else if (ds_list_size(global.enemies) > prev_list_size) && target != undefined //if the list increased in size and we had a target selected, change the index so that we are still targetting that same enemy. if a new enemy is added before our target, for instance, this would mean our new target_index has to be 1 greater to stay on the same enemy
			{
				target_index = ds_list_find_index(global.enemies, target);
			}
		}

		target = global.enemies[| target_index];
		prev_list_size = ds_list_size(global.enemies);



		if keyboard_check_pressed (vk_tab)
		{
			if target_index < ds_list_size(global.enemies) - 1
			{
				target_index++
			}
			else if (target_index == ds_list_size(global.enemies) - 1)
			{
				target_index = 0;
			}
		}

		if keyboard_check_pressed(vk_space)
		{
			if (momentum >= attack_momentum_cost) && target != undefined
			{
				attack(global.enemies[| target_index]);
				momentum -= attack_momentum_cost;
			}
			else if (momentum < attack_momentum_cost)
			{
				obj_game_manager.show_popup("Not enough momentum to attack!");
			}
		}



		if(attack_timer < attack_timer_max) && (momentum < max_momentum)
		{
			attack_timer++;
		}
		else
		{
			if momentum < max_momentum
			{
				momentum++;
			}
	
			attack_timer = 0;
		}
	break;
}