
if (!surface_exists(view_surf)) {
    view_surf = surface_create(game_width + 1, game_height + 1);
}
view_surface_id[0] = view_surf;