/// @description Insert description here
// You can write your code in this editor
if global.paused == false
{
	if ds_list_size(global.enemies) == 0 && (obj_enemy_manager.enemies_killed == obj_enemy_manager.enemies_kill_goal)
	{
		win();
	}
}