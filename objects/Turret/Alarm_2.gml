try {
	var closest_monster = instance_nearest(x,y,ParentMonsters)
	var closest_human = instance_nearest(x,y,Human)

	var human_distance = point_distance(x,y,closest_human.x,closest_human.y)
	var monster_distance = point_distance(x,y,closest_monster.x,closest_monster.y)

	if human_distance>=monster_distance{
		if closest_monster!=noone && 500 > point_distance(x, y, closest_monster.x, closest_monster.y){
			attacking = closest_monster;
		} else {attacking = noone;}
	} else {
		if closest_human!=noone && 500 > point_distance(x, y, closest_human.x, closest_human.y){
			attacking = closest_human;
		} else {attacking = noone;}
	}
} catch (error) {show_debug_message("Error in turret 2 :(")}

alarm_set(mode, irandom_range(60,80));