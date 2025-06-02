// Fond noir
draw_clear(c_black);

// Dessiner l'effet de fond avec tiles
if (fxflag >= 1) {
    var zoom = 0.5 + abs(sin(poszi) * 2.5);
    var rot_original = 360/4 * cos(posri * 4 - cos(posri - 0.01));
    
    // Réduire la rotation pour GameMaker
    var rot = rot_original * 0.3;
    
    // Calculer les oscillations
    var osc_amplitude_x = 768/4; // Amplitude originale de l'oscillation X
    var osc_amplitude_y = 536/2.7; // Amplitude originale de l'oscillation Y
    
    var osc_x = osc_amplitude_x * cos(posxi * 4 - cos(posxi - 0.1));
    var osc_y = osc_amplitude_y * -sin(posxi * 2.3 - cos(posxi - 0.1));
    
    // Position centrale de dessin (centre de l'écran + oscillations)
    var center_x = 768/2 + osc_x;
    var center_y = 536/2 + osc_y;
    
    // IMPORTANT: Dessiner depuis le centre du canvas)
    var draw_x = center_x;
    var draw_y = center_y;
    
    // Sauvegarder la matrice de transformation actuelle
    var xx = matrix_get(matrix_world);
    
    // Appliquer les transformations dans le bon ordre :
    // 1. Translater au point de dessin
    // 2. Appliquer rotation et scale
    // 3. Translater de -canvas_w/2, -canvas_h/2 pour centrer
    
    matrix_set(matrix_world, matrix_build(
        draw_x - canvas_w/2 * zoom,  // Position X avec compensation du zoom
        draw_y - canvas_h/2 * zoom,  // Position Y avec compensation du zoom
        0,                           // Z
        0, 0, rot,                   // Rotation
        zoom, zoom, 1                // Scale
    ));
    
    // Dessiner le canvas centré
    draw_surface(surf_tile, 0, 0);
    
    // Restaurer la matrice
    matrix_set(matrix_world, xx);
    
} else {
    // Phase d'intro
    var intro_x = initX + 768/2;
    var intro_y = 270;
    
    // Réduire la rotation d'intro
    var intro_rot = initR * 0.3;
    
    // Même approche avec les matrices pour l'intro
    var xx = matrix_get(matrix_world);
    
    matrix_set(matrix_world, matrix_build(
        intro_x - canvas_w/2,  // Centrer en X
        intro_y - canvas_h/2,  // Centrer en Y
        0,
        0, 0, intro_rot,
        1, 1, 1
    ));
    
    draw_surface(surf_tile, 0, 0);
    
    matrix_set(matrix_world, xx);
}

// Dessiner les scrollers
do_scroller1();
do_scroller2();
do_scroller3();
do_scroller4();

// Masquer le haut de l'écran
draw_rectangle_color(0, 0, 768, 64, c_black, c_black, c_black, c_black, false);

// Dessiner le titre avec rasters
surface_set_target(surf_title);
draw_clear(c_black);

// Dessiner les rasters
draw_sprite_ext(spr_raster, 0, 0, rasterY1, 24, 1, 0, c_white, 1);
draw_sprite_ext(spr_raster, 0, 0, rasterY2, 24, 1, 0, c_white, 1);
draw_sprite_ext(spr_raster, 0, 0, rasterY2 + 72, 24, 1, 0, c_white, 1);

// Dessiner le titre
draw_sprite(spr_title, 0, 0, 0);
surface_reset_target();

// Dessiner la surface du titre avec mouvement oscillant
var title_x = 64 + (768) * cos(logoX);
draw_surface(surf_title, title_x, 14);

// Dessiner les sprites animés
surface_set_target(surf_sprite);
draw_clear_alpha(c_black, 0);

var midx = (canv_w - 32) / 2;  // Ajusté pour un sprite 32x32
var midy = 24 + (canv_h - 32) / 2;
var incy = (canv_h - 64) / 4;  // Ajusté pour la nouvelle taille

for (var s = 0; s < 10; s++) {  // 10 sprites au lieu de 11
    var nit = loop_counter + s * 5;
    var spx = midx + midx * sin(nit/25) * cos(nit/300);
    var spy = midy + incy * sin(nit/37) + incy * cos(nit/17);
    
    // Dessiner le logo complet (pas de découpage)
    draw_sprite(spr_logo, 0, spx, spy);
}
surface_reset_target();

// Dessiner la surface des sprites agrandie
draw_surface_ext(surf_sprite, 0, 0, 2, 2, 0, c_white, 1);