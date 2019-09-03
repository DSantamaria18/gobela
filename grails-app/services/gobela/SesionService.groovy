package gobela

import grails.gorm.transactions.Transactional

@Transactional
class SesionService {

    private static def limpiaRegistrosDeFechasAnterioresDeListaDeSesiones(List sesionesList, Date fecha) {
        def listaSesiones = []
        for (sesionData in sesionesList) {
            def sesion = [:]
            sesion['diaSemana'] = sesionData.diaSemana
            sesion['id'] = sesionData.id
            sesion['clubId'] = sesionData.categoria.club.id
            sesion['club'] = sesionData.categoria.club
            sesion['categoriaId'] = sesionData.categoria.id
            sesion['categoria'] = sesionData.categoria
            sesion['horaInicio'] = sesionData.horaInicio
            sesion['horaFin'] = sesionData.horaFin
            sesion['recintoId'] = sesionData.recinto.id
            sesion['recinto'] = sesionData.recinto
            sesion['instalacionId'] = sesionData.instalacion.id
            sesion['instalacion'] = sesionData.instalacion
            sesion['participantes'] = sesionData.categoria.numDeportistas
            sesion['ocupacion'] = sesionData.ocupacion

            def listaHistoricoSesiones = sesionData?.historicoSesiones
            HistoricoSesiones sesionDeHoy
            if (listaHistoricoSesiones?.size() > 1) {
                for (hSesion in listaHistoricoSesiones) {
                    if (hSesion.fecha == fecha) {
                        sesionDeHoy = hSesion
                        break
                    }
                }
            } else if (listaHistoricoSesiones?.size() == 1) {
                if (fecha.toTimestamp().equals(listaHistoricoSesiones[0].fecha)) {
                    sesionDeHoy = new HistoricoSesiones()
                    sesionDeHoy.fecha = listaHistoricoSesiones[0].fecha
                    sesionDeHoy.participantes = listaHistoricoSesiones[0].participantes
                    sesionDeHoy.ocupacion = listaHistoricoSesiones[0].ocupacion
                    sesionDeHoy.observaciones = listaHistoricoSesiones[0].observaciones
                    sesionDeHoy.resultadoOk = listaHistoricoSesiones[0].resultadoOk
                }
            }
            sesion['sesionDeHoy'] = sesionDeHoy
            listaSesiones.add(sesion)
        }
        return listaSesiones
    }

    def filtraSesiones(DiaSemana diaSemana, Date fecha) {
        def sesiones = Sesion.executeQuery("from Sesion s where s.diaSemana = :diaSemana and s.activa = true order by s.horaInicio asc, s.horaFin asc", [diaSemana: diaSemana])
        def listaSesiones = limpiaRegistrosDeFechasAnterioresDeListaDeSesiones(sesiones, fecha)
        return listaSesiones
    }

    def filtraSesionesPorInstalacion(DiaSemana diaSemana, Date fecha, Instalacion instalacion) {
        def listaSesiones = gobela.HistoricoSesiones.executeQuery("from HistoricoSesiones hs right join hs.sesion s where (s.instalacion = :instalacion and s.diaSemana = :dia and hs.fecha is null and s.activa = true) or (s.instalacion = :instalacion and hs.fecha = :hoy and s.activa = true) order by s.horaInicio asc, s.horaFin asc", [instalacion: instalacion, dia: diaSemana, hoy: fecha])
        return listaSesiones
    }

    def filtraSesionesPorRecinto(DiaSemana diaSemana, Date fecha, Recinto recinto) {
        def sesiones = Sesion.executeQuery("from Sesion s where s.diaSemana = :diaSemana and s.activa = true and s.recinto = :recinto order by s.horaInicio asc, s.horaFin asc", [diaSemana: diaSemana, recinto: recinto])
        def listaSesiones = limpiaRegistrosDeFechasAnterioresDeListaDeSesiones(sesiones, fecha)
        return listaSesiones
    }

    def filtraHistoricoSesiones(final Date fDesde, final Date fHasta, final Club club, final Long categoriaId,
                                final Recinto recinto, final Instalacion instalacion, final Boolean resultadoOk) {
        final String baseQuery = "SELECT hs from HistoricoSesiones hs where hs.fecha <= :fHasta"
        final def args = ['fHasta': fHasta]
        String qDesde, qCategoria, qClub, qRecinto, qInstalacion, qResultadoOk

        if (fDesde) {
            qDesde = " and hs.fecha >= :fDesde"
            args['fDesde'] = fDesde
        } else {
            qDesde = ""
        }

        if (categoriaId) {
            qCategoria = " and hs.categoriaId = :categoriaId"
            args['categoriaId'] = categoriaId
        } else {
            qCategoria = ""
        }

        if (club) {
            qClub = " and hs.club = :club"
            args['club'] = club
        } else {
            qClub = ""
        }

        if (recinto) {
            qRecinto = " and hs.recinto = :recinto"
            args['recinto'] = recinto
        } else {
            qRecinto = ""
        }

        if (instalacion) {
            qInstalacion = " and hs.instalacion = :instalacion"
            args['instalacion'] = instalacion
        } else {
            qInstalacion = ""
        }

        if (resultadoOk != null) {
            qResultadoOk = " and hs.resultadoOk = :resultadoOk"
            args['resultadoOk'] = resultadoOk
        } else {
            qResultadoOk = ""
        }
        final String sortQuery = " order by hs.fecha desc, hs.horaInicio desc, hs.horaFin desc"
        final String query = baseQuery + qDesde + qClub + qCategoria + qRecinto + qInstalacion + qResultadoOk + sortQuery

        final def listaHistoricoSesiones = HistoricoSesiones.executeQuery(query, args)
        return listaHistoricoSesiones
    }


}
