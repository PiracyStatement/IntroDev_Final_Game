/// @description Insert description here
// You can write your code in this editor
x = window_get_width() + sprite_width; //spawn just offscreen
y = (window_get_height() / 2) + window_get_height(); //there are 2 screens in the game, one atop the other. abilities to select appear in the middle of the second screen, hence the full height of the top screen (window_get_height()) plus half of the bottom one

target_x = x;
target_y = y;

ds_list_add(global.abilities_select, self);

temp_abil = instance_create_layer(0, 0, "Abilities", ability_ref);



function move_onto_screen()
{
	target_x = (ds_list_find_index(global.abilities_select, self) + 1) * (window_get_width() / (ds_list_size(global.abilities_select) + 1)); //if there are 3 abilities to select from, they must create 4 equadistant parts between themselves, hence the +1
}