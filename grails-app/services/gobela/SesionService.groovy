package gobela

import grails.gorm.transactions.Transactional

@Transactional
class SesionService {
    /* def filtraSesiones(DiaSemana diaSemana, Instalacion instalacion) {
         def sesionesList = Sesion.executeQuery("from HistoricoSesiones hs right join hs.sesion s where s.diaSemana = :dia and s.instalacion = :instalacion", [dia: diaSemana, instalacion: instalacion])
         return sesionesList
     }*/

    def filtraSesiones(DiaSemana diaSemana, Date fecha) {
        def listaSesiones = HistoricoSesiones.executeQuery("from HistoricoSesiones hs right join hs.sesion s where (s.diaSemana = :dia and hs.fecha is null) or hs.fecha = :hoy order by s.horaInicio asc, s.horaFin asc", [dia: diaSemana, hoy: fecha])
        return listaSesiones
    }

    def filtraSesionesPorInstalacion(DiaSemana diaSemana, Date fecha, Instalacion instalacion) {
        def listaSesiones = HistoricoSesiones.executeQuery("from HistoricoSesiones hs right join hs.sesion s where (s.instalacion = :instalacion and s.diaSemana = :dia and hs.fecha is null) or (s.instalacion = :instalacion and hs.fecha = :hoy) order by s.horaInicio asc, s.horaFin asc", [instalacion: instalacion, dia: diaSemana, hoy: fecha])
        return listaSesiones
    }

    def filtraSesionesPorRecinto(DiaSemana diaSemana, Date fecha, Recinto recinto) {
        def listaSesiones = HistoricoSesiones.executeQuery("from HistoricoSesiones hs right join hs.sesion s where (s.recinto = :recinto and s.diaSemana = :dia and hs.fecha is null) or (s.recinto = :recinto and hs.fecha = :hoy) order by s.horaInicio asc, s.horaFin asc", [recinto: recinto, dia: diaSemana, hoy: fecha])
        return listaSesiones
    }
}
