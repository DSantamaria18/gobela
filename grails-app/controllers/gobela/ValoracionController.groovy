package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class ValoracionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def result = Valoracion.executeQuery("select v, s.nombreEntidad as entidad, s.nombreSolicitante as solicitante from Valoracion v join v.solicitud s")
        [list: result, valoracionInstanceCount: result.size()]
    }

    def show(Valoracion valoracionInstance) {
//        respond valoracionInstance
        [valoracionInstance: valoracionInstance]
    }

    def create() {
        Solicitud solicitud = Solicitud.get(params.solicitudId)
        params.importeSolicitado = solicitud.importeSolicitado
        respond new Valoracion(params)
    }

    @Transactional
    def save(Valoracion valoracionInstance) {
        if (valoracionInstance == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (valoracionInstance.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond valoracionInstance.errors, view:'create'
            return
        }
        valoracionInstance.l1viabilidad = (params?.l1viabilidad) ? 2.5 : 0
        valoracionInstance.l1objetivosGK = (params?.l1objetivosGK) ? 2.5 : 0
        valoracionInstance.l1lenguajeNoSexista = (params?.l1lenguajeNoSexista) ? 1 : 0
        valoracionInstance.l1lenguajeDeGenero = (params?.l1lenguajeDeGenero) ? 1 : 0
        valoracionInstance.l1representacionFemeninaJunta = (params?.l1representacionFemeninaJunta) ? 1 : 0
        valoracionInstance.l1inmigracion = (params?.l1inmigracion) ? 1 : 0
        valoracionInstance.l1personasDiscapacidad = (params?.l1personasDiscapacidad) ? 1 : 0
        valoracionInstance.l1proyectoDeportivoEuskera = (params?.l1proyectoDeportivoEuskera) ? 10 : 0
        valoracionInstance.l1prensaLocal = (params?.l1prensaLocal) ? 1 : 0
        valoracionInstance.l1prensaComarcal = (params?.l1prensaComarcal) ? 1 : 0
        valoracionInstance.l1prensaRegional = (params?.l1prensaRegional) ? 1 : 0
        valoracionInstance.l1prensaEstatalInternacional = (params?.l1prensaEstatalInternacional) ? 2 : 0
        valoracionInstance.l1deporteEscolar = (params?.l1deporteEscolar) ? 8 : 0
        valoracionInstance.l1marcaGetxo = (params?.l1marcaGetxo) ? 7 : 0
        valoracionInstance.l1getxoKirolak = (params?.l1getxoKirolak) ? 3 : 0
        valoracionInstance.l1centrosEscolares = (params?.l1centrosEscolares) ? 1 : 0
        valoracionInstance.l1otrosClubes = (params?.l1otrosClubes) ? 1 : 0

        valoracionInstance.l2viabilidad = (params?.l2viabilidad) ? 2.5 : 0
        valoracionInstance.l2objetivosGK = (params?.l2objetivosGK) ? 2.5 : 0
        valoracionInstance.l2lenguajeNoSexista = (params?.l2lenguajeNoSexista) ? 0.5 : 0
        valoracionInstance.l2lenguajeDeGenero = (params?.l2lenguajeDeGenero) ? 0.5 : 0
        valoracionInstance.l2representacionFemeninaJunta = (params?.l2representacionFemeninaJunta) ? 2 : 0
        valoracionInstance.l2inmigracion = (params?.l2inmigracion) ? 1 : 0
        valoracionInstance.l2personasDiscapacidad = (params?.l2personasDiscapacidad) ? 1 : 0
        valoracionInstance.l2proyectoDeportivoEuskera = (params?.l2proyectoDeportivoEuskera) ? 10 : 0
        valoracionInstance.l2esClubFutbol = (params?.l2esClubFutbol) ? true : false
        valoracionInstance.l2prensaLocal = (params?.l2prensaLocal) ? 1 : 0
        valoracionInstance.l2prensaComarcal = (params?.l2prensaComarcal) ? 1 : 0
        valoracionInstance.l2prensaRegional = (params?.l2prensaRegional) ? 1 : 0
        valoracionInstance.l2prensaEstatalInternacional = (params?.l2prensaEstatalInternacional) ? 2 : 0
        valoracionInstance.l2deporteEscolar = (params?.l2deporteEscolar) ? 8 : 0
        valoracionInstance.l2marcaGetxo = (params?.l2marcaGetxo) ? 7 : 0
        valoracionInstance.l2getxoKirolak = (params?.l2getxoKirolak) ? 3 : 0
        valoracionInstance.l2centrosEscolares = (params?.l2centrosEscolares) ? 1 : 0
        valoracionInstance.l2otrosClubes = (params?.l2otrosClubes) ? 1 : 0

        valoracionInstance.l4propioClub = (params?.l4propioClub) ? 10 : 0
        valoracionInstance.l4otrosClubes = (params?.l4otrosClubes) ? 15 : 0
        valoracionInstance.l4ampas = (params?.l4ampas) ? 5 : 0
        valoracionInstance.l4categoriasEscolares = (params?.l4categoriasEscolares) ? 15 : 0
        valoracionInstance.l4categoriasFederadas = (params?.l4categoriasFederadas) ? 10 : 0
        valoracionInstance.l4veteranos = (params?.l4veteranos) ? 5 : 0
        valoracionInstance.l4participacionEstimada = (params?.l4participacionEstimada) ? 2 : 0
        valoracionInstance.l4comunicacionAMedios = (params?.l4comunicacionAMedios) ? 4 : 0
        valoracionInstance.l4usoNuevasTecnologías = (params?.l4usoNuevasTecnologías) ? 4 : 0

        valoracionInstance.l5participacionEstimada = (params?.l5participacionEstimada) ? 2 : 0
        valoracionInstance.l5comunicacionAMedios = (params?.l5comunicacionAMedios) ? 4 : 0
        valoracionInstance.l5usoNuevasTecnologías = (params?.l5usoNuevasTecnologías) ? 4 : 0
        valoracionInstance.l5actividadesEuskera = (params?.l5usoNuevasTecnologías) ? 5 : 0

        valoracionInstance.l6prensaLocal = (params?.l6prensaLocal) ? 5 : 0
        valoracionInstance.l6prensaComarcal = (params?.l6prensaComarcal) ? 10 : 0
        valoracionInstance.l6prensaRegional = (params?.l6prensaRegional) ? 15 : 0
        valoracionInstance.l6prensaEstatal = (params?.l6prensaEstatal) ? 20 : 0

        valoracionInstance.l7prensaLocal = (params?.l7prensaLocal) ? 5 : 0
        valoracionInstance.l7prensaComarcal = (params?.l7prensaComarcal) ? 10 : 0
        valoracionInstance.l7prensaRegional = (params?.l7prensaRegional) ? 15 : 0
        valoracionInstance.l7prensaEstatal = (params?.l7prensaEstatal) ? 20 : 0

        valoracionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'valoracion.label', default: 'Valoracion'), valoracionInstance.id])
                redirect valoracionInstance
            }
            '*' { respond valoracionInstance, [status: CREATED] }
        }
    }

    def edit(Valoracion valoracionInstance) {
        Solicitud solicitud = Solicitud.get(valoracionInstance.solicitudId)
        def importeSolicitado = solicitud.importeSolicitado
        [valoracionInstance: valoracionInstance, importeSolicitado: importeSolicitado]
    }

    def cancel() {
        Valoracion valoracionInstance = Valoracion.get(params.id)
        redirect action: "show", id: valoracionInstance.id
    }

    @Transactional
    def update(Valoracion valoracionInstance) {
        if (valoracionInstance == null) {
            notFound()
            return
        }

        if (valoracionInstance.hasErrors()) {
            respond valoracionInstance.errors, view: 'edit'
            return
        }

        valoracionInstance.l1viabilidad = (params?.l1viabilidad) ? 2.5 : 0
        valoracionInstance.l1objetivosGK = (params?.l1objetivosGK) ? 2.5 : 0
        valoracionInstance.l1lenguajeNoSexista = (params?.l1lenguajeNoSexista) ? 1 : 0
        valoracionInstance.l1lenguajeDeGenero = (params?.l1lenguajeDeGenero) ? 1 : 0
        valoracionInstance.l1representacionFemeninaJunta = (params?.l1representacionFemeninaJunta) ? 2 : 0
        valoracionInstance.l1inmigracion = (params?.l1inmigracion) ? 1 : 0
        valoracionInstance.l1personasDiscapacidad = (params?.l1personasDiscapacidad) ? 1 : 0
        valoracionInstance.l1proyectoDeportivoEuskera = (params?.l1proyectoDeportivoEuskera) ? 10 : 0
        valoracionInstance.l1prensaLocal = (params?.l1prensaLocal) ? 1 : 0
        valoracionInstance.l1prensaComarcal = (params?.l1prensaComarcal) ? 1 : 0
        valoracionInstance.l1prensaRegional = (params?.l1prensaRegional) ? 1 : 0
        valoracionInstance.l1prensaEstatalInternacional = (params?.l1prensaEstatalInternacional) ? 2 : 0
        valoracionInstance.l1deporteEscolar = (params?.l1deporteEscolar) ? 8 : 0
        valoracionInstance.l1marcaGetxo = (params?.l1marcaGetxo) ? 7 : 0
        valoracionInstance.l1getxoKirolak = (params?.l1getxoKirolak) ? 3 : 0
        valoracionInstance.l1centrosEscolares = (params?.l1centrosEscolares) ? 1 : 0
        valoracionInstance.l1otrosClubes = (params?.l1otrosClubes) ? 1 : 0

        valoracionInstance.l2viabilidad = (params?.l2viabilidad) ? 2.5 : 0
        valoracionInstance.l2objetivosGK = (params?.l2objetivosGK) ? 2.5 : 0
        valoracionInstance.l2lenguajeNoSexista = (params?.l2lenguajeNoSexista) ? 0.5 : 0
        valoracionInstance.l2lenguajeDeGenero = (params?.l2lenguajeDeGenero) ? 0.5 : 0
        valoracionInstance.l2representacionFemeninaJunta = (params?.l2representacionFemeninaJunta) ? 2 : 0
        valoracionInstance.l2inmigracion = (params?.l2inmigracion) ? 1 : 0
        valoracionInstance.l2personasDiscapacidad = (params?.l2personasDiscapacidad) ? 1 : 0
        valoracionInstance.l2proyectoDeportivoEuskera = (params?.l2proyectoDeportivoEuskera) ? 10 : 0
        valoracionInstance.l2esClubFutbol = (params?.l2esClubFutbol) ? true : false
        valoracionInstance.l2prensaLocal = (params?.l2prensaLocal) ? 1 : 0
        valoracionInstance.l2prensaComarcal = (params?.l2prensaComarcal) ? 1 : 0
        valoracionInstance.l2prensaRegional = (params?.l2prensaRegional) ? 1 : 0
        valoracionInstance.l2prensaEstatalInternacional = (params?.l2prensaEstatalInternacional) ? 2 : 0
        valoracionInstance.l2deporteEscolar = (params?.l2deporteEscolar) ? 8 : 0
        valoracionInstance.l2marcaGetxo = (params?.l2marcaGetxo) ? 7 : 0
        valoracionInstance.l2getxoKirolak = (params?.l2getxoKirolak) ? 3 : 0
        valoracionInstance.l2centrosEscolares = (params?.l2centrosEscolares) ? 1 : 0
        valoracionInstance.l2otrosClubes = (params?.l2otrosClubes) ? 1 : 0

        valoracionInstance.l4propioClub = (params?.l4propioClub) ? 10 : 0
        valoracionInstance.l4otrosClubes = (params?.l4otrosClubes) ? 15 : 0
        valoracionInstance.l4ampas = (params?.l4ampas) ? 5 : 0
        valoracionInstance.l4categoriasEscolares = (params?.l4categoriasEscolares) ? 15 : 0
        valoracionInstance.l4categoriasFederadas = (params?.l4categoriasFederadas) ? 10 : 0
        valoracionInstance.l4veteranos = (params?.l4veteranos) ? 5 : 0
        valoracionInstance.l4participacionEstimada = (params?.l4participacionEstimada) ? 2 : 0
        valoracionInstance.l4comunicacionAMedios = (params?.l4comunicacionAMedios) ? 4 : 0
        valoracionInstance.l4usoNuevasTecnologías = (params?.l4usoNuevasTecnologías) ? 4 : 0

        valoracionInstance.l5participacionEstimada = (params?.l5participacionEstimada) ? 2 : 0
        valoracionInstance.l5comunicacionAMedios = (params?.l5comunicacionAMedios) ? 4 : 0
        valoracionInstance.l5usoNuevasTecnologías = (params?.l5usoNuevasTecnologías) ? 4 : 0
        valoracionInstance.l5actividadesEuskera = (params?.l5usoNuevasTecnologías) ? 5 : 0

        valoracionInstance.l6prensaLocal = (params?.l6prensaLocal) ? 5 : 0
        valoracionInstance.l6prensaComarcal = (params?.l6prensaComarcal) ? 10 : 0
        valoracionInstance.l6prensaRegional = (params?.l6prensaRegional) ? 15 : 0
        valoracionInstance.l6prensaEstatal = (params?.l6prensaEstatal) ? 20 : 0

        valoracionInstance.l7prensaLocal = (params?.l7prensaLocal) ? 5 : 0
        valoracionInstance.l7prensaComarcal = (params?.l7prensaComarcal) ? 10 : 0
        valoracionInstance.l7prensaRegional = (params?.l7prensaRegional) ? 15 : 0
        valoracionInstance.l7prensaEstatal = (params?.l7prensaEstatal) ? 20 : 0

        valoracionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Valoracion.label', default: 'Valoracion'), valoracionInstance.id])
                redirect valoracionInstance
            }
            '*' { respond valoracionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Valoracion valoracionInstance) {

        if (valoracionInstance == null) {
            notFound()
            return
        }

        valoracionInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Valoracion.label', default: 'Valoracion'), valoracionInstance.id])
                redirect(uri: '/')
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'valoracion.label', default: 'Valoracion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
