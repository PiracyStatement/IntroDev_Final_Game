/// @description Insert description here
// You can write your code in this editor
if game_won == true || game_lost == true
{
	draw_set_font(fnt_gui_default);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	
	if game_won == true {draw_text(room_width / 2, room_height, "Victory!");}
	else if game_lost == true {draw_text(room_width / 2, room_height, "Defeat!");}
}

