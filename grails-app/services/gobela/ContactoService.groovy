package gobela

import grails.gorm.transactions.Transactional

@Transactional
class ContactoService {

    def filtrarContactos(params) {
        Long entidadId = params.entidad as Long
        Entidad entidad = Entidad.get(entidadId)
        return Contacto.findAllByEntidad(entidad)
    }

    def getListaClubes() {
        return Entidad.findAllByEs_club(true, [sort: ['nombreEntidad': 'asc']])
    }

    def getListaContactos(def listaEntidades) {
        def listaContactos = []

        listaEntidades.each{
            def contactos = it.contactos
            contactos.each{
                listaContactos.add(it)
            }
        }

        return listaContactos
    }
}
