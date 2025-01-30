var closest_monster = instance_nearest(x,y,ParentMonsters)
if closest_monster!=noone && 500 > point_distance(x, y, closest_monster.x, closest_monster.y) && current_state != 3{
	monster_detected_guard(closest_monster)
	instance_create_depth(x + -8, y - 15, -450, EmoteForHumans,danger_emote_attributes);
}

alarm_set(11, (irandom_range(5,30))+ 60*3);