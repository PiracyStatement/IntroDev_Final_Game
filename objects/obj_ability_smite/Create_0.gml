/// @description Insert description here
// You can write your code in this editor
function cast()
{
	with owner
	{
		if (momentum >= other.momentum_cost) && target != undefined
		{
			var _enem_health = target.take_damage(2 * damage_current);
			
			if _enem_health <= 0
			{
				if target_index > 0
				{
					global.enemies[| target_index - 1].take_damage(damage_current);
				}
				if target_index < ds_list_size(global.enemies) - 1
				{
					global.enemies[| target_index + 1].take_damage(damage_current);
				}
			}
		
			momentum -= other.momentum_cost;
		}
	}
}