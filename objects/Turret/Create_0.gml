event_inherited()

image_angle = irandom_range(0,90)

wheel_options = [btn_torreta_off, btn_info]
 
 alarm[0] = 1
//0 is off
//1 is attack enemies
//2 is attack all
function right_menu(){
	switch mode {
		case 0:
			mode = 1
			wheel_options[0] = btn_torreta_on
		break;
		case 1:
			mode = 2
			wheel_options[0] = btn_torreta_all
		break;
		case 2:
			mode = 0
			wheel_options[0] = btn_torreta_off
		break;
	}
}
 
function top_menu(){
	show_debug_message("top menu opened")
}

function check_if_destroyed (){
	if hp < 0 {instance_destroy()}
}

talk_emote_attributes = {
	emote: speech_bubble,
	timetolive: 60 * 60,
	type_of_emote: 0,
	move_angle: 45,
	initial_size: 0.25,
	incremental: 0.001,
	stay_on_top_of: id,
	flip: false,
	max_size: 1.5,
	min_size: 1,
	break_point:2,
	x_offset: -8,
	y_offset: -15
}

danger_emote_attributes = {
	emote: exclamation,
	timetolive: 1.25 * 60,
	type_of_emote: 2,
	move_angle: 45,
	initial_size: 0.25,
	incremental: 0.009,
	stay_on_top_of: id,
	flip: false,
	max_size: 0.9,
	min_size: 0,
	break_point: 2,
	x_offset: -10,
	y_offset: -18
}