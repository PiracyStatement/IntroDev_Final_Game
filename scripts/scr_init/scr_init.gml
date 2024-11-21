// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// https://www.youtube.com/watch?v=p1zlkXBbTrQ
randomize();

global.enemies = ds_list_create();
global.paused = false;
global.state = STATE.COMBAT;

enum SIGNAL
{
	PLAYER_ATTACKED,
	PLAYER_DAMAGED,
	ENEMY_ATTACKS,
	ENEMY_DAMAGED,
	ENEMY_DIED,
	ZONE_CHANGED
}

enum STATE
{
	COMBAT,
	INTERMISSION
}

// example of applying status to a target:
// apply_status(obj_player, id, STATUS_ID.BLEED, 5);
// id refers to the object inflicting the status, and is usually the instance from which the statement was made
function apply_status(_self_ID, _target_ID, _status_object_name, _duration, _potency = 1) //status_object_name is the object name of the status
{
	with _target_ID
	{
		if instance_exists(statuses)
		{
			var _status = instance_create_layer(0, 0, "Statuses", _status_object_name,
			{
				inflicted_by : _self_ID,
				target : _target_ID,
				duration : _duration,
				potency: _potency
			});
			
			ds_list_add(statuses, _status);
		}
	}
}

function assign_ability(_owner, _ability_object_name)
{
	var _abil = instance_create_layer(0, 0, "Abilities", _ability_object_name,
	{
		owner: _owner
	});

	with _abil
	{
		with owner
		{
			if !is_undefined(abilities) && (ds_list_size(abilities) < max_ability_slots)
			{
				var _occupied_slots_num = ds_list_size(abilities);
			
				switch (_occupied_slots_num)
				{
					case 0:
						other.hotkey = ord("Q");
					break;
				
					case 1:
						other.hotkey = ord("W");
					break;
				
					case 2:
						other.hotkey = ord("E");
					break;
				
					case 3:
						other.hotkey = ord("R");
					break;
				}
			
				ds_list_add(abilities, other.id);
			}
			else
			{
				instance_destroy(other);
			}
		}
	}
}