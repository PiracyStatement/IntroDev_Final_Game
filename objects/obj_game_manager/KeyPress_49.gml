/// @description Insert description here
// You can write your code in this editor
move_to_region();

broadcast(SIGNAL.ABILITY_CHOSEN);
global.state = STATE.COMBAT;
broadcast(SIGNAL.COMBAT_START);