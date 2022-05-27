package gobela

class Recinto {

    String nombre
    String localizacion

    static constraints = {
        nombre(nullable: false, blank: false)
        localizacion(nullable: true, blank: true)
    }

    String toString() {
        return nombre?.toUpperCase()
    }
}
