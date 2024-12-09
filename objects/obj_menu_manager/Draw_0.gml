/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_gui_default);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

if draw_ui == true
{
	draw_text(x + (window_get_width() / 2), (window_get_height() / 2) + 50, "[TAB] to switch selected target" + "\n" +
																	"[SPACE] to attack/choose/start");
}