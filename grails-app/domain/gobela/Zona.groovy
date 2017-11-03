package gobela

class Zona {

    String nombre

//    static belongsTo = [lugar: Lugar]

    static constraints = {
        nombre(nullable: false, blank: false, unique: true)
    }

    String toString() {
        return nombre
    }
}
