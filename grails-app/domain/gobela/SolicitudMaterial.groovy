package gobela

class SolicitudMaterial {

    Material material
    Integer cantidad
//    Date fechaEntrega = new Date()
    Date fechaEntrega
//    Date fechaDevolucion = new Date()
    Date fechaDevolucion
    String observaciones
    String lugarEntrega
    String lugarDevolucion
    String comentarios


//    static hasMany = [material: Material]
    static belongsTo = [evento: Evento]

    static constraints = {
//        material()
        cantidad()
//        entrega(nullable: false, blank: false)
        fechaEntrega(nullable: false, blank: false)
        lugarEntrega()
//        recogida(nullable: false, blank: false)
        fechaDevolucion(nullable: false, blank: false)
        lugarDevolucion()
        observaciones(nullable: true, blank: true, maxSize: 2000)
        comentarios(nullable: true, blank: true, maxSize: 2000)
    }
}
