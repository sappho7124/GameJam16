function get_random_name() {
    var names = [
        "Ethan Cole", "Mason Hart", "Olivia Reeves", "Jonah Barrett", "Clara Dawson",
        "Lucas Hayes", "Riley Quinn", "Isaac Mercer", "Hannah Foster", "Owen Tate",
        "Emma Holloway", "Jack Monroe", "Ava Sinclair", "Daniel Brooks", "Sophia Carter"
    ];
    
    return names[irandom_range(0, array_length(names) - 1)];
}
