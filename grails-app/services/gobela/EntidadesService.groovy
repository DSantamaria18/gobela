package gobela

import grails.gorm.transactions.Transactional

@Transactional
class EntidadesService {

    def buscarEntidadesPorNombre(params) {
        def result = [:]

        if (params.q) {
            def criteria = Entidad.createCriteria()
            result.entidadInstanceList = criteria.list(params) {
                like("nombreEntidad", "%${params.q}%")
                order("nombreEntidad", "asc")
            }
            result.entidadInstanceTotal = criteria.count()
        } else {
            result.entidadInstanceList = Entidad.list(params)
            result.entidadInstanceTotal = Entidad.count()
        }

        return result
    }
}
