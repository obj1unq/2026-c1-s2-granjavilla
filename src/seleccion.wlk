import niveles.*
import personaje.*
class Seleccionador {
    const property image = "spot.png"
    const opciones
    
    method seleccionado() = opciones.first()

    method position() = self.seleccionado().position().up(1)

    method siguiente() {
        const seleccionado = self.seleccionado()
        opciones.remove(seleccionado)
        opciones.add(seleccionado)
    }

    method selecciona() {
        personaje.image(self.seleccionado().image())
        game.clear()
        nivel.iniciar()
    }
}

class Aspecto {
    const property image
    const property position
}

class Cartel {
    const property text
    const property position
}