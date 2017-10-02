package gobela

class Lugar {

    String nombreLugar

    static constraints = {
        nombreLugar(nullable: false, blank: false, unique: true)
    }
}
