/// @description Insert description here
// You can write your code in this editor
max_timer = room_speed * duration;

function on_apply()
{
	
}

function on_expire()
{
	var _pos = ds_list_find_index(target.statuses, id);
	ds_list_delete(target.statuses, _pos);
	
	instance_destroy(self);
}