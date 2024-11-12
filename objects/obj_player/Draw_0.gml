/// @description Insert description here
// You can write your code in this editor
if abs(x - target_x) > 1
{
	x = lerp(x, target_x, lerp_speed);
}
else
{
	x = target_x;
}
if abs(y - target_y) > 1
{
	y = lerp(y, target_y, lerp_speed);
}
else
{
	y = target_y;
}

if (round(x) == round(target_x)) && (x != default_x) //if you finished moving towards your animation destination, move back towards your default position
{
	target_x = default_x;
}

draw_sprite(sprite_index, image_index, x, y);