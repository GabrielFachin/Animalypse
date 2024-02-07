if !window_has_focus() and !instance_exists(oPauseControl)
{
instance_create_depth(0,0,0,oPauseControl)
global.pause = true
}