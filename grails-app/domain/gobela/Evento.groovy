package gobela

import com.sun.org.apache.xpath.internal.operations.Bool

class Evento {
    Date fecha
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
    /*Integer horasMant
    Integer horasDeptivo
    Integer horasLimpieza
    BigDecimal costesPersonal
    BigDecimal totalInversion*/
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

//    static hasOne = [material: SolicitudMaterial]

//    static hasMany = [modalidad: Modalidad, recintos: Recinto, entidadColaboradora: Entidad]

    static constraints = {
        nombre(nullable: false, blank: false)
        estado(inList: ['Pendiente', 'Confirmado', 'Rechazado', 'Finalizado', 'Cancelado'])
        fecha(nullable: false)
        relevante()
        tipoActividad(inList: ['Formación', 'Regular/Competición', 'Exhibición', 'Cultural', 'Txangoa - Excursión', 'Topaketa - Encuentro Deportivo', 'Otros'])
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
        entidadColaboradora(nullable: true)
        numParticipantes(nullable: true, blank: true)
        numParticipantesM(nullable: true, blank: true)
        numParticipantesH(nullable: true, blank: true)
        numAsistentes(nullable: true, blank: true)
        numVoluntarios(nullable: true, blank: true)
        /*horasMant(nullable: true, blank: true)
        horasDeptivo(nullable: true, blank: true)
        horasLimpieza(nullable: true, blank: true)
        costesPersonal(nullable: true, blank: true)
        totalInversion(nullable: true, blank: true)*/
        observaciones(nullable: true, blank: true, maxSize: 500)
    }
}
