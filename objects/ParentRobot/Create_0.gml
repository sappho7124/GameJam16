attacking = noone;

if equipment != noone {
	var gun_created = instance_create_depth(x ,y ,depth, equipment,{
	equiped_to: id,
	});
	equiped = gun_created

}