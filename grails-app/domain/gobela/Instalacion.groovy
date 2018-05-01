package gobela

class Instalacion {

    String nombreInstalacion

    static belongsTo = [recinto: Recinto]

    static constraints = {
        nombreInstalacion(nullable: false, blank: false)
    }

    String toString() {
//        return "[${this.recinto}] - ${nombreInstalacion?.toUpperCase()}"
        return nombreInstalacion?.toUpperCase()
    }
}
