

global.displayH = display_get_height()
global.displayW = display_get_width()

global.windowW = 1280
global.windowH = 720

window_set_size(global.windowW,global.windowH)

global.cmw = 640 //640 ou 544
global.cmh = 360 //360 ou 306

surface_resize(application_surface,global.cmw + 1,global.cmh + 1)

application_surface_draw_enable(false)

global.follow = oPlayer

y = global.follow.y
x = global.follow.x


xTo = x
yTo = y




global.totaldamage = 0
