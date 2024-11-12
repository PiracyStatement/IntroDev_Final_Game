/// @description Insert description here
// You can write your code in this editor
var _pos = ds_list_find_index(global.enemies, id);
ds_list_delete(global.enemies, _pos);
ds_list_destroy(statuses);
obj_enemy_manager.on_enemy_death();