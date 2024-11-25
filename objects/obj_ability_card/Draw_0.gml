/// @description Insert description here
// You can write your code in this editor
if abs(x - target_x) > 1
{
	x = lerp(x, target_x, 0.15);
}
else
{
	x = target_x;
}
if abs(y - target_y) > 1
{
	y = lerp(y, target_y, 0.15);
}
else
{
	y = target_y;
}

draw_sprite(sprite_index, image_index, x, y);

draw_set_font(fnt_card_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _abil_name = temp_abil.ability_name;

if string_pos(" ", _abil_name) != 0 //if there are spaces in the name, make each word a new line
{
	_abil_name = string_replace(_abil_name, " ", "\n");
}

_abil_name = string_concat(_abil_name, "\n", "<", temp_abil.momentum_cost, ">");
draw_text(bbox_left + 12, bbox_top + 16, _abil_name);


if hovered == true
{
	draw_set_font(fnt_gui_default);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);

	draw_text_ext(window_get_width() / 2, window_get_height() * 2, temp_abil.ability_description, 20, 600); //window_get_height() * 2 because it is 2 screens down
}