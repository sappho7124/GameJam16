function get_favorite_animal() {
    var animals = [
        "Dog", "Cat", "Horse", "Eagle", "Dolphin",
        "Tiger", "Wolf", "Panda", "Elephant", "Fox"
    ];
    
    return animals[irandom_range(0, array_length(animals) - 1)];
}