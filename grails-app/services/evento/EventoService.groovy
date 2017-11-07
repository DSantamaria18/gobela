package evento

import gobela.Evento
import grails.gorm.transactions.Transactional
import groovy.sql.Sql
import groovy.sql.GroovyRowResult

@Transactional
class EventoService {
    def dataSource

    def filtrarEventos(params) {
        String fDesde = params.fechaIniDesde
        String fHasta = params.fechaIniHasta
        String qBase = "SELECT e.nombre, e.estado, e.fecha, e.tipo_actividad as tipoActividad, m.nombre as modalidad " +
                "FROM evento e, modalidad m WHERE e.modalidad_id = m.id AND fecha BETWEEN '${fDesde}' AND '${fHasta}'"
        String qModalidad = (params.modalidad != '')? " AND e.modalidad_id = ${params.modalidad}" : ""
        String qEstado = (params.estado != 'Cualquiera')? " AND e.estado = '${params.estado}'" : ""
        String qActividad = (params.actividad != '')? " AND e.tipo_actividad = '${params.actividad}'" : ""
        String qMultikirola = " AND e.multikirola = ${params.multikirola}"
        String qAdaptado = " AND e.deporte_adaptado = ${params.adaptado}"
        String query = qBase + qEstado + qActividad + qModalidad + qMultikirola + qAdaptado

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query).collect()
        return results



    }
}
