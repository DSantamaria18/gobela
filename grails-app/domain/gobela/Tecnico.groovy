package gobela

class Tecnico {

    String apellidos
    String nombre
    Titulacion titulacion
    NivelEuskera nivelEuskera
    Integer antiguedad = 1

    static hasMany = [tecnicosCategorias: TecnicoCategoria]

    static constraints = {
        apellidos(nullable: false, blank: false)
        nombre(nullable: false, blank: false)
        titulacion(nullable: false)
        nivelEuskera(nullable: false)
        antiguedad(nullable: false, blank: false)

    }

    String toString(){
        return this?.nombre?.toUpperCase()
    }
}
