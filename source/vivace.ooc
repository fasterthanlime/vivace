
include allegro5/allegro

AL: class {
  init: extern(al_init) static func -> Int

  clearToColor: extern(al_clear_to_color) static func (color: Color)
  flipDisplay: extern(al_flip_display) static func

  rest: extern(al_rest) static func (duration: Float)
}

Display: cover from ALLEGRO_DISPLAY* {
  new: extern(al_create_display) static func (width, height: Int) -> This
  destroy: extern(al_destroy_display) func
}

Color:  cover from ALLEGRO_COLOR {
  rgb: extern(al_map_rgb) static func (r, g, b: Int) -> This
}

