draw_self();

if global.debugger_on {
	if path_exists(path){
		draw_path(path,x,y,1)
	}
}