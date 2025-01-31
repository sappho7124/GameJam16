attacking = noone;

if equipment != noone {
	var gun_created = instance_create_depth(x ,y ,depth, equipment,{
	equiped_to: id,
	});
	equiped = gun_created

}

mode = 0
//0 is off
//1 is attack enemies
//2 is attack all