package gobela

import grails.gorm.transactions.Transactional

@Transactional
class ContactoService {

    def filtrarContactos(params) {
        Long entidadId = params.entidad as Long
        Entidad entidad = Entidad.get(entidadId)
        return Contacto.findAllByEntidad(entidad)
    }
}
