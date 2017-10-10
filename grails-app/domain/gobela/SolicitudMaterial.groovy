package gobela

class SolicitudMaterial {

    Date recogida = new Date()
    Date entrega = new Date()
//    Evento evento
    String observaciones
    ArrayList<Material> material

//    static belongsTo = [Evento: evento]

    static constraints = {
        recogida()
        entrega()
        material()
        observaciones(maxSize: 2000)
    }
}
