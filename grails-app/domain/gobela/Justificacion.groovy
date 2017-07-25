package gobela

class Justificacion {

    String codigo
    BigDecimal importeRecibido
    BigDecimal importeJustificado

    static belongsTo = [solicitud: Solicitud]

    static constraints = {
        codigo(blank: false)
        importeRecibido(nullable: false)
        importeJustificado(nullable: false)
    }
}
