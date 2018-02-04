package evento

import gobela.Evento
import grails.gorm.transactions.Transactional
import groovy.sql.Sql
import groovy.sql.GroovyRowResult

@Transactional
class EventoService {
    def dataSource

    def filtrarEventos(params) {
        String fDesde = params.fechaDesde
        String fHasta = params.fechaHasta
        String qBase = "SELECT e.id" +
                ", e.nombre, e.estado, e.fecha, e.tipo_actividad as tipoActividad, t.nombre as tActividad, " +
                "a.nombre as actividad, m.nombre as modalidad " +
                "FROM evento e " +
                "LEFT JOIN modalidad m ON e.modalidad_id = m.id " +
                "LEFT JOIN actividad a ON e.actividad_id = a.id " +
                "LEFT JOIN tipo_actividad as t ON e.t_actividad_id = t.id " +
                "WHERE (fecha BETWEEN '${fDesde}' AND '${fHasta}' " +
                "OR fecha_fin BETWEEN '${fDesde}' AND '${fHasta}' " +
                "OR (fecha < '${fDesde}' AND fecha_fin > '${fHasta}')) "

        String qModalidad = (params.modalidad != '')? " AND e.modalidad_id = ${params.modalidad}" : ""
        String qTActividad = (params.tActividad != '')? " AND e.t_actividad_id = ${params.tActividad}" : ""
        String qActividad = (params.actividad != '')? " AND e.actividad_id = ${params.actividad}" : ""
        String qEstado = (params.estado != 'Cualquiera')? " AND e.estado = '${params.estado}'" : ""
//        String qTipoActividad = (params.tipoActividad != '')? " AND e.tipo_actividad = '${params.tipoActividad}'" : ""
        String qLugar = (params.lugar != '')? " AND e.lugar_id = '${params.lugar}'" : ""
        String qMultikirola = (params.multikirola) ? " AND e.multikirola = ${params.multikirola} " : ""
        String qAdaptado = (params.adaptado) ? " AND e.deporte_adaptado = ${params.adaptado} " : ""
        String qInclusivo = (params.inclusivo) ? " AND e.deporte_inclusivo = ${params.inclusivo} " : ""
        String qRelevante = (params.relevante) ? " AND e.relevante = ${params.relevante} " : ""
        String qOrder = " ORDER BY fecha, estado, tipoActividad, modalidad ASC"
//        String query = qBase + qEstado + qTipoActividad + qTActividad + qActividad + qModalidad + qLugar + qMultikirola + qAdaptado + qInclusivo + qRelevante + qOrder
        String query = qBase + qEstado + qTActividad + qActividad + qModalidad + qLugar + qMultikirola + qAdaptado + qInclusivo + qRelevante + qOrder

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

    def filtrarEventosFullInfo(params) {
        String fDesde = params.fechaDesde
        String fHasta = params.fechaHasta
        String qBase = """SELECT 
                e.id AS ID,
                e.nombre AS EVENTO,
                e.estado AS ESTADO,
                e.relevante AS RELEVANTE,
                e.fecha AS 'FECHA INICIO',
                e.fecha_fin AS 'FECHA FIN',
                e.horario AS 'HORARIO',
                t.nombre AS 'TIPO ACTIVIDAD',
                a.nombre AS 'ACTIVIDAD',
                m.nombre AS 'MODALIDAD',
                e.multikirola AS 'MULTIKIROLA',
                e.deporte_adaptado AS 'DEPORTE ADAPTADO',
                e.deporte_inclusivo AS 'DEPORTE INCLUSIVO',
                e.solidario AS 'SOLIDARIO',
                ent.nombre_entidad AS 'ENTIDAD ORG',
                c.nombre AS CONTACTO,
                c.email AS 'EMAIL CONTACTO',
                c.telefono AS 'TEL CONTACTO',
                e.ambito AS AMBITO,
                e.tipo_publico AS 'TIPO PUBLICO',
                e.publico_dest AS 'PUBLICO DESTINATARIO',
                e.euskera_comgk AS 'COMUNICACION GK',
                e.euskera_desarrollo 'DESARROLO EVENTO',
                e.euskera_speaker AS 'SPEAKER',
                z.nombre AS ZONA,
                l.nombre_lugar AS 'LUGAR',
                r.nombre AS RECINTO,
                i.nombre_instalacion AS 'INSTALACION',
                e.ocupacion AS OCUPACION,
                e.num_participantes AS 'NUM PARTICIPANTES',
                e.num_participantesh AS 'PARTICIPANTES HOMBRES',
                e.num_participantesm AS 'PARTICIPANTES MUJERES',
                e.num_asistentes AS 'NUM ASISTENTES',
                e.num_voluntarios AS 'NUM VOLUNTARIOS',
                e.observaciones AS OBSERVACIONES """ +
                "FROM evento e " +
                "LEFT JOIN modalidad m ON e.modalidad_id = m.id " +
                "LEFT JOIN actividad a ON e.actividad_id = a.id " +
                "LEFT JOIN tipo_actividad as t ON e.t_actividad_id = t.id " +
                """ LEFT JOIN
                entidad AS ent ON e.entidad_organizadora_id = ent.id
                    LEFT JOIN
                contacto c ON e.contacto_id = c.id
                    LEFT JOIN
                zona z ON e.zona_id = z.id
                    LEFT JOIN
                lugar l ON e.lugar_id = l.id
                    LEFT JOIN
                recinto r ON e.recinto_id = r.id
                    LEFT JOIN
                instalacion i ON e.instalacion_id = i.id """ +
                "WHERE (fecha BETWEEN '${fDesde}' AND '${fHasta}' " +
                "OR fecha_fin BETWEEN '${fDesde}' AND '${fHasta}' " +
                "OR (fecha < '${fDesde}' AND fecha_fin > '${fHasta}')) "

        String qModalidad = (params.modalidad != '')? " AND e.modalidad_id = ${params.modalidad}" : ""
        String qTActividad = (params.tActividad != '')? " AND e.t_actividad_id = ${params.tActividad}" : ""
        String qActividad = (params.actividad != '')? " AND e.actividad_id = ${params.actividad}" : ""
        String qEstado = (params.estado != 'Cualquiera')? " AND e.estado = '${params.estado}'" : ""
//        String qTipoActividad = (params.tipoActividad != '')? " AND e.tipo_actividad = '${params.tipoActividad}'" : ""
        String qLugar = (params.lugar != '')? " AND e.lugar_id = '${params.lugar}'" : ""
        String qMultikirola = (params.multikirola != "") ? " AND e.multikirola = ${params.multikirola} " : ""
        String qAdaptado = (params.deporteAdaptado != "") ? " AND e.deporte_adaptado = ${params.deporteAdaptado} " : ""
        String qInclusivo = (params.inclusivo != "") ? " AND e.deporte_inclusivo = ${params.inclusivo} " : ""
        String qRelevante = (params.relevante != "") ? " AND e.relevante = ${params.relevante} " : ""
        String qOrder = " ORDER BY e.fecha, e.estado, e.tipo_actividad, m.nombre ASC"
//        String query = qBase + qEstado + qTipoActividad + qTActividad + qActividad + qModalidad + qLugar + qMultikirola + qAdaptado + qInclusivo + qRelevante + qOrder
        String query = qBase + qEstado + qTActividad + qActividad + qModalidad + qLugar + qMultikirola + qAdaptado + qInclusivo + qRelevante + qOrder

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }
}
