package gobela

class Evento {
    Date fecha
    Date fechaFin
    String horario
    String nombre
    Entidad entidadOrganizadora
    Entidad clubOrganizador
    String tipoActividad
    String ambito
    String tipoPublico
    String publicoDest
    String estado
    Integer numParticipantes
    Integer numParticipantesH
    Integer numParticipantesM
    Integer numAsistentes
    Integer numVoluntarios
    Modalidad modalidad
    Lugar lugar
    Recinto recinto
    Entidad entidadColaboradora
    Boolean deporteAdaptado
    Boolean multikirola
    Boolean relevante
    String telefonoContacto
    String observaciones
    Boolean solidario
    Zona zona
    Instalacion instalacion
    Integer ocupacion
    Contacto contacto
    String emailContacto
    Boolean deporteInclusivo
    Actividad actividad
    TipoActividad tActividad
    String euskeraComGK
    String euskeraDesarrollo
    String euskeraSpeaker


    static hasMany = [solicitudesMaterial: SolicitudMaterial]

    static mapping = {
        solicitudesMaterial cascade: "all-delete-orphan"
    }

    static constraints = {
        nombre(nullable: false, blank: false)
        estado(inList: ['Confirmado', 'Pendiente', 'Rechazado', 'Finalizado', 'Cancelado'])
        fecha(nullable: false)
        fechaFin(nullable: false)
        horario(nullable: true, blank: true)
        relevante()
        tipoActividad(inList: ['Formación', 'Regular/Competición', 'Exhibición', 'Cultural', 'Txangoa - Excursión', 'Topaketa - Encuentro Deportivo', 'Txapelketa/Torneo', 'Concentración/Tecnificación', 'Otros'])
        tActividad(nullable: true, blank: true)
        actividad(nullable: true, blank: true)
        modalidad(nullable: true)
        multikirola()
        deporteAdaptado()
        deporteInclusivo()
        solidario()
        entidadOrganizadora(nullable: false, blank: false)
        contacto(nullable: true, blank: true)
        emailContacto(nullable: true, blank: true, email: true)
        telefonoContacto(nullable: true, blank: true)
        clubOrganizador(nullable: true, blank: true)
        ambito(inList: ['Local', 'Comarcal', 'Provincial', 'Autonómico', 'Nacional', 'Internacional'])
        tipoPublico(inList: ['Todos los públicos', 'Infantil y juvenil', 'Adultos'])
        publicoDest(inList: ['Todos', 'Femenino', 'Masculino'])
        euskeraComGK(inList: ['Sin Especificar', 'Euskera', 'Bilingüe', 'Otros'])
        euskeraDesarrollo(inList: ['Sin Especificar', 'Euskera', 'Bilingüe', 'Otros'])
        euskeraSpeaker(inList: ['Sin Especificar', 'Sin Speaker', 'Euskera', 'Bilingüe', 'Otros'])
        lugar(nullable: true)
        recinto(nullable: true)
        instalacion(nullable: true)
        entidadColaboradora(nullable: true)
        numParticipantes(nullable: true, blank: true)
        numParticipantesM(nullable: true, blank: true)
        numParticipantesH(nullable: true, blank: true)
        numAsistentes(nullable: true, blank: true)
        numVoluntarios(nullable: true, blank: true)
        observaciones(nullable: true, blank: true, maxSize: 5000)
        solicitudesMaterial()
        ocupacion(nullable: false, blank: false)
    }

    /* String toString(){
         return nombre.toUpperCase()
     }*/
}
