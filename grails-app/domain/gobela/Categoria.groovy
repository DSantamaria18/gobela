package gobela

class Categoria {

    Modalidad modalidad
    String nombre
    String sexo
    Integer numDeportistas
    Integer edadMin
    Integer edadMax

    static belongsTo = [club: Club]
    static hasMany = [tecnicosCategorias: TecnicoCategoria, sesiones: Sesion]

    static constraints = {
        modalidad(nullable: false, blank: false)
        nombre(nullable: false, blank: false)
        sexo(inList: ['MASC', 'FEM', 'MIXTO'])
        edadMin(nullable: false, blank: false)
        edadMax(nullable: false, blank: false)
        numDeportistas(nullable: false, blank: false)
    }

    String toString(){
        return this?.nombre?.toUpperCase() + " " + this?.sexo?.toUpperCase()
    }
}
