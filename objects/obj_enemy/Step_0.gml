/// @description Insert description here
// You can write your code in this editor
if health_current <= 0
{
	on_death();
}

if(attack_timer < attack_timer_max)
{
	attack_timer++;
}
else
{
	attack();
	attack_timer = 0;
}