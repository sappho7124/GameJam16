if (timetolive > 0) {
    timetolive--;
	switch type_of_emote{
		case 0:
			if stay_on_top_of =! noone {x=stay_on_top_of.x; y=stay_on_top_of.y}
		break;
		case 1:
			if (timetolive >= og_timetolive/break_point){
				if image_xscale < max_size {
					image_xscale=image_xscale+incremental;
					image_yscale=image_yscale+incremental;
				}
			} else {
				image_xscale=image_xscale-incremental;
				image_yscale=image_yscale-incremental;
			}
			if stay_on_top_of =! noone {x=stay_on_top_of.x; y=stay_on_top_of.y}
		break;
		case 2:
			//idk
		break;
	}
	
} else {
	instance_destroy()
}