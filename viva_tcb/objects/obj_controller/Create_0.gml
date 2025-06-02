// Variables de base
room_width = 768;
room_height = 540;

// Variables pour les effets
logoX = 1.5;
hold = 970;
rasterY1 = 0;
rasterY2 = 72;

// Taille des tiles
tile_w = 256;
tile_h = 256;
canvas_h = 540 * 8;
canvas_w = 768 * 8;

// Variables de timing
BT = current_time;
SX = 0;
SX2 = 0;
SX3 = 0;
SX4 = 0;

// Variables d'initialisation
initX = 0;
initR = 0;

// Textes de scrolling
text1 = "                BILIZIR FROM DMA PRESENTS HIS LATEST GML CONVERSION. THE ORIGINAL IDEA AND SCREEN IS FROM MELLOW MAN USING THE FRAMEWORK CODEF AND THIS IS ANOTHER TRIBUTE TO THE ST LEGENDS 'TCB' !       ";

text2 = "                               WITH GAMEMAKER IT'S TOO EASY TO CREATE THIS KIND OF OLDSCHOOL DEMO, THIS IS THE SECOND CONVERSION I'VE DONE FROM CODEF SCREEN TO GML. WELL, IT'S NOT EXACTLY THE SAME EFFECTS, BUT IT'S CLOSE.             ";

text3 = "                                            YES... THERE IS A THIRD SCROLLTEXT IN THIS SCREEN..... MUCH LIKE ON THE ORIGINAL TCB FULLSCREEN DEMO, WE HAVE MULTIPLE DIFFERENT SCROLLERS... AND THESE ALL HAVE THIS COOL EFFECT ON THEM.... I HOPE YOU LIKE IT.....            ";

text4 = "                                                                               I GUESS WE SHOULD HAVE SOME GREETINGS, AS IT IS A DEMOSCREEN IN THE OLD SCHOOL STYLEE! SO HERE THEY ARE.... THE GREETZ GO OUT TO:  ALL MEMBERS OF DMA (PDM, COCO, JINX, CORWIN, DWORKIN) - MELLOW MAN - NONAMENO - THE UNION (MAD MAX FROM TEX FOR THE MUSIC) - COMMODOREBLOG - ELKMOOSE AND ANYONE ELSE I MAY HAVE MISSED!    LETZ WRAP..............       ";

// Variables d'animation
loop_counter = 0;

// Variables canvas virtuels
canv_w = 768/2;
canv_h = 540/2;

// Variables d'effet
fxflag = 0;
posxi = 0;
poszi = 0; 
posri = 0;

// Variables de debug
debug_frame_count = 0;
debug_log_interval = 60; // Log toutes les 60 frames (1 seconde à 60fps)

// Créer les surfaces pour les canvas virtuels
surf_sprite = surface_create(canv_w, canv_h);
surf_title = surface_create(528, 36);
surf_tile = surface_create(canvas_w, canvas_h);

// Initialiser le pattern de tiles sur la surface
surface_set_target(surf_tile);
draw_clear(c_black);
for (var dx1 = 0; dx1 < canvas_w; dx1 += tile_w) {
    for (var dy1 = 0; dy1 < canvas_h; dy1 += tile_h) {
        draw_sprite(spr_tcb_tile, 0, dx1, dy1);
    }
}
surface_reset_target();

// Démarrer la musique
audio_play_sound(snd_music, 1, true);
