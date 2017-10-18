package gobela

class SolicitudMaterial {

    Date entrega = new Date()
    Date recogida = new Date()
    //ArrayList<Material> materiales
    String observaciones
    String lugarEntrega
    String lugarDevolucion

    static constraints = {
        entrega(nullable: false, blank: false)
        lugarEntrega()
        recogida(nullable: false, blank: false)
        lugarDevolucion()
        //materiales(nullable: false)
        observaciones(nullable: true, blank: true, maxSize: 2000)
    }
}
