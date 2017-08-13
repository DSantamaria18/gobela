package gobela

class Evento {
    Date fecha
    String nombre
    Entidad entidadOrganizadora
    Contacto contacto
    String tipoActividad
//    Modalidad modalidad
    String ambito
    String tipoPublico
    String publicoDest
    String estado
//    String recinto
    Integer numParticipantes
    Integer numParticipantesH
    Integer numParticipantesM
    Integer numAsistentes
    Integer numVoluntarios
    Integer horasMant
    Integer horasDeptivo
    Integer horasLimpieza
    BigDecimal costesPersonal
    BigDecimal totalInversion

//    static hasMany = [recinto: Recinto, clubOrganizador: Entidad, entidadColaboradora: Entidad]
//    static hasMany = [recinto: RecintosEvento]
    static hasMany = [modalidad: Modalidad]

    static constraints = {
        nombre(nullable: false, blank: false)
        estado(inList: ['Pendiente', 'Confirmado', 'Rechazado'])
        fecha(nullable: false)
        tipoActividad(inList: ['Formación', 'Multikirola', 'Regular/Competición', 'Exhibición', 'Deporte Adaptado', 'Cultural','Solidario', 'Otros'])
        modalidad(nullable: true, blank: true)
        entidadOrganizadora(nullable: false, blank: false)
        contacto(nullable: true, blank: true)
//        clubOrganizador(nullable: true, blank:true)
        ambito(inList: ['Local', 'Comarcal', 'Provincial', 'Autonómico', 'Nacional', 'Internacional'])
        tipoPublico(inList: ['Todos los públicos', 'Infantil', 'Juvenil', 'Infantil y juvenil', 'Adultos'])
        publicoDest(inList: ['Todos', 'Femenino', 'Masculino'])
//        recinto(nullable: true)
//        entidadColaboradora(nullable: true)
        numParticipantes(nullable: true, blank: true)
        numParticipantesM(nullable: true, blank: true)
        numParticipantesH(nullable: true, blank: true)
        numAsistentes(nullable: true, blank: true)
        numVoluntarios(nullable: true, blank: true)
        horasMant(nullable: true, blank: true)
        horasDeptivo(nullable: true, blank: true)
        horasLimpieza(nullable: true, blank: true)
        costesPersonal(nullable: true, blank: true)
        totalInversion(nullable: true, blank: true)


    }
}
