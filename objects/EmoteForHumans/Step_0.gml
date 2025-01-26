if (timetolive > 0) {
    timetolive--;
    switch (type_of_emote) {
        case 0:
            if (stay_on_top_of != noone) {
                x = stay_on_top_of.x + x_offset;
                y = stay_on_top_of.y + y_offset;
            }
        break;

        case 1:
            if (timetolive >= og_timetolive / break_point) {
                if (image_xscale < max_size) {
                    image_xscale += incremental;
                    image_yscale += incremental;
                }
            } else {
                image_xscale -= incremental;
                image_yscale -= incremental;
            }
            if (stay_on_top_of != noone) {
                x = stay_on_top_of.x + x_offset;
                y = stay_on_top_of.y + y_offset;
            }
        break;

        case 2:
            // Grow and shrink logic based on size
            if (timetolive >= og_timetolive / break_point) {
                // Growing phase
                var grow_ratio = 1 - (timetolive - (og_timetolive / break_point)) / (og_timetolive / break_point);
                image_xscale = min_size + (max_size - min_size) * grow_ratio;
                image_yscale = image_xscale; // Keep proportions
            } else {
                // Shrinking phase
                var shrink_ratio = 1 - (timetolive / (og_timetolive / break_point));
                image_xscale = max_size - (max_size - min_size) * shrink_ratio;
                image_yscale = image_xscale; // Keep proportions
                image_alpha = 1 - shrink_ratio; // Fade out as it shrinks
            }

            if (stay_on_top_of != noone) {
                x = stay_on_top_of.x + x_offset;
                y = stay_on_top_of.y + y_offset;
            }
        break;
    }
} else {
    instance_destroy();
}
