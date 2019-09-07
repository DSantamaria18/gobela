package gobela

import grails.gorm.transactions.Transactional

@Transactional
class HistoricoSesionesService {

    static def getHistoricoPorSesionYFecha(final Long sesionId, final Date fecha) {
        final String query = "FROM HistoricoSesiones hs WHERE hs.sesionId = ${sesionId} AND hs.fecha = '${fecha}'"

        final def listaHistoricoSesiones = HistoricoSesiones.executeQuery(query)
        return listaHistoricoSesiones
    }
}
