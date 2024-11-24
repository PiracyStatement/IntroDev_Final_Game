/// @description Insert description here
// You can write your code in this editor
if abs(x - target_x) > 1
{
	x = lerp(x, target_x, 0.1);
}
else
{
	x = target_x;
}
if abs(y - target_y) > 1
{
	y = lerp(y, target_y, 0.1);
}
else
{
	y = target_y;
}

camera_set_view_pos(view_camera[0], x, y);
draw_sprite(sprite_index, image_index, x, y);