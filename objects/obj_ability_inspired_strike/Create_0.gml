/// @description Insert description here
// You can write your code in this editor
function cast()
{
	with owner
	{
		if (momentum >= other.momentum_cost) && target != undefined
		{
			target.take_damage(damage_current * 2)
			
			health_current += ds_list_size(global.enemies);
			
			momentum -= other.momentum_cost;
		}
	}
}