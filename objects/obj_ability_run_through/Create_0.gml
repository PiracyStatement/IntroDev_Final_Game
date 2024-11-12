/// @description Insert description here
// You can write your code in this editor
function cast()
{
	with owner
	{
		if (momentum >= other.momentum_cost) &&  global.enemies[| 0] != undefined
		{
			global.enemies[| 0].take_damage(damage_current * 2);
			
			if global.enemies[| 1] != undefined
			{
				global.enemies[| 1].take_damage(damage_current);
			}
			
			momentum -= other.momentum_cost;
		}
	}
}