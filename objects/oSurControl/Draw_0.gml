var wid = window_get_width()
var hei = window_get_height()

if !surface_exists(global.CorpsesSurf)
global.CorpsesSurf = surface_create(wid,hei)
else
draw_surface(global.CorpsesSurf,0,0)
