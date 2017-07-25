package gobela

class Solicitud {

    String codigo
    String descSolicitud
    String nombreSolicitante
    String solicitanteId
    String municipioSolicitante
    Long cpSolicitante
    String emailSolicitante
    String direccionSolicitante
    String telefonoSolicitante1
    String telefonoSolicitante2
    Boolean representante
    String nombreEntidad
    String entidadId
    String direccionEntidad
    String municipioEntidad
    Long cpEntidad
    String emailEntidad
    Long telefonoEntidad1
    Long telefonoEntidad2
    String representanteLegal
    String tipoSolicitud
    int linea
    BigDecimal importeSolicitado
    String numCuenta
    BigDecimal importeSolicitadoOtros
    BigDecimal importeRecibidoOtros
    Date fechaSolicitud = new Date()
    String nombreEvento

    static hasOne = [balance: Balance,memoria: Memoria, justificacion: Justificacion, valoracion: Valoracion]

    static constraints = {
        codigo(nullable: false, unique: true)
        descSolicitud(nullable: false, unique: true)
        nombreSolicitante(blank: false)
        solicitanteId(blank: false)
        municipioSolicitante(blank: false)
        cpSolicitante(nullable: false)
        emailSolicitante(blank: true, email: true)
        direccionSolicitante(blank: false)
        telefonoSolicitante1(nullable: false)
        telefonoSolicitante2(nullable: true)
        representante(nullable: false)
        nombreEntidad(nullable: true)
        entidadId(nullable: true)
        direccionEntidad(nullable: true)
        municipioEntidad(nullable: true)
        cpEntidad(nullable: true)
        emailEntidad(nullable: true, email: true)
        telefonoEntidad1(nullable: true)
        telefonoEntidad2(nullable: true)
        representanteLegal(nullable: true)
        tipoSolicitud(nullable: false, inList: ["Club", "Deportista", "Otros"])
        linea(nullable: false, inList: [1,2,3,4,5,6,7])
        importeSolicitado(nullable: false)
        numCuenta(nullable: true)
        importeSolicitadoOtros(nullable: true)
        importeRecibidoOtros(nullable: true)
        fechaSolicitud()
        balance(nullable: true)
        memoria(nullable: true)
        valoracion(nullable: true)
        justificacion(nullable: true)
        nombreEvento(nullable: true)
    }

    String toString() {return codigo}
}
