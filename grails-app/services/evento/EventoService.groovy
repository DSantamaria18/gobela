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
        String qBase = "SELECT e.id, e.nombre, e.estado, e.fecha, e.tipo_actividad as tipoActividad, m.nombre as " +
                "modalidad FROM evento e, modalidad m WHERE e.modalidad_id = m.id " +
                "AND ( fecha BETWEEN '${fDesde}' AND '${fHasta}' " +
                "OR fecha_fin BETWEEN '${fDesde}' AND '${fHasta}' " +
                "OR (fecha < '${fDesde}' AND fecha_fin > '${fHasta}')) "
        String qModalidad = (params.modalidad != '')? " AND e.modalidad_id = ${params.modalidad}" : ""
        String qActividad = (params.actividad != '')? " AND e.actividad_id = ${params.actividad}" : ""
        String qEstado = (params.estado != 'Cualquiera')? " AND e.estado = '${params.estado}'" : ""
        String qTipoActividad = (params.tipoActividad != '')? " AND e.tipo_actividad = '${params.tipoActividad}'" : ""
        String qLugar = (params.lugar != '')? " AND e.lugar_id = '${params.lugar}'" : ""
        String qMultikirola = (params.multikirola) ? " AND e.multikirola = ${params.multikirola} " : ""
        String qAdaptado = (params.adaptado) ? " AND e.deporte_adaptado = ${params.adaptado} " : ""
        String qInclusivo = (params.inclusivo) ? " AND e.deporte_inclusivo = ${params.inclusivo} " : ""
        String qRelevante = (params.relevante) ? " AND e.relevante = ${params.relevante} " : ""
        String qOrder = " ORDER BY fecha, estado, tipoActividad, modalidad ASC"
        String query = qBase + qEstado + qTipoActividad + qActividad + qModalidad + qLugar + qMultikirola + qAdaptado + qInclusivo + qRelevante + qOrder

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }
}
