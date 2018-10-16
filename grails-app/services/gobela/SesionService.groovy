package gobela

import grails.gorm.transactions.Transactional

import static gobela.HistoricoSesiones.executeQuery

@Transactional
class SesionService {
    /* def filtraSesiones(DiaSemana diaSemana, Instalacion instalacion) {
         def sesionesList = Sesion.executeQuery("from HistoricoSesiones hs right join hs.sesion s where s.diaSemana = :dia and s.instalacion = :instalacion", [dia: diaSemana, instalacion: instalacion])
         return sesionesList
     }*/

    def filtraSesiones(DiaSemana diaSemana, Date fecha) {
        def listaSesiones = executeQuery("from HistoricoSesiones hs right join hs.sesion s where (s.diaSemana = :dia and hs.fecha is null) or hs.fecha = :hoy order by s.horaInicio asc, s.horaFin asc", [dia: diaSemana, hoy: fecha])
        return listaSesiones
    }

    def filtraSesionesPorInstalacion(DiaSemana diaSemana, Date fecha, Instalacion instalacion) {
        def listaSesiones = executeQuery("from HistoricoSesiones hs right join hs.sesion s where (s.instalacion = :instalacion and s.diaSemana = :dia and hs.fecha is null) or (s.instalacion = :instalacion and hs.fecha = :hoy) order by s.horaInicio asc, s.horaFin asc", [instalacion: instalacion, dia: diaSemana, hoy: fecha])
        return listaSesiones
    }

    def filtraSesionesPorRecinto(DiaSemana diaSemana, Date fecha, Recinto recinto) {
        def listaSesiones = executeQuery("from HistoricoSesiones hs right join hs.sesion s where (s.recinto = :recinto and s.diaSemana = :dia and hs.fecha is null) or (s.recinto = :recinto and hs.fecha = :hoy) order by s.horaInicio asc, s.horaFin asc", [recinto: recinto, dia: diaSemana, hoy: fecha])
        return listaSesiones
    }

    def filtraHistoricoSesiones(Date fDesde, Date fHasta, Club club, Categoria categoria, Boolean resultadoOk){
//        String baseQuery = "from HistoricoSesiones hs right join hs.sesion s where hs.fecha <= :fHasta"
        String baseQuery = "from HistoricoSesiones hs where hs.fecha <= :fHasta"
        def args = ['fHasta': fHasta]
        String qDesde, qCategoria, qClub, qResultadoOk

        if (fDesde) {
            qDesde = " and hs.fecha >= :fDesde"
            args['fDesde'] = fDesde
        } else {
            qDesde = ""
        }

        if (categoria) {
            qCategoria = " and hs.sesion.categoria = :categoria"
            args['categoria'] = categoria
        } else {
            qCategoria = ""
        }

        if (club) {
            qClub = " and hs.sesion.categoria.club = :club"
            args['club'] = club
        } else {
            qClub = ""
        }

        if (resultadoOk != null) {
            qResultadoOk = " and hs.resultadoOk = :resultadoOk"
            args['resultadoOk'] = resultadoOk
        } else {
            qResultadoOk = ""
        }

        String query = baseQuery + qDesde + qClub + qCategoria + qResultadoOk

        def listaHistoricoSesiones = executeQuery(query, args)
        return listaHistoricoSesiones
    }


}
