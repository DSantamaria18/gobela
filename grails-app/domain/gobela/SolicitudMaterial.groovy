package gobela

class SolicitudMaterial {

    Material material
    Integer cantidad
    Date fechaEntrega
    Date fechaDevolucion
    String observaciones
    String lugarEntrega
    String lugarDevolucion
    String comentarios

    static belongsTo = [evento: Evento]

    static constraints = {
        cantidad()
        fechaEntrega(nullable: false, blank: false)
        lugarEntrega()
        fechaDevolucion(nullable: false, blank: false)
        lugarDevolucion()
        observaciones(nullable: true, blank: true, maxSize: 2000)
        comentarios(nullable: true, blank: true, maxSize: 2000)
    }
}
