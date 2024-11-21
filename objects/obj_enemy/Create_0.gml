/// @description Insert description here
// You can write your code in this editor
health_current = health_base;

attack_speed_mod = 0;
attack_speed_current = attack_speed_base + attack_speed_mod;

attack_timer = 0;
attack_timer_max = room_speed * attack_speed_current;

damage_mod = 0;
damage_current = damage_base + damage_mod;

target = obj_player;

lerp_speed = 0.1;

statuses = ds_list_create();

obj_enemy_manager.enemies_spawned++;



function attack()
{
	if target != undefined
	{
		target.take_damage(damage_current);
		target_x = list_pos_x - clamp(damage_current * 20, 0, 50); //list_pos_x is used to remember which x value, based on the enemy's position in the global.enemies list, to return to after animating for an attack/being hit
		lerp_speed = 0.3;                                           //the clamp() is used to prevent the enemy from moving too far if they deal/are dealt a lot of damage
	}
}

function take_damage(_damage)
{
	health_current -= _damage;
	x = list_pos_x; //reset position if already mid animation to play hit animation in full
	target_x = list_pos_x + clamp(_damage * 10, 0, 50);
	lerp_speed = 0.3;
}

function on_death()
{
	var _pos = ds_list_find_index(global.enemies, id);
	ds_list_delete(global.enemies, _pos);
	ds_list_destroy(statuses);
	
	broadcast(SIGNAL.ENEMY_DIED);
	
	instance_destroy();
}

function position_in_list()
{
	return ds_list_find_index(global.enemies, id);
}

function set_list_position(_pos = ds_list_size(global.enemies))
{
	if _pos == ds_list_size(global.enemies)
	{
		ds_list_add(global.enemies, id);
	}
	else
	{
		ds_list_insert(global.enemies, _pos, id);
	}
}