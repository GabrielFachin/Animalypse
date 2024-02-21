var window_w = window_get_width()
var window_h = window_get_height()

copy = false
sprite = false
off = false

pausescreen = -1



PauseSurf  = -1


pause_cd = 60

camy = oCamera.y
camx = oCamera.x

with oPlayer
alarm_set(6,other.pause_cd)

//precisa checar se levelup é true ou false, e baseado nisso vai rodar um código de pause diferente