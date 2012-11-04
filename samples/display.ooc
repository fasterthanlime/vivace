
use vivace
import vivace

main: func {

  if (!AL init()) fail("failed to initialize allegro")

  display := Display new(640, 480)
  if (!display) fail("failed to create display")
 
  AL clearToColor(Color rgb(72, 60, 50)) 
  AL flipDisplay()

  AL rest(2.0)

  display destroy()
}

fail: func (msg: String) {
  msg println()
  exit(-1)
}
