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
//        String qBase = "SELECT e.id, e.nombre, e.estado, e.fecha, e.tipo_actividad as tipoActividad, a.nombre as actividad, m.nombre as " +
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
}
