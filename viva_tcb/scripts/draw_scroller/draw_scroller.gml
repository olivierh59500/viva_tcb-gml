function draw_scroller(text_string, scroll_x, scroller_id, base_y) {
    var t = (current_time - BT) / 1000 + 19;
    var sp = floor(scroll_x / 64);
    var xs = sin(t * 0.25) * 0.5 + 0.5;
    xs = sqrt(1 - xs * xs);
    
    // Reproduire exactement la logique de l'original
    for (var i = sp + 8; i >= sp; i--) {
        if (i >= 0 && i < string_length(text_string)) {
            var z = sin((t + i * 0.15) * 5) * 0.5 + 1.5;
            
            var current_char = string_char_at(text_string, i + 1);
            var char_code = ord(current_char);
            var font_index = map_char_to_font(char_code);
            
            var draw_x = floor((i * 64 - 40 - sin(t * 7 + i * 18) * 32 * xs - scroll_x) * 2);
            var draw_y = floor(sin((t + i * 0.1) * 7) * 42 * (sin(t * 0.5) * 0.5 + 0.5) + base_y - z * 32);
            
            // Calculer l'échelle selon le scroller
            var scale;
            if (scroller_id == 1 || scroller_id == 2) {
                scale = 3 - z; // Scrollers 1 et 2 : échelle inversée
            } else {
                scale = z; // Scrollers 3 et 4 : échelle directe
            }
            
            // Test de visibilité strict
            if (draw_x > -100 && draw_x < 900 && draw_y > -100 && draw_y < 700 && scale > 0.1) {
                draw_sprite_ext(spr_font, font_index, draw_x, draw_y, scale, scale, 0, c_white, 0.9);
            }
        }
    }
    
    // Retourner la nouvelle position de scroll
    return (scroll_x + 4) % (string_length(text_string) * 64);
}