var going_to_equip = noone;  //Clear initial closest object
var find_guard_max_dis = 999999;

with (Guard) {
    if (equiped = noone) {
        var dis = point_distance(x, y, other.x, other.y);
        if (dis < find_guard_max_dis) {
            going_to_equip = id;
            find_guard_max_dis = dis;
        }
    }
}

if going_to_equip != noone {
	var gun_created = instance_create_depth(going_to_equip.x , going_to_equip.y , going_to_equip.depth, gun,{
	equiped_to: going_to_equip,
	});
	going_to_equip.equiped = gun_created
	instance_destroy()
}