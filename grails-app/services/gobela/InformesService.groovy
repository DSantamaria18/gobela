package gobela

import grails.gorm.transactions.Transactional
import groovy.sql.Sql

@Transactional
class InformesService {

    def dataSource

    def subvencionesPorLinea() {
        Sql sql = new Sql(dataSource)
        def resultList = []

        def resultadoL1 = sql.rows("select s.nombre_entidad as entidad, s.nombre_solicitante as solicitante, sum(v.importe_concedido) as concedido from valoracion v join solicitud s where v.solicitud_id = s.id and s.linea = 1 group by s.nombre_entidad, s.nombre_solicitante")
        resultList.add(resultadoL1)

        def resultadoL2 = sql.rows("select s.nombre_entidad as entidad, s.nombre_solicitante as solicitante, sum(v.importe_concedido) as concedido from valoracion v join solicitud s where v.solicitud_id = s.id and s.linea = 2 group by s.nombre_entidad, s.nombre_solicitante")
        resultList.add(resultadoL2)

        def resultadoL3 = sql.rows("select s.nombre_entidad as entidad, s.nombre_solicitante as solicitante, sum(v.importe_concedido) as concedido from valoracion v join solicitud s where v.solicitud_id = s.id and s.linea = 3 group by s.nombre_entidad, s.nombre_solicitante")
        resultList.add(resultadoL3)

        def resultadoL4 = sql.rows("select s.nombre_entidad as entidad, s.nombre_solicitante as solicitante, sum(v.importe_concedido) as concedido from valoracion v join solicitud s where v.solicitud_id = s.id and s.linea = 4 group by s.nombre_entidad, s.nombre_solicitante")
        resultList.add(resultadoL4)

        def resultadoL5 = sql.rows("select s.nombre_entidad as entidad, s.nombre_solicitante as solicitante, sum(v.importe_concedido) as concedido from valoracion v join solicitud s where v.solicitud_id = s.id and s.linea = 5 group by s.nombre_entidad, s.nombre_solicitante")
        resultList.add(resultadoL5)

        def resultadoL6 = sql.rows("select s.nombre_entidad as entidad, s.nombre_solicitante as solicitante, sum(v.importe_concedido) as concedido from valoracion v join solicitud s where v.solicitud_id = s.id and s.linea = 6 group by s.nombre_entidad, s.nombre_solicitante")
        resultList.add(resultadoL6)

        def resultadoL7 = sql.rows("select s.nombre_entidad as entidad, s.nombre_solicitante as solicitante, sum(v.importe_concedido) as concedido from valoracion v join solicitud s where v.solicitud_id = s.id and s.linea = 7 group by s.nombre_entidad, s.nombre_solicitante")
        resultList.add(resultadoL7)

        return resultList
    }
}
