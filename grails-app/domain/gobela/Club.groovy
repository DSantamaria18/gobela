package gobela

class Club {

    Integer numDirectivos
    Date fechaFundacion
    Date fechaElecciones
    Boolean carnetGK

    static belongsTo = [entidad: Entidad]
//    static hasMany = [asambleas: Asamblea]
    static hasMany = [categorias: Categoria, asambleas: Asamblea]

    static constraints = {
        entidad(unique: true)
        fechaFundacion()
        fechaElecciones()
        numDirectivos()
        carnetGK()
        categorias(nullable: true, display: false)
    }

    String toString(){
        return this?.entidad?.nombreEntidad?.toUpperCase()
    }
}
