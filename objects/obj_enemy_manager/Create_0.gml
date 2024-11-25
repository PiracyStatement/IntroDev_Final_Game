/// @description Insert description here
// You can write your code in this editor
enemy_zone_x1 = (window_get_width() - 352) - 320; //352 is the distance the player is from the left edge of the screen
enemy_zone_x2 = (window_get_width() - 352) + 320;
enemy_zone_width = enemy_zone_x2 - enemy_zone_x1;

enemy_zone_y = window_get_height() / 2;

enemy_spawn_timer = 0;

enemies_kill_goal = global.regions[global.current_region].enemy_count;
enemies_spawned = 0;
enemies_killed = 0;



receiver = new Receiver();

receiver.add(SIGNAL.ENEMY_DIED, function()
{
	on_enemy_death();
});
receiver.add(SIGNAL.ZONE_CHANGED, function()
{
	enemies_spawned = 0;
	enemies_kill_goal = global.regions[global.current_region].enemy_count;
});
receiver.add(SIGNAL.COMBAT_START, function()
{
	enemy_spawn_timer = room_speed * 1; //make it so that the first enemy spawns in 1 second
});



function sort_enemy_placements()
{
	if ds_list_size(global.enemies) != 0
	{
		var _offset_x = 0;
		
		_offset_x = (enemy_zone_width) / (ds_list_size(global.enemies) + 1); //if there are already 3 enemies present, we need 4 even partitiions, hence the +1
	
		for (var _i = 0; _i < ds_list_size(global.enemies); _i++)
		{
			global.enemies[| _i].target_x = enemy_zone_x1 + (_offset_x * (_i + 1));
			global.enemies[| _i].lerp_speed = 0.15;
			global.enemies[| _i].list_pos_x = enemy_zone_x1 + (_offset_x * (_i + 1));
			global.enemies[| _i].depth = -_i;
		}
	}
}

function spawn_enemy(_enemy, _pos = ds_list_size(global.enemies)) //by default, spawn enemy at the end of the enemy list
{
	var _new_enemy = instance_create_layer(window_get_width() + sprite_width, enemy_zone_y, "Enemies", _enemy, //window_get_width() + sprite_width spawns the enemy just offscreen
	{
		//health_base : irandom_range(10, 30)
	});
	
	_new_enemy.set_list_position(_pos);
	sort_enemy_placements()
	
	return _new_enemy;
}

function reset_spawn_timer()
{
	enemy_spawn_timer = room_speed * irandom_range(5, 15);
}

function on_enemy_death()
{
	enemies_killed++;
	sort_enemy_placements();
}

enemy_spawn_timer = room_speed * 1; //change when you have a proper menu to start the game?