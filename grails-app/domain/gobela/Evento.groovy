package gobela

class Evento {
    Date fecha
    Date fechaFin
    String horario
    String nombre
    Entidad entidadOrganizadora
    String contacto
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

    static hasMany = [solicitudesMaterial: SolicitudMaterial]

    static mapping = {
        solicitudesMaterial cascade:"all-delete-orphan"
    }

    static constraints = {
        nombre(nullable: false, blank: false)
        estado(inList: ['Pendiente', 'Confirmado', 'Rechazado', 'Finalizado', 'Cancelado'])
        fecha(nullable: false)
        fechaFin(nullable: false)
        horario(nullable: true, blank: true)
        relevante()
        tipoActividad(inList: ['Formación', 'Regular/Competición', 'Exhibición', 'Cultural', 'Txangoa - Excursión', 'Topaketa - Encuentro Deportivo', 'Otros', 'Txapelketa/Torneo'])
        modalidad(nullable: true)
        multikirola()
        deporteAdaptado()
        solidario()
        entidadOrganizadora(nullable: false, blank: false)
        contacto(nullable: true, blank: true)
        telefonoContacto(nullable: true, blank: true)
        clubOrganizador(nullable: true, blank:true)
        ambito(inList: ['Local', 'Comarcal', 'Provincial', 'Autonómico', 'Nacional', 'Internacional'])
        tipoPublico(inList: ['Todos los públicos', 'Infantil y juvenil', 'Adultos'])
        publicoDest(inList: ['Todos', 'Femenino', 'Masculino'])
        lugar(nullable: true)
        recinto(nullable: true)
        instalacion(nullable: true)
        entidadColaboradora(nullable: true)
        numParticipantes(nullable: true, blank: true)
        numParticipantesM(nullable: true, blank: true)
        numParticipantesH(nullable: true, blank: true)
        numAsistentes(nullable: true, blank: true)
        numVoluntarios(nullable: true, blank: true)
        observaciones(nullable: true, blank: true, maxSize: 500)
        solicitudesMaterial()
    }
}
