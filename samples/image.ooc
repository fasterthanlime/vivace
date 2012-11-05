use vivace
import vivace

main: func {
  AL init()
  AL initImageAddon()

  display := Display new(800, 600)
  image := Bitmap load("pawn.jpg")

  AL drawBitmap(image, 800 / 2 - image getWidth() / 2,
                       600 / 2 - image getHeight() / 2, 0)
  AL flipDisplay()
  AL rest(2)

  display destroy()
  image destroy()
}


