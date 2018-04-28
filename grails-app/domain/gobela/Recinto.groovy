package gobela

class Recinto {

    String nombre

    static constraints = {
        nombre(nullable: false, blank: false)
    }

    String toString() {
        return nombre?.toUpperCase()
    }
}
