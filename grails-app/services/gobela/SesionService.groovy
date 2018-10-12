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
}
