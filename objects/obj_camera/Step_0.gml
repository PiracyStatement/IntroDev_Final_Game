/// @description Insert description here
// You can write your code in this editor
if abs(x - target_x) > 1
{
	x = lerp(x, target_x, 0.1);
}
else if (x != target_x)
{
	x = target_x;
}
if abs(y - target_y) > 1
{
	y = lerp(y, target_y, 0.1);
}
else if (y != target_y)
{
	y = target_y;
	
	if (y == window_get_height())
	{
		broadcast(SIGNAL.TRANSITION_FINISHED);
	}
}

camera_set_view_pos(view_camera[0], x, y);