package gobela

class Contacto {

    String nombre
    String email
    String telefono

    static belongsTo = [entidad: Entidad]

    static constraints = {
        nombre(nullable: false, blank: false)
        email(nullable: true, email: true, blank: true)
        telefono(nullable: true, blank: true)
    }

    String toString(){
        return nombre?.toUpperCase()
    }
}
