package gobela

class Memoria {

    String situacion
    String retos
    String acciones
    String mejoras
    String sistemas
    String tecnicos
    int numDeportistas
    int numMujeres
    int numHombres
    int numResidentes
    String politicaDeportiva
    String colaboraciones
    String contribuciones

    static belongsTo = [solicitud: Solicitud]

    static mapping = {
        situacion sqlType: 'text'
        retos sqlType: 'text'
        acciones sqlType: 'text'
        mejoras sqlType: 'text'
        sistemas sqlType: 'text'
        tecnicos sqlType: 'text'
        politicaDeportiva sqlType: 'text'
        colaboraciones sqlType: 'text'
        contribuciones sqlType: 'text'
    }

    static constraints = {
        situacion(nullable: true, blank: true, maxSize: 2000)
        retos(nullable: true, blank: true, maxSize: 2000)
        acciones(nullable: true, blank: true, maxSize: 2000)
        mejoras(nullable: true, blank: true, maxSize: 2000)
        sistemas(nullable: true, blank: true, maxSize: 2000)
        tecnicos(nullable: true, blank: true, maxSize: 2000)
        numDeportistas(nullable: false)
        numMujeres(nullable: false)
        numHombres(nullable: false)
        numResidentes(nullable: false)
        politicaDeportiva(nullable: true, blank: true, maxSize: 2000)
        colaboraciones(nullable: true, blank: true, maxSize: 2000)
        contribuciones(nullable: true, blank: true, maxSize: 2000)
    }
}
