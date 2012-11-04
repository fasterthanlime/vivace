
include allegro5/allegro
include allegro5/allegro_image
include allegro5/allegro_primitives

AL: class {
  init: extern(al_init) static func -> Int
  initImageAddon: extern(al_init_image_addon) static func -> Int
  initPrimitivesAddon: extern(al_init_primitives_addon) static func -> Int

  clearToColor: extern(al_clear_to_color) static func (color: Color)
  flipDisplay: extern(al_flip_display) static func

  rest: extern(al_rest) static func (duration: Float)
}

DisplayMode: cover from ALLEGRO_DISPLAY_MODE {
  width: extern Int
  height: extern Int
  format: extern Int
  refreshRate: extern(refresh_rate) Int

  num: extern(al_get_num_display_modes) static func -> Int
  get: static func (index: Int) -> This {
    mode: This
    al_get_display_mode(index, mode&)
    mode
  }
}

al_get_display_mode: extern func (index: Int, mode: DisplayMode*)

Display: cover from ALLEGRO_DISPLAY* {
  new: extern(al_create_display) static func (width, height: Int) -> This
  destroy: extern(al_destroy_display) func
}

Color:  cover from ALLEGRO_COLOR {
  rgb: extern(al_map_rgb) static func (r, g, b: Int) -> This
}

