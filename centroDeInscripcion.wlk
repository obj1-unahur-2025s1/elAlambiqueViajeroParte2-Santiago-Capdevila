import vehiculos.*
import ciudades.*

object centroDeInscripcion {
    const listaInscriptos = []
    const listaAceptados = []
    const listaRechazados = [] 
    var ciudadDeCarreara = buenosAires

    method inscribir(unaListaDeAutos) {
        listaInscriptos.addAll(unaListaDeAutos)
    }

    method verificarSiPuedenCompetir(unaListaDeAutos) {
        unaListaDeAutos.forEach({auto => self.puedeCompetir(auto)})
    }

    method puedeCompetir(unAuto) {
        if (ciudadDeCarreara.puedeLlegar(unAuto)) {
            listaAceptados.add(unAuto)
        } else {
            listaRechazados.add(unAuto)
        }
    }

    method cambiarCiudad(unaCiudad) {
        ciudadDeCarreara = unaCiudad
        listaInscriptos.union(listaAceptados)
        listaInscriptos.union(listaRechazados)
        self.verificarSiPuedenCompetir(listaInscriptos)
    }

    method llevarVehículosAceptados() {
        listaAceptados.forEach({vehiculo => vehiculo.desgaste()})
    }
}