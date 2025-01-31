event_inherited()

image_angle = irandom_range(0,90)

wheel_options = [btn_torreta_off, btn_info]
 
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