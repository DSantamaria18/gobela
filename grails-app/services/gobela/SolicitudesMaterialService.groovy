package gobela

import grails.gorm.transactions.Transactional
import groovy.sql.Sql

@Transactional
class SolicitudesMaterialService {
    def dataSource

    def filtrarSolicitudesMaterial(String fDesde, String fHasta, String lugarEntrega, String lugarDevolucion){


        String baseQuery =  "SELECT sm.id, e.nombre as evento, e.fecha as fecha_evento, m.nombre as material, " +
                            "sm.cantidad, sm.fecha_entrega, sm.lugar_entrega, " +
                            "sm.fecha_devolucion, sm.lugar_devolucion, sm.comentarios, sm.observaciones " +
                            "FROM solicitud_material sm, material m, evento e " +
                            "WHERE sm.material_id = m.id AND e.id = sm.evento_id " +
                            "AND e.estado like '%Confirmado%'" +
                            "AND (fecha_entrega BETWEEN '${fDesde}' AND '${fHasta}' " +
                            "OR (fecha_entrega < '${fDesde}' AND (fecha_devolucion BETWEEN '${fDesde}' AND '${fHasta}'))) "

        String entregaQuery = (lugarEntrega) ? "AND lugar_entrega like '%${lugarEntrega}%' " : ""
        String devolucionQuery = (lugarDevolucion) ? "AND lugar_devolucion like '%${lugarDevolucion}%' " : ""

        String sortQuery = " ORDER BY fecha_entrega ASC, fecha_devolucion ASC "

        String query = baseQuery + entregaQuery + devolucionQuery + sortQuery
        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results.asList()
    }
}
