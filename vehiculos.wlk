object alambiqueVeloz {
    var rapido = true
    var combustible = 20
    const consumoPorViaje = 10
    var patente = "AB123JK"
    method puedeFuncionar() = combustible >= consumoPorViaje
    method desgaste() {
        combustible = combustible - consumoPorViaje
    }
    method rapido() = rapido
    method patenteValida() = patente.head() == "A"
}

object antigualla {
    var gangsters = 7
    const nombresDeLosGangsters = ["Paulo", "Carlos", "Martín", "Juan", "Mario", "Benja", "Valentín"]
    method puedeFuncionar() = gangsters.even()
    method rapido() = gangsters > 6
    method desgaste(){
        gangsters = gangsters - 1
    }
    method patenteValida() = chatarra.rapido() 
    method subirGangster(unGangster) {nombresDeLosGangsters.add(unGangster) gangsters += 1}
    method bajarGangster() {nombresDeLosGangsters.remove(nombresDeLosGangsters.last()) gangsters -= 1}
    method velocidad() = nombresDeLosGangsters.sum({gangster => gangster.length()})
}
object chatarra {
    var cañones = 10
    var municiones = "ACME"
    method puedeFuncionar() = municiones == "ACME" and cañones.between(6,12)
    method rapido() = municiones.size() < cañones
    method desgaste(){
        cañones = (cañones / 2).roundUp(0)
        if (cañones < 5 )
          municiones = municiones + " Obsoleto"
    }
    method patenteValida() = municiones.take(4) == "ACME" 
    method cañones() = cañones
    method hacerTrampa() = cañones - 1
}

object convertible{
    var posicionActual = 0
    const listaDeVehiculos = [chatarra, alambiqueVeloz, moto] 
    var convertido = antigualla
    method puedeFuncionar() = convertido.puedeFuncionar() 
    method rapido() = convertido.rapido()
    method desgaste(){
        convertido.desgaste()
    }
    method convertir(){
        convertido = listaDeVehiculos.get(posicionActual)
        posicionActual += 1
    }
    method patenteValida() = convertido.patenteValida()
 
}

object moto{
    method rapido() = true
    method puedeFuncionar() = not self.rapido()
    method desgaste() { }
    method patenteValida() = false
}