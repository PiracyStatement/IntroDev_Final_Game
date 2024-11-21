/// @description Insert description here
// You can write your code in this editor
switch (global.state)
{
	case STATE.COMBAT:
		if (ds_list_size(global.enemies) == 0 && enemies_spawned == enemies_kill_goal)
		{
			move_to_region();
		}
		else if (enemy_spawn_timer > 0)
		{
			enemy_spawn_timer--;
		}
		else if (ds_list_size(global.enemies) < 4) && (enemies_spawned < enemies_kill_goal)
		{
			var _enemy = global.regions[global.current_region].r_enemies[irandom_range(0, array_length(global.regions[global.current_region].r_enemies) - 1)]; //choose a random enemy from the list of possible enemy spawns for that region

			spawn_enemy(_enemy, ds_list_size(global.enemies));
			reset_spawn_timer();
		}
		else
		{
			reset_spawn_timer();
		}
	break;
	
	case STATE.INTERMISSION:
	
	break;
}