package gobela

class Lugar {

    String nombreLugar
    Zona zona

    static constraints = {
        nombreLugar(nullable: false, blank: false, unique: true)
        zona(nullable: true, blank: true)
    }

    String toString() {
        return nombreLugar?.toUpperCase()
    }
}
