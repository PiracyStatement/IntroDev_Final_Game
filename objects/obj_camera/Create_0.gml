/// @description Insert description here
// You can write your code in this editor
x = window_get_width();
y = 0;

target_x = x;
target_y = y;



receiver = new Receiver();

receiver.add(SIGNAL.COMBAT_START, function()
{
	pan_to_top();
});
receiver.add(SIGNAL.COMBAT_END, function()
{
	pan_to_bottom();
});



function pan_to_top()
{
	target_x = 0;
	target_y = 0;
}

function pan_to_bottom()
{
	target_x = 0;
	target_y = window_get_height();
}