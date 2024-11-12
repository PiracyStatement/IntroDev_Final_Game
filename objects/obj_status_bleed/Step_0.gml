/// @description Insert description here
// You can write your code in this editor
if tick == room_speed * tick_rate //deplete target health every tick_rate seconds
{
	tick = 0;
	target.health_current -= potency;
}

tick++;

event_inherited();