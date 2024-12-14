/// @description Insert description here
// You can write your code in this editor
capture = false;

game_won = false;
game_lost = false;

zone_name = global.regions[global.current_region].r_zone;
region_name = global.regions[global.current_region].r_name;

popup_text = "";
popup_text_timer = 0;



receiver = new Receiver();

receiver.add(SIGNAL.ZONE_CHANGED, function()
{
	zone_name = global.regions[global.current_region].r_zone;
	region_name = global.regions[global.current_region].r_name;
});
receiver.add(SIGNAL.COMBAT_END, function()
{
	global.state = STATE.INTERMISSION;
	
	if region_name == "Londell Vale"
	{
		win();
	}
});
receiver.add(SIGNAL.TRANSITION_FINISHED, function()
{
	for (var _i = 0; _i < 3; _i++) //present abilities to choose from
	{
		instance_create_layer(0, 0, "Abilities", obj_ability_card,
		{
			ability_ref: choose(obj_ability_felling_strike,
								obj_ability_overwhelm,
								obj_ability_run_through,
								obj_ability_execute,
								obj_ability_inspired_strike,
								obj_ability_kick)
		});
	}
	for (var _n = 0; _n < ds_list_size(global.abilities_select); _n++)
	{
		global.abilities_select[| _n].move_onto_screen();
	}
	
	audio_play_sound(snd_ability_select, 1, false);
	instance_create_layer(window_get_width(), window_get_height() + (window_get_height() / 2) + 128, "Instances", obj_ability_selection_arrow);
});
receiver.add(SIGNAL.ABILITY_CHOSEN, function()
{
	for (var _i = 0; _i < ds_list_size(global.abilities_select); _i++)
	{
		global.abilities_select[| _i].target_x = 0 - global.abilities_select[| _i].sprite_width;
	}
	
	instance_destroy(obj_ability_selection_arrow);
	ds_list_clear(global.abilities_select);
});



function show_popup(_text)
{
	popup_text = _text;
	popup_text_timer = room_speed * 1.5;
}

function pause_game()
{
	if global.paused == false
	{
		global.paused = true;
		capture = true; //we want the screen cap to happen after the GUI is drawn, so we can't deactivate layers yet
	}
	else
	{
		global.paused = false;
		
		instance_activate_all();
	}
}

function win()
{
	game_won = true;
	audio_play_sound(snd_victory, 1, false);
	pause_game();
}

function lose()
{
	game_lost = true;
	audio_play_sound(snd_defeat, 1, false);
	pause_game();
}