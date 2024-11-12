/// @description Insert description here
// You can write your code in this editor
if (enemy_spawn_timer > 0)
{
	enemy_spawn_timer--;
}
else if (ds_list_size(global.enemies) < 4) && (enemies_spawned < enemies_kill_goal)
{
	spawn_enemy(ds_list_size(global.enemies));
	reset_spawn_timer();
}
else
{
	reset_spawn_timer();
}