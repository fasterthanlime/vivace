
include allegro5/allegro
include allegro5/allegro_image
include allegro5/allegro_primitives

AL: class {
  init: extern(al_init) static func -> Int
  initImageAddon: extern(al_init_image_addon) static func -> Int
  initPrimitivesAddon: extern(al_init_primitives_addon) static func -> Int

  installMouse: extern(al_install_mouse) static func
  installKeyboard: extern(al_install_keyboard) static func

  clearToColor: extern(al_clear_to_color) static func (color: Color)
  flipDisplay: extern(al_flip_display) static func
  setTargetBitmap: extern(al_set_target_bitmap) static func (bitmap: Bitmap)
  drawBitmap: extern(al_draw_bitmap) static func (bitmap: Bitmap, x: Int, y: Int, flags: Int)

  rest: extern(al_rest) static func (duration: Float)

  getMouseEventSource: extern(al_get_mouse_event_source) static func -> EventSource
  getKeyboardEventSource: extern(al_get_keyboard_event_source) static func -> EventSource
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
  keyDown: extern(ALLEGRO_EVENT_KEY_DOWN)
  keyUp: extern(ALLEGRO_EVENT_KEY_UP)
}

Event: cover from ALLEGRO_EVENT {
  type: extern EventType
  
  any: extern AnyEvent
  mouse: extern MouseEvent
  keyboard: extern KeyEvent
}

AnyEvent: cover from ALLEGRO_ANY_EVENT {
  source: extern EventSource
  timestamp: extern Double
}

MouseEvent: cover from ALLEGRO_MOUSE_EVENT {
  x: extern Int
  y: extern Int
  z: extern Int
  w: extern Int
  button: extern UInt
  display: extern Display
}

KeyEvent: cover from ALLEGRO_KEYBOARD_EVENT {
  keycode: extern Key
  display: extern Display
}

EventSource: cover from ALLEGRO_EVENT_SOURCE* {
}

Key: enum {
  A: extern(ALLEGRO_KEY_A)
  B: extern(ALLEGRO_KEY_B)
  C: extern(ALLEGRO_KEY_C)
  D: extern(ALLEGRO_KEY_D)
  E: extern(ALLEGRO_KEY_E)
  F: extern(ALLEGRO_KEY_F)
  G: extern(ALLEGRO_KEY_G)
  H: extern(ALLEGRO_KEY_H)
  I: extern(ALLEGRO_KEY_I)
  J: extern(ALLEGRO_KEY_J)
  K: extern(ALLEGRO_KEY_K)
  L: extern(ALLEGRO_KEY_L)
  M: extern(ALLEGRO_KEY_M)
  N: extern(ALLEGRO_KEY_N)
  O: extern(ALLEGRO_KEY_O)
  P: extern(ALLEGRO_KEY_P)
  Q: extern(ALLEGRO_KEY_Q)
  R: extern(ALLEGRO_KEY_R)
  S: extern(ALLEGRO_KEY_S)
  T: extern(ALLEGRO_KEY_T)
  U: extern(ALLEGRO_KEY_U)
  V: extern(ALLEGRO_KEY_V)
  W: extern(ALLEGRO_KEY_W)
  X: extern(ALLEGRO_KEY_X)
  Y: extern(ALLEGRO_KEY_Y)
  Z: extern(ALLEGRO_KEY_Z)
  _0: extern(ALLEGRO_KEY_0)
  _1: extern(ALLEGRO_KEY_1)
  _2: extern(ALLEGRO_KEY_2)
  _3: extern(ALLEGRO_KEY_3)
  _4: extern(ALLEGRO_KEY_4)
  _5: extern(ALLEGRO_KEY_5)
  _6: extern(ALLEGRO_KEY_6)
  _7: extern(ALLEGRO_KEY_7)
  _8: extern(ALLEGRO_KEY_8)
  _9: extern(ALLEGRO_KEY_9)
  F1: extern(ALLEGRO_KEY_F1)
  F2: extern(ALLEGRO_KEY_F2)
  F3: extern(ALLEGRO_KEY_F3)
  F4: extern(ALLEGRO_KEY_F4)
  F5: extern(ALLEGRO_KEY_F5)
  F6: extern(ALLEGRO_KEY_F6)
  F7: extern(ALLEGRO_KEY_F7)
  F8: extern(ALLEGRO_KEY_F8)
  F9: extern(ALLEGRO_KEY_F9)
  F10: extern(ALLEGRO_KEY_F10)
  F11: extern(ALLEGRO_KEY_F11)
  F12: extern(ALLEGRO_KEY_F12)
  ESCAPE: extern(ALLEGRO_KEY_ESCAPE)
  TILDE: extern(ALLEGRO_KEY_TILDE)
  MINUS: extern(ALLEGRO_KEY_MINUS)
  EQUALS: extern(ALLEGRO_KEY_EQUALS)
  BACKSPACE: extern(ALLEGRO_KEY_BACKSPACE)
  TAB: extern(ALLEGRO_KEY_TAB)
  OPENBRACE: extern(ALLEGRO_KEY_OPENBRACE)
  CLOSEBRACE: extern(ALLEGRO_KEY_CLOSEBRACE)
  ENTER: extern(ALLEGRO_KEY_ENTER)
  SEMICOLON: extern(ALLEGRO_KEY_SEMICOLON)
  QUOTE: extern(ALLEGRO_KEY_QUOTE)
  BACKSLASH: extern(ALLEGRO_KEY_BACKSLASH)
  BACKSLASH2: extern(ALLEGRO_KEY_BACKSLASH2)
  COMMA: extern(ALLEGRO_KEY_COMMA)
  FULLSTOP: extern(ALLEGRO_KEY_FULLSTOP)
  SLASH: extern(ALLEGRO_KEY_SLASH)
  SPACE: extern(ALLEGRO_KEY_SPACE)
  INSERT: extern(ALLEGRO_KEY_INSERT)
  DELETE: extern(ALLEGRO_KEY_DELETE)
  HOME: extern(ALLEGRO_KEY_HOME)
  END: extern(ALLEGRO_KEY_END)
  PGUP: extern(ALLEGRO_KEY_PGUP)
  PGDN: extern(ALLEGRO_KEY_PGDN)
  LEFT: extern(ALLEGRO_KEY_LEFT)
  RIGHT: extern(ALLEGRO_KEY_RIGHT)
  UP: extern(ALLEGRO_KEY_UP)
  DOWN: extern(ALLEGRO_KEY_DOWN)
  PAD_SLASH: extern(ALLEGRO_KEY_PAD_SLASH)
  PAD_ASTERISK: extern(ALLEGRO_KEY_PAD_ASTERISK)
  PAD_MINUS: extern(ALLEGRO_KEY_PAD_MINUS)
  PAD_PLUS: extern(ALLEGRO_KEY_PAD_PLUS)
  PAD_DELETE: extern(ALLEGRO_KEY_PAD_DELETE)
  PAD_ENTER: extern(ALLEGRO_KEY_PAD_ENTER)
  PRINTSCREEN: extern(ALLEGRO_KEY_PRINTSCREEN)
  PAUSE: extern(ALLEGRO_KEY_PAUSE)
  ABNT_C1: extern(ALLEGRO_KEY_ABNT_C1)
  YEN: extern(ALLEGRO_KEY_YEN)
  KANA: extern(ALLEGRO_KEY_KANA)
  CONVERT: extern(ALLEGRO_KEY_CONVERT)
  NOCONVERT: extern(ALLEGRO_KEY_NOCONVERT)
  AT: extern(ALLEGRO_KEY_AT)
  CIRCUMFLEX: extern(ALLEGRO_KEY_CIRCUMFLEX)
  COLON2: extern(ALLEGRO_KEY_COLON2)
  KANJI: extern(ALLEGRO_KEY_KANJI)
  LSHIFT: extern(ALLEGRO_KEY_LSHIFT)
  RSHIFT: extern(ALLEGRO_KEY_RSHIFT)
  LCTRL: extern(ALLEGRO_KEY_LCTRL)
  RCTRL: extern(ALLEGRO_KEY_RCTRL)
  ALT: extern(ALLEGRO_KEY_ALT)
  ALTGT: extern(ALLEGRO_KEY_ALTGR)
  LWIN: extern(ALLEGRO_KEY_LWIN)
  RWIN: extern(ALLEGRO_KEY_RWIN)
  MENU: extern(ALLEGRO_KEY_MENU)
  SCROLLLOCK: extern(ALLEGRO_KEY_SCROLLLOCK)
  NUMLOCK: extern(ALLEGRO_KEY_NUMLOCK)
  CAPSLOCK: extern(ALLEGRO_KEY_CAPSLOCK)
  PAD_EQUALS: extern(ALLEGRO_KEY_PAD_EQUALS)
  BACKQUOTE: extern(ALLEGRO_KEY_BACKQUOTE)
  SEMICOLON2: extern(ALLEGRO_KEY_SEMICOLON2)
  COMMAND: extern(ALLEGRO_KEY_COMMAND)

  MAX: extern(ALLEGRO_KEY_MAX)
}

KeyboardState: cover from ALLEGRO_KEYBOARD_STATE {
  get: static func -> This {
    state: KeyboardState
    al_get_keyboard_state(state&)
    state 
  }

  down?: func@ (key: Key) -> Bool {
    al_key_down(this&, key)
  }
}

al_get_keyboard_state: extern func (state: KeyboardState*)
al_key_down: extern func (state: KeyboardState*, key: Key) -> Bool

