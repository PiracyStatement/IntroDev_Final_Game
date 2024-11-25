/// @description Insert description here
// You can write your code in this editor
function cast()
{	
	with owner
	{
		//var _target = global.enemies[| target_index];
		
		//if (_target != undefined) && (target_index < ds_list_size(global.enemies) - 1)
		//{
		//	var _current_pos = _target.position_in_list();
		//	var _new_pos = _target.position_in_list() + 1;
			
		//	ds_list_delete(global.enemies, _current_pos);
		//	ds_list_insert(global.enemies, _new_pos, _target);
			
		//	obj_enemy_manager.sort_enemy_placements();
		//}
		if (momentum >= other.momentum_cost) && target != undefined
		{
			target.attack_timer = 0;
		
			momentum -= other.momentum_cost;
		}
	}
}