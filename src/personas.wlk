import juguetes.*

object andy {
	var felicidad = 200
	const juguetes = []
	
	method nivelFelicidad() = felicidad
	method agarrarJuguete(juguete) { juguetes.add(juguete) }
	method perderJuguete() { juguetes.remove(juguetes.last() ) }
	method aburrirse(minutos) { felicidad = 0.max(felicidad - minutos * 10) }
	method dormir() { felicidad = 200 }
	method jugar() { juguetes.forEach( { j => j.jugar(self) } ) }
	method juegaConMuniecas() = false
	method cantJuguetesEnBuenEstado() = juguetes.count( { j => j.buenEstado() } )
	method pasarLaNoche() {
		self.dormir()
		felicidad += 20 * self.cantJuguetesEnBuenEstado() 
	}
	method aumentarFelicidad(cantidad) { felicidad += cantidad }
	method nombresJuguetes() = juguetes.map( { j => j.nombreOriginal() } )
	
}

object molly {
	var felicidad = 400
	
	method nivelFelicidad() = felicidad

/*
 * Si fuese necesario que sean polimórficos para jugar(juguete) 
 * entonces debiera ser así:
 *  	
	method manotear(juguete) {
		self.jugar(juguete)
	}
	method jugar(juguete) {
		juguete.jugar(self)
	}
*/	
	method manotear(juguete) {
		juguete.jugar(self)
	}
	
	method juegaConMuniecas() = true
	
}

object reparador {
	
	method reparar(juguete) {
		juguete.jugar(self)
		juguete.restaurarValorInicial()
	}
}
