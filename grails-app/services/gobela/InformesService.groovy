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

    def eventosPorFechas(def fDesde, def fHasta) {
        Sql sql = new Sql(dataSource)
        def resultList = []

        def totalEventos = sql.rows("SELECT count(e.id) as Eventos FROM evento e WHERE estado IN ('Confirmado','Finalizado') AND (fecha BETWEEN :desde AND :hasta  OR fecha_fin BETWEEN :desde AND :hasta OR (fecha < :desde AND fecha_fin > :hasta))", desde: fDesde, hasta: fHasta)
        resultList.add(totalEventos)

        def totalEventosRelevantes = sql.rows("SELECT count(e.id) as Eventos FROM evento e WHERE relevante = TRUE AND estado IN ('Confirmado','Finalizado') AND (fecha BETWEEN :desde AND :hasta  OR fecha_fin BETWEEN :desde AND :hasta OR (fecha < :desde AND fecha_fin > :hasta))", desde: fDesde, hasta: fHasta)
        resultList.add(totalEventosRelevantes)

        def eventosDeporteAdaptado = sql.rows("SELECT count(e.id) as Eventos FROM evento e WHERE deporte_adaptado = TRUE AND estado IN ('Confirmado','Finalizado') AND (fecha BETWEEN :desde AND :hasta  OR fecha_fin BETWEEN :desde AND :hasta OR (fecha < :desde AND fecha_fin > :hasta))", desde: fDesde, hasta: fHasta)
        resultList.add(eventosDeporteAdaptado)

        def eventosDeporteInclusivo = sql.rows("SELECT count(e.id) as Eventos FROM evento e WHERE deporte_inclusivo = TRUE AND estado IN ('Confirmado','Finalizado') AND (fecha BETWEEN :desde AND :hasta  OR fecha_fin BETWEEN :desde AND :hasta OR (fecha < :desde AND fecha_fin > :hasta))", desde: fDesde, hasta: fHasta)
        resultList.add(eventosDeporteInclusivo)

        def eventosPorTipoActividad = sql.rows("SELECT t.nombre as 'ta', count(e.id) as num FROM evento e LEFT JOIN tipo_actividad t ON e.t_actividad_id = t.id WHERE estado IN ('Confirmado','Finalizado') AND (fecha BETWEEN :desde AND :hasta OR fecha_fin BETWEEN :desde AND :hasta OR (fecha < :desde AND fecha_fin > :hasta)) GROUP BY t.nombre", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorTipoActividad)

        def eventosPorActividad = sql.rows("SELECT a.nombre AS act, COUNT(e.id) AS num FROM evento e LEFT JOIN actividad a ON e.actividad_id = a.id WHERE estado IN ('Confirmado','Finalizado') AND (fecha BETWEEN :desde AND :hasta OR fecha_fin BETWEEN :desde AND :hasta OR (fecha < :desde AND fecha_fin > :hasta)) GROUP BY a.nombre", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorActividad)

        def eventosPorRecinto = sql.rows("SELECT r.nombre AS recinto, COUNT(e.id) AS num FROM evento e LEFT JOIN recinto r ON e.recinto_id = r.id WHERE estado IN ('Confirmado','Finalizado') AND (fecha BETWEEN :desde AND :hasta OR fecha_fin BETWEEN :desde AND :hasta OR (fecha < :desde AND fecha_fin > :hasta)) GROUP BY r.nombre", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorRecinto)

        def eventosPorLugar = sql.rows("SELECT l.nombre_lugar AS lugar, COUNT(e.id) AS num FROM evento e LEFT JOIN lugar l ON e.lugar_id = l.id WHERE estado IN ('Confirmado','Finalizado') AND (fecha BETWEEN :desde AND :hasta OR fecha_fin BETWEEN :desde AND :hasta OR (fecha < :desde AND fecha_fin > :hasta)) GROUP BY l.nombre_lugar", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorLugar)

        def eventosPorModalidad = sql.rows("SELECT m.nombre AS modalidad, COUNT(e.id) AS num FROM evento e LEFT JOIN modalidad m ON e.modalidad_id = m.id WHERE estado IN ('Confirmado','Finalizado') AND (fecha BETWEEN :desde AND :hasta OR fecha_fin BETWEEN :desde AND :hasta OR (fecha < :desde AND fecha_fin > :hasta)) GROUP BY m.nombre", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorModalidad)

        return resultList
    }
}
