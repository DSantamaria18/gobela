package gobela

class Zona {

    String nombre

    static constraints = {
        nombre(nullable: false, blank: false, unique: true)
    }

    String toString() {
        return nombre?.toUpperCase()
    }
}
