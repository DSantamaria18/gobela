package gobela

class Actividad {

    String nombre

    static constraints = {
        nombre(unique: true, nullable: false, blank: false)
    }
}
