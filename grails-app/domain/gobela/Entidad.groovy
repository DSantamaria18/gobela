package gobela

class Entidad {
    String nombreEntidad
    String cif
    String direccionEntidad
    String municipioEntidad
    Long cpEntidad
    String emailEntidad
    String representanteLegal
    Long telefonoEntidad1
    Long telefonoEntidad2
    String numCuenta
    boolean es_club

    static hasMany = [clubes: Club, contactos: Contacto]

    static constraints = {
        nombreEntidad(nullable: false, blank: false, unique: true)
        cif (nullable: false, blank: false)
        es_club(display: false)
        direccionEntidad(nullable: true, blank: true)
        municipioEntidad(nullable: true, blank: true)
        cpEntidad(nullable: true, blank: true)
        emailEntidad(nullable: true, blank: true, email: true)
        representanteLegal(nullable: true, blank: true)
        telefonoEntidad1(nullable: true, blank: true)
        telefonoEntidad2(nullable: true, blank: true)
        numCuenta(nullable: true, blank: true)
        clubes(nullable: true, display: false)
        contactos(nullable: true, display: false)
    }

    String toString(){
        return nombreEntidad?.toUpperCase()
    }
}
