/// @description Insert description here
// You can write your code in this editor
function cast()
{
	with owner
	{
		if (momentum >= other.momentum_cost) && target != undefined
		{
			var _enem_health = target.health_current;
			var _enem_health_max = target.health_base;
			
			if (_enem_health_max * 0.25) >= _enem_health
			{
				target.take_damage(_enem_health);
				damage_temp++;
				momentum -= other.momentum_cost;
			}
		}
	}
}