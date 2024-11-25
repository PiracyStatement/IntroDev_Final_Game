/// @description Insert description here
// You can write your code in this editor
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

draw_sprite(sprite_index, image_index, x, y);

draw_set_font(fnt_card_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(bbox_left + 12, bbox_top + 16, string(temp_abil.ability_name));