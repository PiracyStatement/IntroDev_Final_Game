/// @description Insert description here
// You can write your code in this editor
capture = false;

game_won = false;
game_lost = false;

zone_name = global.regions[global.current_region].r_zone;
region_name = global.regions[global.current_region].r_name;



receiver = new Receiver();

receiver.add(SIGNAL.ZONE_CHANGED, function()
{
	zone_name = global.regions[global.current_region].r_zone;
	region_name = global.regions[global.current_region].r_name;
});
receiver.add(SIGNAL.COMBAT_END, function()
{
	global.state = STATE.INTERMISSION;
});

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