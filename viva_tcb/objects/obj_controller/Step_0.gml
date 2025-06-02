// Clear main canvas
draw_clear(c_black);

// Mise à jour des positions d'effet
if (fxflag >= 1) posxi += 0.008;
if (fxflag >= 2) poszi += 0.003;
if (fxflag >= 3) posri += 0.005;

// Gestion des phases d'effet
if (posxi >= 2) fxflag = 2;
if (poszi >= 1.5) fxflag = 3;

// Animation d'intro
if (fxflag == 0) {
    initX -= 4;
    if (initX <= -(768*2)) initR -= 1;
    if (initR <= -45) fxflag = 1;
}

// Gestion du logo
if (hold >= 1) hold--;
if (hold <= 0) logoX += 0.0125;

// Animation des rasters
rasterY1 -= 2;
rasterY2 -= 2;
if (rasterY1 <= -72) rasterY1 = 72;
if (rasterY2 <= -72) rasterY2 = 72;

// Incrémenter le compteur de boucle
loop_counter++;

// Debug : compter les frames
debug_frame_count++;

// Vérifier que la surface existe
if (!surface_exists(surf_tile)) {
    show_debug_message("ERREUR: surf_tile n'existe plus ! Frame: " + string(debug_frame_count));
    // Recréer la surface si elle n'existe plus
    surf_tile = surface_create(canvas_w, canvas_h);
    surface_set_target(surf_tile);
    draw_clear(c_black);
    for (var dx1 = 0; dx1 < canvas_w; dx1 += tile_w) {
        for (var dy1 = 0; dy1 < canvas_h; dy1 += tile_h) {
            draw_sprite(spr_tcb_tile, 0, dx1, dy1);
        }
    }
    surface_reset_target();
}
