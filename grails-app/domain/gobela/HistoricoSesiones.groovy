package gobela

class HistoricoSesiones {

    Date fecha
    int participantes
    int ocupacion
    String observaciones
    boolean resultadoOk

    // Sesion
    Long sesionId
    DiaSemana diaSemana
    String horaInicio
    String horaFin
    Recinto recinto
    Instalacion instalacion
    Integer ocupacionEsperada

    // Categoria
    Long categoriaId
    String nombreCategoria
    String sexo
    Integer numDeportistas
    Integer edadMin
    Integer edadMax
    Club club
    Modalidad modalidad

    // Entidad
    Entidad entidad

    static constraints = {
        fecha nullable: false, blank: false
        participantes nullable: false, blank: false
        ocupacionEsperada nullable: false, editable: false
        ocupacion min: 0, max: 100, nullable: false, blank: false
        observaciones maxSize: 5000, widget: 'textarea' ,nullable: true, blank: true
        sesionId nullable: false, editable: false
        diaSemana nullable: false, edittable: false
        horaInicio nullable: false, editable: false
        horaFin nullable: false, editable: false
        recinto nullable: false, editable: false
        instalacion nullable: false, editable: false
        categoriaId nullable: false, editable: false
        club nullable: false, editable: false
        modalidad nullable: false, editable: false
        nombreCategoria nullable: false, editable: false
        sexo nullable: false, editable: false
        numDeportistas nullable: false, editable: false
        edadMin nullable: false, editable: false
        edadMax nullable: false, editable: false
        entidad nullable: false, editable: false
    }

    static String sesionString(final HistoricoSesiones historicoSesiones){
        return "${historicoSesiones.diaSemana}: ${historicoSesiones.horaInicio} - ${historicoSesiones.horaFin} " +
                "[${historicoSesiones.recinto} - ${historicoSesiones.instalacion}]"
    }

    static String categoriaString(final HistoricoSesiones historicoSesiones){
        return historicoSesiones?.nombreCategoria?.toUpperCase() + " " + historicoSesiones?.sexo?.toUpperCase()
    }
}
