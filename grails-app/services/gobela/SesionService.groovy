package gobela

import grails.gorm.transactions.Transactional

@Transactional
class SesionService {

    def getSesionesDeHoy(final Date hoy) {
        final DiaSemana diaSemana = DiaSemana.getDiaSemanaFromFecha(hoy)
        final def listaSesiones = Sesion.executeQuery("FROM Sesion s LEFT JOIN HistoricoSesiones hs ON hs.sesionId = s.id AND hs.fecha >= :fecha WHERE s.activa = true AND s.diaSemana = :diaSemana ORDER BY s.horaInicio ASC, s.horaFin ASC", [diaSemana: diaSemana, fecha: hoy])
        final List model = getSesionesModel(listaSesiones)
        return model
    }

    List getSesionesModel(final List listaSesiones) {
        def model = []
        for (sesionData in listaSesiones) {
            def sesion = [:]
            sesion['diaSemana'] = sesionData[0].diaSemana
            sesion['id'] = sesionData[0].id
            sesion['clubId'] = sesionData[0].categoria.club.id
            sesion['club'] = sesionData[0].categoria.club
            sesion['categoriaId'] = sesionData[0].categoria.id
            sesion['categoria'] = sesionData[0].categoria
            sesion['horaInicio'] = sesionData[0].horaInicio
            sesion['horaFin'] = sesionData[0].horaFin
            sesion['recintoId'] = sesionData[0].recinto.id
            sesion['recinto'] = sesionData[0].recinto
            sesion['instalacionId'] = sesionData[0].instalacion.id
            sesion['instalacion'] = sesionData[0].instalacion
            sesion['participantes'] = sesionData[0].categoria.numDeportistas
            sesion['ocupacion'] = sesionData[0].ocupacion

            sesion['sesionDeHoy'] = (sesionData[1]) ?: null
            model.add(sesion)
        }
        return model
    }

    private static def filtraDatosHistorico(final List sesionesList, final Date fecha) {
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

            //            def listaHistoricoSesiones = sesionData?.historicoSesiones
            def listaHistoricoSesiones = HistoricoSesionesService.getHistoricoPorSesionYFecha(sesionData.id, fecha)
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

    def filtraSesiones(final DiaSemana diaSemana, final Date fecha) {
        final def sesiones = Sesion.executeQuery("FROM Sesion s LEFT JOIN HistoricoSesiones hs ON hs.sesionId = s.id AND hs.fecha >= :fecha WHERE s.diaSemana = :diaSemana AND s.activa = true ORDER BY s.horaInicio ASC, s.horaFin ASC", [diaSemana: diaSemana, fecha: fecha])
        final List listaSesiones = getSesionesModel(sesiones)
        return listaSesiones
    }

    def filtraSesionesPorInstalacion(final DiaSemana diaSemana, final Date fecha, final Instalacion instalacion) {
        final def listaSesiones = HistoricoSesiones.executeQuery("FROM Sesion s LEFT JOIN HistoricoSesiones hs ON hs.sesionId = s.id AND hs.fecha >= :hoy WHERE s.activa = true AND s.diaSemana = :diaSemana AND s.instalacion = :instalacion order by s.horaInicio asc, s.horaFin asc", [instalacion: instalacion, dia: diaSemana, hoy: fecha])
        final List model = getSesionesModel(listaSesiones)
        return model
    }

    def filtraSesionesPorRecinto(final DiaSemana diaSemana, final Date fecha, final Recinto recinto) {
        final def sesiones = Sesion.executeQuery("FROM Sesion s LEFT JOIN HistoricoSesiones hs ON hs.sesionId = s.id AND hs.fecha >= :fecha WHERE s.activa = true AND s.diaSemana = :diaSemana AND s.recinto = :recinto order by s.horaInicio asc, s.horaFin asc", [diaSemana: diaSemana, recinto: recinto, fecha: fecha])
        final List model = getSesionesModel(sesiones)
        return model
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
