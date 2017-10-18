package gobela

class SolicitudMaterial {

    Date recogida = new Date()
    Date entrega = new Date()
//    Evento evento
    String observaciones
    ArrayList<Material> material
    String lugarEntrega
    String lugarDevolucion

//    static belongsTo = [Evento: evento]

    static constraints = {
        recogida()
        lugarEntrega()
        entrega()
        lugarDevolucion()
        material()
        observaciones(maxSize: 2000)
    }
}
