/// @description Insert description here
// You can write your code in this editor
capture = false;

game_won = false;
game_lost = false;

scr_region_init();

regions = 
[
	region_londell_narrow_valley,
	region_londell_foothill_forests,
	region_londell_londell_vale,
	
	region_deepwood_the_strands,
	region_deepwood_tower_groves,
	
	region_long_marsh_verdant_sea,
	region_long_marsh_foglands,
	region_long_marsh_bogseep,
	region_long_marsh_mouths_of_rhyl,
	
	region_calidon_eastwoods,
	region_calidon_red_meadow,
	region_calidon_shales,
	
	region_morodwell_hard_north,
	region_morodwell_the_bight,
]

zone = regions[0].r_zone;
region = 0;

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
	audio_play_sound(snd_win, 1, false);
	pause_game();
}

function lose()
{
	game_lost = true;
	audio_play_sound(snd_lose, 1, false);
	pause_game();
}