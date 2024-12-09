/// @description Insert description here
// You can write your code in this editor
function cast()
{
	with owner
	{
		if (momentum >= other.momentum_cost) && target != undefined
		{
			var _enemy_health = target.health_current;
			
			if _enemy_health >= 30
			{
				target.take_damage(damage_current * 2);
			}
			else
			{
				target.take_damage(damage_current);
			}
			
			momentum -= other.momentum_cost;
		}
	}
}