// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// https://www.youtube.com/watch?v=p1zlkXBbTrQ
randomize();

global.enemies = ds_list_create(); //list containing all spawned enemies
global.abilities_select = ds_list_create(); //list containing the abilities for the player to choose from
global.paused = false;
global.state = STATE.COMBAT;

enum SIGNAL
{
	COMBAT_END,
	TRANSITION_FINISHED,
	ABILITY_CHOSEN,
	ZONE_CHANGED,
	COMBAT_START,
	
	PLAYER_ATTACKED,
	PLAYER_DAMAGED,
	ENEMY_ATTACKS,
	ENEMY_DAMAGED,
	ENEMY_DIED
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

function assign_ability(_owner, _ability_object_name, _slot = -1)
{
	var _abil = instance_create_layer(0, 0, "Abilities", _ability_object_name,
	{
		owner: _owner
	});

	with _abil
	{
		with owner
		{
			if !is_undefined(abilities)
			{
				switch (_slot)
				{
					case -1: //-1, the default _slot value, will insert the ability in the first empty slot
						for(var _i = 0; _i < ds_list_size(abilities); _i++)
						{
							if abilities[| _i] == noone
							{
								ds_list_set(abilities, _i, other.id);
								
								switch (_i)
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
								break;
							}
						}
					break;

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
				
				if (_slot != -1) {ds_list_set(abilities, _slot, other.id);}
			}
			else
			{
				instance_destroy(other);
			}
		}
	}
}