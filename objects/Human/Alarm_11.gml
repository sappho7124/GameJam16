var closest_monster = instance_nearest(x,y,ParentMonsters)
if 100 > point_distance(x, y, closest_monster.x, closest_monster.y){
	monster_detected(closest_monster)
	instance_create_depth(x + -8, y - 15, -450, EmoteForHumans,danger_emote_attributes);
}

alarm_set(11, (irandom_range(5,30))+ 60*3);