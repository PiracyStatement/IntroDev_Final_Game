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

if (round(x) == round(target_x)) && (x != list_pos_x) //if you finished animating and end up in a different x position than you are supposed to be based on your position in the global.enemies list, lerp back
{
	target_x = list_pos_x;
}

draw_sprite(sprite_index, image_index, x, y);

draw_set_font(fnt_card_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(bbox_left + 12, bbox_top + 16, string(health_current) + "/" + string(health_base));