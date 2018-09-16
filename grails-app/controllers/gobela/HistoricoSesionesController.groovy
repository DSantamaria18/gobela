package gobela

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class HistoricoSesionesController {

    SesionService sesionService

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.order = "desc"
        def historicoSesionesList = HistoricoSesiones.listOrderByFecha(params).collect{[fecha: it.fecha, sesion: it.sesion, club: it.sesion.categoria.club, categoria: it.sesion.categoria, resultado: it.resultadoOk]} as List
        respond historicoSesionesList , model: [historicoSesionesList: historicoSesionesList,  historicoSesionesCount: HistoricoSesiones.count()]
    }

    def show(HistoricoSesiones historicoSesiones) {
        respond historicoSesiones
    }

    def create() {
        HistoricoSesiones historicoSesiones1 = new HistoricoSesiones()
        Sesion sesion = Sesion.get(params.sesionId as Long)
        historicoSesiones1.sesion = sesion
        Date fecha = new Date().parse('yyyy-MM-dd', params.fecha)
        historicoSesiones1.fecha = fecha
        historicoSesiones1.participantes = params.participantes as int
        historicoSesiones1.ocupacion = params.ocupacion as int
        historicoSesiones1.observaciones = params.observaciones
        boolean resultadoOk = (params.resultadoOk == "true") ? true : false

        save(historicoSesiones1)
    }

    @Transactional
    def save(HistoricoSesiones historicoSesiones) {
        if (historicoSesiones == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (historicoSesiones.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond historicoSesiones.errors, view: 'create'
            return
        }

        historicoSesiones.save flush: true
        def sesionesList = sesionService.filtraSesiones(historicoSesiones.sesion.diaSemana, historicoSesiones.sesion.instalacion)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'historicoSesiones.label', default: 'HistoricoSesiones'), historicoSesiones.id])
                render template: "/sesion/listaSesiones", model: [sesionesList: sesionesList, dia: historicoSesiones.sesion.diaSemana.toString(), instalacion: historicoSesiones.sesion.instalacion]
//                redirect historicoSesiones
            }
//            '*' { respond historicoSesiones, [status: CREATED] }
        }
    }

    def edit(HistoricoSesiones historicoSesiones) {
        historicoSesiones.participantes = params.participantes as int
        historicoSesiones.ocupacion = params.ocupacion as int
        historicoSesiones.observaciones = params.observaciones
        historicoSesiones.resultadoOk = (params.resultadoOk == "true") ? true : false
        update(historicoSesiones)
    }

    @Transactional
    def update(HistoricoSesiones historicoSesiones) {
        if (historicoSesiones == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (historicoSesiones.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond historicoSesiones.errors, view: 'edit'
            return
        }

        historicoSesiones.save flush: true

        def sesionesList = sesionService.filtraSesiones(historicoSesiones.sesion.diaSemana, historicoSesiones.sesion.instalacion)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'historicoSesiones.label', default: 'HistoricoSesiones'), historicoSesiones.id])
                render template: "/sesion/listaSesiones", model: [sesionesList: sesionesList, dia: historicoSesiones.sesion.diaSemana.toString(), instalacion: historicoSesiones.sesion.instalacion]
//                redirect historicoSesiones
            }
//            '*' { respond historicoSesiones, [status: OK] }
//            render template: "/sesion/listaSesiones", model: [sesionesList: sesionesList, dia: historicoSesiones.sesion.diaSemana.toString(), instalacion: historicoSesiones.sesion.instalacion]
        }
    }

    @Transactional
    def delete(HistoricoSesiones historicoSesiones) {

        if (historicoSesiones == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        historicoSesiones.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'historicoSesiones.label', default: 'HistoricoSesiones'), historicoSesiones.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'historicoSesiones.label', default: 'HistoricoSesiones'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
