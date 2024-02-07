if global.levelup = false and global.pause = true
{

var guiw = display_get_gui_width()

var guih = display_get_gui_height()

draw_set_color(c_black)
draw_set_alpha(0.8)

draw_rectangle(0-1,0,guiw,guih,false)

draw_set_color(c_white)
draw_set_alpha(1)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)



draw_text(guiw/2,guih/2,"PAUSED")
}