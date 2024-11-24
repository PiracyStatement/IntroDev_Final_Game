/// @description Insert description here
// You can write your code in this editor
if (global.paused == true) && capture == false
{
	draw_sprite_ext(pause_screenshot, 0 ,0, 0, 1, 1, 0, c_white, 1);
	draw_sprite_ext(pause_screenshot_gui, 0 ,0, 0, 1, 1, 0, c_white, 1);
}

with (obj_player)
{
	draw_set_font(fnt_gui_default);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text(0, 0,
			name + "\n" +
			"Health:" + string(health_current) + "\n" +
			//"Target:" + string(target_index) + "\n" +
			//"Target Ref:" + string(target) + "\n" +
			"Attack Damage:" + string(damage_current) + "\n" +
			"Momentum:" + string(momentum) + "\n" +
			"Attack Charge:" + string(attack_timer));

	if (target != undefined) && variable_instance_exists(target, "health_current") //unexplained occult phenomenon. for some reason, when killing an enemy, the enemy still exists but the game isn't able to do target.health_current, as if only the variable was destroyed
	{
		draw_set_halign(fa_right);
		draw_text(room_width, 0,
				string(target.name) + "\n" +
				"Health:" + string(target.health_current) + "\n" +
				"Attack Damage:" + string(target.damage_current) + "\n" +
				"Attack Charge:" + string(target.attack_timer));
	}



	draw_set_valign(fa_bottom);
	draw_set_halign(fa_left);
	
	if ds_list_size(abilities) > 0
	{
		var _names = ["", "", "", ""];
		//var _types = ["", "", "", ""];
		var _momentum_costs = ["", "", "", ""];
	
		for (var _i = 0; _i < ds_list_size(abilities); _i++)
		{
			_names[_i] = abilities[| _i].ability_name;
			if abilities[| _i].is_activatable
			{
				//_types[_i] = "<Active>";
				_momentum_costs[_i] = abilities[| _i].momentum_cost;
			}
			//else {_types[_i] = "<Passive>";}
		}
	
		draw_text(0, room_height,
			"Q:" + "<" + string(_momentum_costs[0]) + ">" + _names[0] + "\n" +
			"W:" + "<" + string(_momentum_costs[1]) + ">" + _names[1] + "\n" +
			"E:" + "<" + string(_momentum_costs[2]) + ">" + _names[2] + "\n" +
			"R:" + "<" + string(_momentum_costs[3]) + ">" + _names[3] + "\n");
	}

	draw_set_halign(fa_right);

	draw_text(room_width, room_height, string(obj_enemy_manager.enemies_kill_goal - obj_enemy_manager.enemies_spawned) + " enemies remaining");



	draw_set_font(fnt_card_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(bbox_left + 12, bbox_top + 16, string(health_current) + "/" + string(health_base));
}



draw_set_font(fnt_gui_default);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(room_width / 2, 0, string(zone_name) + "\n" + string(region_name));