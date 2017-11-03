package gobela

class Lugar {

    String nombreLugar
    Zona zona = null

//    static hasOne = [zona: Zona]

    static constraints = {
        nombreLugar(nullable: false, blank: false, unique: true)
        zona(nullable: true, blank: true)
    }

    String toString() {
        return nombreLugar
    }
}
