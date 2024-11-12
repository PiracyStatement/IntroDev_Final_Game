/// @description Insert description here
// You can write your code in this editor
if capture == true
{
	pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
	
	surf = surface_create(display_get_gui_width(),display_get_gui_height());
	surface_set_target(surf);
	
	with (obj_player) //force the player to draw their GUI before our screencap
	{
	    event_perform(ev_draw,ev_gui_begin);
	    event_perform(ev_draw,ev_gui);
	    event_perform(ev_draw,ev_gui_end);
	}

	surface_reset_target();
	pause_screenshot_gui = sprite_create_from_surface(surf, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
	
	capture = false; //we capture the screen right before everything cuts to black, after which we only display that capture
	
	instance_deactivate_all(true);
}