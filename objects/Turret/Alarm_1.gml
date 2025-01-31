try {
	var closest_monster = instance_nearest(x,y,ParentMonsters)
	if closest_monster!=noone && 500 > point_distance(x, y, closest_monster.x, closest_monster.y){
		attacking = closest_monster;
	} else {attacking = noone;}
} catch (error) {show_debug_message("Error in turret 1 :(")}

alarm_set(mode, irandom_range(60,80));