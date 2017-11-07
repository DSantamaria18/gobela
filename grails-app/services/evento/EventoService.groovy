package evento

import grails.gorm.transactions.Transactional
import groovy.sql.Sql
import groovy.sql.GroovyRowResult

@Transactional
class EventoService {
    def dataSource

    def filtrarEventos(params) {
        String fDesde = params.fechaIniDesde
        String fHasta = params.fechaIniHasta
        String qBase = "SELECT * FROM evento WHERE fecha BETWEEN '${fDesde}' AND '${fHasta}'"
        String qEstado = (params.estado != 'Cualquiera')? " AND estado = '${params.estado}'" : ""
        String qModalidad = (params.modalidad != 'Cualquiera')? " AND modalidad_id = ${params.modalidad}" : ""
        String qActividad = (params.actividad != '')? " AND tipo_actividad = '${params.actividad}'" : ""
        String qMultikirola = " AND multikirola = ${params.multikirola}"
        String qAdaptado = " AND deporte_adaptado = ${params.adaptado}"

        String query = qBase + qEstado + qActividad + qModalidad + qMultikirola + qAdaptado
        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results

    }
}
