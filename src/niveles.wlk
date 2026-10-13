import seleccion.*
import personaje.*

object menu {
  method iniciar() {
    const cartel = new Cartel(
      text = "Elegí tu personaje y tocá espacio",
      position = game.center().up(3)
    )
    
    const hector = new Aspecto(
      image = "mplayer.png",
      position = game.center().right(2)
    )
    const filomena = new Aspecto(
      image = "fplayer.png",
      position = game.center().left(3)
    )
    const seleccionador = new Seleccionador(opciones = [filomena, hector])
    
    game.addVisual(cartel)
    game.addVisual(hector)
    game.addVisual(filomena)
    game.addVisual(seleccionador)

    keyboard.left().onPressDo({ seleccionador.siguiente() })
    keyboard.right().onPressDo({ seleccionador.siguiente() })
    
    keyboard.space().onPressDo({ seleccionador.selecciona() })
  }
}

object nivel {
  method iniciar() {
    game.addVisualCharacter(personaje)
    
    keyboard.m().onPressDo({ personaje.plantaMaiz() })
    keyboard.r().onPressDo({ personaje.rega() })
  }
}