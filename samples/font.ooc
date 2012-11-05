
use vivace
import vivace

main: func {
  AL init()
  AL initFontAddon()
  AL initTtfAddon()

  display := Display new(800, 600)
  font := Font load("game_over.ttf", 128, 0)
  AL clearToColor(Color rgb(0, 0, 0))

  font drawText(Color rgb(255, 255, 255), 800 / 2, 600 / 2, Align centre, "Game Over")
  AL flipDisplay()
  AL rest(2)

  display destroy()
}


