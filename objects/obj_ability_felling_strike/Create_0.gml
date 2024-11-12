/// @description Insert description here
// You can write your code in this editor
function cast()
{
	with owner
	{
		if (momentum >= other.momentum_cost) && target != undefined
		{
			var _percent_damage = 0.15 * (target.health_base);
			
			target.take_damage(damage_current + _percent_damage);
		
			momentum -= other.momentum_cost;
		}
	}
}