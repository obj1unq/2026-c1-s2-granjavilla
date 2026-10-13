import cultivos.Maiz
import wollok.game.*

object personaje {
	var property position = game.center()
	var property image = "player.png"
	var property oro = 0
	const cultivos = []
	
	method plantaMaiz() {
		self.validarPosicionVacia()
		self.planta(new Maiz(position = self.position()))
	}
	
	method rega() {
		self.cultivosDebajo().forEach({ cultivo => cultivo.regate() })
	}
	
	method cosechaTodo() {
		cultivos.forEach({ cultivo => self.cosecha(cultivo) })
	}
	
	method planta(cultivo) {
		cultivos.add(cultivo)
		game.addVisual(cultivo)
	}
	
	method cosecha(cultivo) {
		cultivos.remove(cultivo)
		game.removeVisual(cultivo)
		oro += cultivo.precio()
	}
	
	method cultivosDebajo() = game.colliders(self)
	
	method validarPosicionVacia() {
		if (not self.cultivosDebajo().isEmpty()) self.error("Ya hay un cultivo acá!")
	}
}

object cartelDeOro {
	method position() = game.origin().up(game.height() - 1)
	
	method text() = personaje.oro().toString()
}

class Numero {
	method image() = "numeros/numero_" + self.numero().toString() + ".png"
	method numero()
}

object decena inherits Numero {
	method position() = game.origin().up(game.height() - 1)
	override method numero() = personaje.oro().div(10)
}

object unidad inherits Numero {
	method position() = decena.position().right(1)
	override method numero() = personaje.oro().rem(10)
}