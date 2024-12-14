/// @description Insert description here
// You can write your code in this editor
health_current = health_base;

attack_speed_mod = 0;
attack_speed_current = attack_speed_base + attack_speed_mod;
attack_momentum_cost = 1;

attack_timer = 0;
attack_timer_max = room_speed * attack_speed_current;

damage_mod = 0;
damage_temp = 0;
damage_current = damage_base + damage_mod + damage_temp;

momentum = 0;
max_momentum = 5;

target_index = 0;
target = noone;
prev_list_size = 0;

max_ability_slots = 4;

statuses = ds_list_create();
abilities = ds_list_create();

abilities[| 0] = noone;
abilities[| 1] = noone;
abilities[| 2] = noone;
abilities[| 3] = noone;



default_x = 352;
default_y = window_get_height() / 2;

lerp_speed = 0.1;

x = default_x;
y = default_y;

target_x = x;
target_y = y;



receiver = new Receiver();

receiver.add(SIGNAL.COMBAT_END, function()
{
	attack_timer = 0;
	momentum = 0;
	health_current = health_base;
	damage_temp = 0;
});



function has_status(_status_ID) //_status_ID would be one of the enumerated constants, STATUS_ID.STUN, etc.
{
	var _status_types = ds_list_create();

	for (var _i = 0; _i < ds_list_size(statuses); _i++)
	{
		_status_types[| _i] = ds_list_find_value(statuses, _i).status_ID;
	}

	for (var _i = 0; _i < ds_list_size(_status_types); _i++)
	{
		if _status_types[| _i] == _status_ID
		{
			ds_list_destroy(_status_types);
			return true;
		}
	}
	
	ds_list_destroy(_status_types);
	return false;
}

function attack(_target)
{
	if _target != undefined
	{
		
		_target.take_damage(damage_current);
		target_x = default_x + clamp(damage_current * 20, 0, 50);
		lerp_speed = 0.35;
		
		var _attack_sound = choose(snd_player_attack1, snd_player_attack2, snd_player_attack3);
		audio_play_sound(_attack_sound, 1, false);
	}
}

function take_damage(_damage)
{
	health_current -= _damage;
	x = default_x; //reset position if already mid animation to play hit animation in full
	target_x = default_x - clamp(_damage * 10, 0, 50);
	lerp_speed = 0.3;
}