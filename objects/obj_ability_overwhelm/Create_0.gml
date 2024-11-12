/// @description Insert description here
// You can write your code in this editor
function cast()
{
	with owner
	{
		if (momentum >= other.momentum_cost) && target != undefined
		{
			var _health_diff = health_current - target.health_current;
		
			if _health_diff > 0
			{
				target.take_damage(damage_current + _health_diff);
				momentum -= other.momentum_cost;
			}
		}
	}
}