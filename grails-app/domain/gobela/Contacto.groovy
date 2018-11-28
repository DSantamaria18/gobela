package gobela

class Contacto {

    String nombre
    String email
    String telefono
    Boolean activo

    static belongsTo = [entidad: Entidad]

    static constraints = {
        nombre(nullable: false, blank: false)
        email(nullable: true, email: true, blank: true)
        telefono(nullable: true, blank: true)
        activo()
    }

    String toString(){
        return (activo) ? nombre?.toUpperCase() : nombre?.toUpperCase() + ' [INACTIVO]'
    }
}
