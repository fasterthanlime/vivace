use vivace
import vivace

main: func {
  AL init()
  AL initImageAddon()
  AL initPrimitivesAddon()

  mode := DisplayMode get(DisplayMode num() - 1)
  display := Display new(mode width, mode height)

  AL rest(3)
  display destroy()
}

