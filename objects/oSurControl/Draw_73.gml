var wid = window_get_width()
var hei = window_get_height()

if !surface_exists(global.CorpsesSurf)
global.CorpsesSurf = surface_create(wid,hei)
else
{
surface_set_target(application_surface)
draw_surface(global.CorpsesSurf,0,0)
surface_reset_target()
}