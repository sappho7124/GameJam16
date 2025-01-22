var grid_x = floor(x / 16);
var grid_y = floor(y / 16);

mp_grid_clear_cell(global.grid, grid_x, grid_y);

if (is_closed) {
    sprite_index = spr_open;
} else {
    sprite_index = spr_closed;
    mp_grid_add_cell(global.grid, grid_x, grid_y);
}

is_closed = !is_closed;