package gobela

import grails.gorm.transactions.Transactional

@Transactional
class SesionService {

    def filtraSesiones(DiaSemana diaSemana, Instalacion instalacion) {
        def sesionesList = Sesion.executeQuery("from HistoricoSesiones hs right join hs.sesion s where s.diaSemana = :dia and s.instalacion = :instalacion", [dia: diaSemana, instalacion: instalacion])
        return sesionesList
    }
}
