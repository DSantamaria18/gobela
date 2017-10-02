package gobela

class Contacto {

    String nombre
    String email
    String telefono

//    static belongsTo = [evento: Evento, entidad: Entidad]

    static constraints = {
        nombre(nullable: true, blank: true)
        email(nullable: false, email: true)
        telefono(nullable: true, blank: true)
//        evento(nullable: true)
//        entidad(nullable: true)
    }
}
