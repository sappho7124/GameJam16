function get_flavor_text() {
    var flavor_texts = [
        "A former engineer who was reassigned to the facility after a security breach exposed classified projects.",
        "A dedicated scientist, transferred here due to their expertise in experimental weaponry and AI research.",
        "Once a promising researcher, now burdened with keeping dangerous experiments under control.",
        "A combat veteran who was stationed at the facility after surviving a catastrophic incident on a previous mission.",
        "Rumored to have a hidden agenda, but their file is heavily redacted—no one knows their true purpose here.",
        "Previously an elite security officer, now tasked with overseeing high-risk personnel and research teams.",
        "An ex-hacker who was caught infiltrating classified systems and given a choice: prison or service at the facility.",
        "A scientist whose breakthrough in genetic modifications led to unforeseen consequences, landing them here for containment.",
        "A former field agent with a checkered past, brought in for their experience in crisis situations.",
        "Transferred from another facility after a containment failure, they have seen things most people wouldn’t believe.",
        "Once spilled coffee on a classified document, now legally forbidden from making beverages unsupervised.",
        "Lost an arm in a tragic accident but still insists on arm-wrestling new recruits.",
        "Believes the facility is haunted, even though it's clearly just malfunctioning ventilation.",
        "Once got stuck in an air duct trying to retrieve a lost snack—now permanently banned from maintenance areas.",
        "A former scientist who got reassigned after testing an experiment on themselves. Still glows in the dark a little.",
        "Carries a clipboard everywhere, even though no one has ever seen them write anything on it.",
        "Has an uncanny ability to disappear right before work assignments are handed out.",
        "Claims to have fought a rogue AI but refuses to provide details. Probably just forgot their password.",
        "Refuses to acknowledge the suspicious noises in the storage room—it's someone else's problem now.",
        "Once programmed a security drone to do their paperwork. Now spends half their time trying to fix it." 
    ];
    
    return flavor_texts[irandom_range(0, array_length(flavor_texts) - 1)];
}