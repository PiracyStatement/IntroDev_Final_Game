/// @description Insert description here
// You can write your code in this editor
if (momentum >= attack_momentum_cost) && target != undefined
{
	attack(global.enemies[| target_index]);
	momentum -= attack_momentum_cost;
}