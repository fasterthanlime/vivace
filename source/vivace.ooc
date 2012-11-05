
include allegro5/allegro
include allegro5/allegro_image
include allegro5/allegro_primitives

AL: class {
  init: extern(al_init) static func -> Int
  initImageAddon: extern(al_init_image_addon) static func -> Int
  initPrimitivesAddon: extern(al_init_primitives_addon) static func -> Int

  installMouse: extern(al_install_mouse) static func

  clearToColor: extern(al_clear_to_color) static func (color: Color)
  flipDisplay: extern(al_flip_display) static func
  setTargetBitmap: extern(al_set_target_bitmap) static func (bitmap: Bitmap)
  drawBitmap: extern(al_draw_bitmap) static func (bitmap: Bitmap, x: Int, y: Int, flags: Int)

  rest: extern(al_rest) static func (duration: Float)

  getMouseEventSource: extern(al_get_mouse_event_source) static func -> EventSource
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
  getBackbuffer: extern(al_get_backbuffer) func -> Bitmap
  getEventSource: extern(al_get_timer_event_source) func -> EventSource
}

Color:  cover from ALLEGRO_COLOR {
  rgb: extern(al_map_rgb) static func (r, g, b: Int) -> This
}

Timer: cover from ALLEGRO_TIMER* {
  new: extern(al_create_timer) static func (delay: Float) -> This
  getEventSource: extern(al_get_timer_event_source) func -> EventSource
  start: extern(al_start_timer) func
  destroy: extern(al_destroy_timer) func
}

Bitmap: cover from ALLEGRO_BITMAP* {
  new: extern(al_create_bitmap) static func (width, height: Int) -> This
  load: extern(al_load_bitmap) static func (path: CString) -> This
  destroy: extern(al_destroy_bitmap) func
  getWidth: extern(al_get_bitmap_width) func -> Int
  getHeight: extern(al_get_bitmap_height) func -> Int
}

EventQueue: cover from ALLEGRO_EVENT_QUEUE* {
  new: extern(al_create_event_queue) static func -> This
  register: extern(al_register_event_source) func (eventSource: EventSource)
  wait: func -> Event {
    event: Event
    al_wait_for_event(this, event&)
    event
  }
  empty?: extern(al_is_event_queue_empty) func -> Bool
  destroy: extern(al_destroy_event_queue) func
}

al_wait_for_event: extern func (queue: EventQueue, event: Event*)

EventType: enum {
  timer: extern(ALLEGRO_EVENT_TIMER)
  displayClose: extern(ALLEGRO_EVENT_DISPLAY_CLOSE)
  mouseAxes: extern(ALLEGRO_EVENT_MOUSE_AXES)
  mouseEnterDisplay: extern(ALLEGRO_EVENT_MOUSE_ENTER_DISPLAY)
  mouseButtonUp: extern(ALLEGRO_EVENT_MOUSE_BUTTON_UP)
}

Event: cover from ALLEGRO_EVENT {
  type: extern EventType

  mouse: extern MouseEvent
}

MouseEvent: cover from ALLEGRO_MOUSE_EVENT {
  x: extern Int
  y: extern Int
  z: extern Int
  w: extern Int
  button: extern UInt
  display: extern Display
}

EventSource: cover from ALLEGRO_EVENT_SOURCE* {
}

