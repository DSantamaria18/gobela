package gobela

class Incidencia {

    String asunto
    Date fecha = new Date()
    String estado
    String tipo
    String descripcion

    static constraints = {
        asunto(nullable: false, blank: false)
        estado(inList: ['PENDIENTE', 'EN CURSO', 'EN ESPERA', 'SOLUCIONADO', 'DESESTIMADO'])
        tipo(inList: ['ERROR', 'NUEVA NECESIDAD', 'MEJORA'])
        descripcion(widget: 'textarea')
    }
}
