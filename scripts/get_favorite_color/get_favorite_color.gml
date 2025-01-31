function get_favorite_color() {
    var colors = [
        "FF0000", "00FF00", "0000FF", "FFFF00", "800080",
        "FFA500", "FFC0CB", "000000", "FFFFFF", "808080"
    ];
    
    return colors[irandom_range(0, array_length(colors) - 1)];
}