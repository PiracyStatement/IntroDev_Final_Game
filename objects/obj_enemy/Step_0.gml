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

if layer != layer_get_id("Enemies") //for some reason, instance_create_layer will not set an enemy's layer when the function is called in an expression
{
	layer_add_instance("Enemies", self);
}