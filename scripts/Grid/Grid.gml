function ds_grid_add_row(){
var _grid = argument[0]
ds_grid_resize(_grid,ds_grid_height(_grid),ds_grid_height(_grid)+1)
return (ds_grid_height(_grid)-1)

}





function ds_grid_add_upgrade(_name,_script,_frequency,_sprite){

var _grid = upgrades_grid
var _y = ds_grid_add_row(_grid)

_grid[# 0, _y] = _name
_grid[# 1, _y] = _script
_grid[# 2, _y] = _frequency
_grid[# 3, _y] = _sprite


_grid[# 0, 0] = "Projectiles ++"
_grid[# 1, 0] = -1
_grid[# 2, 0] = -1
_grid[# 3, 0] = -1

}



