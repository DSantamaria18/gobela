package gobela

class Club {

    Integer numDirectivos
    Date fechaFundacion
    Date fechaElecciones
    Boolean carnetGK

    static belongsTo = [entidad: Entidad]

    static constraints = {
        entidad(unique: true)
        fechaFundacion()
        fechaElecciones()
        numDirectivos()
        carnetGK()
    }

    String toString(){
        return this?.entidad?.nombreEntidad?.toUpperCase()
    }
}
