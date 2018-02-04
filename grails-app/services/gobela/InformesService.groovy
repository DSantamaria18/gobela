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

        def totalEventos = sql.rows("SELECT count(e.id) as Eventos FROM evento e WHERE e.estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta  OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta))", desde: fDesde, hasta: fHasta)
        resultList.add(totalEventos)

        def totalEventosRelevantes = sql.rows("SELECT count(e.id) as Eventos FROM evento e WHERE e.relevante = TRUE AND e.estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta  OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta))", desde: fDesde, hasta: fHasta)
        resultList.add(totalEventosRelevantes)

        def eventosDeporteAdaptado = sql.rows("SELECT count(e.id) as Eventos FROM evento e WHERE e.deporte_adaptado = TRUE AND e.estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta  OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta))", desde: fDesde, hasta: fHasta)
        resultList.add(eventosDeporteAdaptado)

        def eventosDeporteInclusivo = sql.rows("SELECT count(e.id) as Eventos FROM evento e WHERE e.deporte_inclusivo = TRUE AND e.estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta  OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta))", desde: fDesde, hasta: fHasta)
        resultList.add(eventosDeporteInclusivo)

        def eventosPorTipoActividad = sql.rows("SELECT t.nombre as 'ta', count(e.id) as num FROM evento e LEFT JOIN tipo_actividad t ON e.t_actividad_id = t.id WHERE e.estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta)) GROUP BY t.nombre", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorTipoActividad)

        def eventosPorActividad = sql.rows("SELECT a.nombre AS act, COUNT(e.id) AS num FROM evento e LEFT JOIN actividad a ON e.actividad_id = a.id WHERE estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta)) GROUP BY a.nombre", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorActividad)

        def eventosPorRecinto = sql.rows("SELECT r.nombre AS recinto, COUNT(e.id) AS num FROM evento e LEFT JOIN recinto r ON e.recinto_id = r.id WHERE estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta)) GROUP BY r.nombre", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorRecinto)

        def eventosPorLugar = sql.rows("SELECT l.nombre_lugar AS lugar, COUNT(e.id) AS num FROM evento e LEFT JOIN lugar l ON e.lugar_id = l.id WHERE estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta)) GROUP BY l.nombre_lugar", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorLugar)

        def eventosPorModalidad = sql.rows("SELECT m.nombre AS modalidad, COUNT(e.id) AS num FROM evento e LEFT JOIN modalidad m ON e.modalidad_id = m.id WHERE estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta)) GROUP BY m.nombre", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorModalidad)

        def eventosPorPublicoDest = sql.rows("SELECT e.publico_dest AS pdest, COUNT(e.publico_dest) AS num FROM evento e WHERE e.estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta)) GROUP BY e.publico_dest", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorPublicoDest)

        def eventosPorEdad = sql.rows("SELECT e.tipo_publico AS pub, COUNT(e.tipo_publico) AS num FROM evento e WHERE e.estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta)) GROUP BY e.tipo_publico", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorEdad)

        def eventosPorEuskGK = sql.rows("SELECT e.euskera_comgk AS gk, COUNT(e.euskera_comgk) AS num FROM evento e WHERE e.estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta)) GROUP BY e.euskera_comgk", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorEuskGK)

        def eventosPorEuskDesarrollo = sql.rows("SELECT e.euskera_desarrollo AS des,COUNT(e.euskera_desarrollo) AS num FROM evento e WHERE e.estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta)) GROUP BY e.euskera_desarrollo", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorEuskDesarrollo)

        def eventosPorEuskSpeaker = sql.rows("SELECT e.euskera_speaker AS speaker,COUNT(e.euskera_speaker) AS num FROM evento e WHERE e.estado IN ('Confirmado','Finalizado') AND (e.fecha BETWEEN :desde AND :hasta OR e.fecha_fin BETWEEN :desde AND :hasta OR (e.fecha < :desde AND e.fecha_fin > :hasta)) GROUP BY e.euskera_speaker", desde: fDesde, hasta: fHasta)
        resultList.add(eventosPorEuskSpeaker)

        return resultList
    }
}
