package gobela

class Categoria {

    Modalidad modalidad
    String nombre
    String sexo
    Integer numDeportistas
    Integer edadMin
    Integer edadMax

    static belongsTo = [club: Club]

    static constraints = {
        modalidad(nullable: false, blank: false)
        nombre(nullable: false, blank: false)
        sexo(inList: ['MASC', 'FEM'])
        edadMin(nullable: false, blank: false)
        edadMax(nullable: false, blank: false)
    }
}
