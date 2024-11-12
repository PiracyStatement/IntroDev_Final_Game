/// @description Insert description here
// You can write your code in this editor
if ds_list_size(global.enemies) == 0
{
	x = default_x;
	y = default_y;
}
else if global.enemies[| obj_player.target_index] != undefined
{
	target_x = global.enemies[| obj_player.target_index].x;
	target_y = global.enemies[| obj_player.target_index].y + 128;
	draw_sprite(sprite_index, image_index, x, y);
}

if abs(x - target_x) > 1
{
	x = lerp(x, target_x, 0.25);
}
else
{
	x = target_x;
}
if abs(y - target_y) > 1
{
	y = lerp(y, target_y, 0.25);
}
else
{
	y = target_y;
}