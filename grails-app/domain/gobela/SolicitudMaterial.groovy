package gobela

class SolicitudMaterial {

//    Material material
//    Integer cantidad
    Date entrega = new Date()
    Date recogida = new Date()
    String observaciones
    String lugarEntrega
    String lugarDevolucion

    static hasMany = [material: Material]
    static belongsTo = [evento: Evento]

    static constraints = {
//        material()
//        cantidad()
        entrega(nullable: false, blank: false)
        lugarEntrega()
        recogida(nullable: false, blank: false)
        lugarDevolucion()
        observaciones(nullable: true, blank: true, maxSize: 2000)
    }
}
