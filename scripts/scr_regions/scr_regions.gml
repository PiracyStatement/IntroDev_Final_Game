// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
	
//londell
region_londell_narrow_valley =
{
	r_zone : "Londell",
	r_name : "Narrow Valley",
	r_description : "Between the mountains of northern Londell is a narrow passage - south it leads into Londell proper, to the north the Vale Knights guard the way.",
		
	enemy_count : 2,
	difficulty : 1,
	
	r_enemies : [obj_canyon_wolf],
}
region_londell_foothill_forests =
{
	r_zone : "Londell",
	r_name : "Foothill Forests",
	r_description : "Below Londell's northern mountains are some modest forests, home to small hamlets.",
	
	enemy_count : 3,
	difficulty : 2,
	
	r_enemies : [obj_canyon_wolf, obj_forest_bandit],
}
region_londell_londell_vale =
{
	r_zone : "Londell",
	r_name : "Londell Vale",
	r_description : "A vast and clear land, surrounded by mountains. The Londell Castle, situated on elevated terrain, is seen from anywhere in the vale. The great river Lond cuts through the landscape.",
		
	enemy_count : 4,
	difficulty : 3,
	
	r_enemies : [obj_vale_wolf, obj_vale_footpad, obj_mounted_bandit],
}



//deepwood
region_deepwood_tower_groves =
{
	r_zone : "Deepwood",
	r_name : "Tower Groves",
	r_description : "A forest of towering trees and long forgotten ruins, both ancient and foreboding.",
		
	enemy_count : 4,
	difficulty : 5,
}
region_deepwood_isuna =
{
	r_zone : "Deepwood",
	r_name : "Isuna",
	r_description : "Lowlands marked by tidepools and shallows. Derelicts of an old kingdom dot the landscape; now they are home only to marauders.", //Hinterlands?
		
	enemy_count : 5,
	difficulty : 4,
}



//long marsh
region_long_marsh_foglands =
{
	r_zone : "Long Marsh",
	r_name : "Foglands",
	r_description : "A land with few trees and occasional hills. Ancient men of the Long Marsh were burried here.", //Wightbarrow.
		
	enemy_count : 8,
	difficulty : 2,
}
region_long_marsh_verdant_sea =
{
	r_zone : "Long Marsh",
	r_name : "Verdant Sea",
	r_description : "Waves of dense grass swell and cull with the wind. They tallgrasses obscure dangers",
		
	enemy_count : 6,
	difficulty : 3,
}
region_long_marsh_bogseep =
{
	r_zone : "Long Marsh",
	r_name : "Bogseep",
	r_description : "Mud, marsh, and mire - all that the Long Marsh is known for.",
		
	enemy_count : 4,
	difficulty : 5,
}
region_long_marsh_mouths_of_rhyl =
{
	r_zone : "Long Marsh",
	r_name : "Mouths of Rhyl",
	r_description : "The muddy waters clear as they flow out into the sea.",
		
	enemy_count : 5,
	difficulty : 4,
}



//calidon
region_calidon_eastwoods =
{
	r_zone : "Calidon",
	r_name : "Eastwoods",
	r_description : "The idyllic landscapes of Calidon; from peaceful forests to airy clearings.",
		
	enemy_count : 4,
	difficulty : 4,
}
region_calidon_red_meadow =
{
	r_zone : "Calidon",
	r_name : "Red Meadow",
	r_description : "The forests turn sparse approaching the north",
		
	enemy_count : 5,
	difficulty : 5,
}
region_calidon_shales =
{
	r_zone : "Calidon",
	r_name : "Shales",
	r_description : "Rocky flatland tundras stretch far into the distance. Tidepools mark the coastline.", //The North Gate.
		
	enemy_count : 6,
	difficulty : 4,
}



//morodwell
region_morodwell_hard_north =
{
	r_zone : "Morodwell",
	r_name : "Hard North",
	r_description : "The cold, harsh lands of Morodwell.",
		
	enemy_count : 3,
	difficulty : 5,
}
region_morodwell_the_bight =
{
	r_zone : "Morodwell",
	r_name : "The Bight",
	r_description : "To Morodwell's utmost north is a decimated land. Jagged peaks and preciptious ravines halt your travels.",
		
	enemy_count : 1,
	difficulty : 7,
}
	


global.regions = 
[
	region_londell_narrow_valley,
	region_londell_foothill_forests,
	region_londell_londell_vale,
	
	region_deepwood_tower_groves,
	region_deepwood_isuna,
	
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

global.current_region = 0;

function move_to_region(_r = -1) //by default, advance by to the next consecutive region
{
	if _r == -1
	{
		global.current_region++;
	}
	else
	{
		global.current_region = _r;
	}
	
	broadcast(SIGNAL.ZONE_CHANGED);
}