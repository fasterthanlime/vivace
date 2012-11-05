
use vivace
import vivace

main: func {
  AL init()
  AL installAudio()
  AL initAcodecAddon()
  AL reserveSamples(1)

  sample := Sample load("victoly.ogg")

  display := Display new(800, 600)

  sample play(1, 0, 1, PlayMode LOOP, null)

  AL rest(10)

  display destroy()
  sample destroy()
}


