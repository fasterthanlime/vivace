use vivace
import vivace

main: func {
  FPS := 60.0
  SCREEN_W := 640
  SCREEN_H := 480
  BOUNCER_SIZE := 32

  bouncerX := SCREEN_W / 2.0 - BOUNCER_SIZE / 2.0
  bouncerY := SCREEN_H / 2.0 - BOUNCER_SIZE / 2.0
  redraw := true

  AL init()
  AL installKeyboard()

  timer := Timer new(1.0 / FPS)
  display := Display new(SCREEN_W, SCREEN_H)
  bouncer := Bitmap new(BOUNCER_SIZE, BOUNCER_SIZE)

  AL setTargetBitmap(bouncer)
  AL clearToColor(Color rgb(255, 0, 255))
  AL setTargetBitmap(display getBackbuffer())

  eventQueue := EventQueue new()

  eventQueue register(display getEventSource())
  eventQueue register(timer getEventSource())
  eventQueue register(AL getKeyboardEventSource())

  AL flipDisplay()
  timer start()

  running := true
  while (running) {
    ev := eventQueue wait()

    match (ev type) {
      case EventType timer =>
        redraw = true

        state := KeyboardState get()
        if (state down?(Key UP))
          bouncerY -= 4.0
        if (state down?(Key DOWN))
          bouncerY += 4.0
        if (state down?(Key LEFT))
          bouncerX -= 4.0
        if (state down?(Key RIGHT))
          bouncerX += 4.0

      case EventType keyDown =>
        if (ev keyboard keycode == Key ESCAPE) {
          running = false
        }
    }

    if(redraw && eventQueue empty?()) {
      redraw = false

      AL clearToColor(Color rgb(0, 0, 0))
      AL drawBitmap(bouncer, bouncerX, bouncerY, 0)
      AL flipDisplay()
    }
  }

  bouncer destroy()
  timer destroy()
  display destroy()
  eventQueue destroy()

}

