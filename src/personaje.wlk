import cultivos.Maiz
import wollok.game.*

object personaje {
	var property position = game.center()
	var property image = "player.png"

	method plantaMaiz() {
		self.validarPosicionVacia()
		game.addVisual(new Maiz(position = self.position()))
	}

	method rega() {
		self.cultivosDebajo().forEach({ cultivo => cultivo.regate() })
	}

	method cultivosDebajo() { return game.colliders(self) }

	method validarPosicionVacia() {
		if (not self.cultivosDebajo().isEmpty()) {
			self.error("Ya hay un cultivo acá!")
		}
	}
}