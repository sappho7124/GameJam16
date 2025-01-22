if global.debugger_on{
	image_index = 0
	global.debugger_on = false
	show_debug_overlay(false); 
} else{
	image_index = 1
	global.debugger_on = true
	show_debug_overlay(true); 
}