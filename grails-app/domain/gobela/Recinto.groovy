package gobela

class Recinto {

    String nombre

//    static hasMany = [evento: Evento]


    static constraints = {
        nombre(nullable: false, blank: false)
//        evento(nullable: true)
    }
}
