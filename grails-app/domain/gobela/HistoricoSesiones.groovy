package gobela

class HistoricoSesiones {

    Date fecha
    int participantes
    int ocupacion
    String observaciones
    boolean resultadoOk

    static belongsTo = [sesion: Sesion]

    static constraints = {
        fecha nullable: false, blank: false
        participantes nullable: false, blank: false
        ocupacion min: 0, max: 100, nullable: false, blank: false
        observaciones maxSize: 5000, widget: 'textarea' ,nullable: true, blank: true
    }
}
