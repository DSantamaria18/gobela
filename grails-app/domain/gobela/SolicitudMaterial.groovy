package gobela

class SolicitudMaterial {

    Date entrega = new Date()
    Date recogida = new Date()
    ArrayList<Material> materiales
    String observaciones

//    static belongsTo = [evento: Evento]

    static constraints = {
//        evento()
        entrega(nullable: false, blank: false)
        recogida(nullable: false, blank: false)
        materiales(nullable: false)
        observaciones(nullable: true, blank: true, maxSize: 2000)
    }
}
