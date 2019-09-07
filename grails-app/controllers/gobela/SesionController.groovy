package gobela


import java.time.LocalTime

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class SesionController {

    SesionService sesionService

    static allowedMethods = [save: "POST", update: "PUT", actualizaEstadoById: "POST", delete: "DELETE"]

    def index() {
        final Date fecha = new Date().clearTime()
        final DiaSemana diaSemana = DiaSemana.getDiaSemanaFromFecha(fecha)
        final def listaSesiones = sesionService.getSesionesDeHoy(fecha)

        [diaSemana: diaSemana, listaSesiones: listaSesiones]
    }

    def filtraInstalacionesPorRecinto(params) {
        Long recintoId = params?.recinto ? params.recinto as Long : null
        if (recintoId) {
            Recinto recinto = Recinto.findById(recintoId)
            def instalacionesList = Instalacion.findAllByRecinto(recinto)
            render template: "comboInstalaciones", model: [instalacionesList: instalacionesList]
        }
    }

    def filtraSesiones(params) {
        final Date fecha = new Date().clearTime()
        final DiaSemana diaSemana = DiaSemana.getDiaSemanaFromFecha(fecha)

        final Long recintoId =  (params?.recintoId == 'null') ? null : params.recintoId as Long
        final Long instalacionId = params?.instalacionId ? params.instalacionId as Long : null

        def sesionesList
        if(instalacionId){
            final Instalacion instalacion = Instalacion.get(instalacionId)
            sesionesList = sesionService.filtraSesionesPorInstalacion(diaSemana, fecha, instalacion)
        } else if(recintoId){
            final Recinto recinto = Recinto.get(recintoId)
            sesionesList = sesionService.filtraSesionesPorRecinto(diaSemana, fecha, recinto)
        }else {
            sesionesList = sesionService.filtraSesiones(diaSemana, fecha)
        }

        render template: "listaSesiones2", model: [diaSemana: diaSemana, listaSesiones: sesionesList]
    }

    def show(Sesion sesion) {
        respond sesion
    }

    def create() {
        final Categoria categoria = Categoria.get(params.categoria as Long)
        respond new Sesion(params), model: [categoria: categoria]
    }

    @Transactional
    def save(Sesion sesion) {
        if (sesion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        LocalTime horaInicio = LocalTime.of(sesion.horaInicio.split(':')[0] as Integer, sesion.horaInicio.split(':')[1] as Integer)
        LocalTime horaFin = LocalTime.of(sesion.horaFin.split(':')[0] as Integer, sesion.horaFin.split(':')[1] as Integer)
        sesion.horaInicio = horaInicio
        sesion.horaFin = horaFin

        if (sesion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sesion.errors, view: 'create'
            return
        }

        sesion.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sesion.label', default: 'Sesion'), sesion.id])
                redirect sesion
            }
            '*' { respond sesion, [status: CREATED] }
        }
    }

    def edit(Sesion sesion) {
        respond sesion
    }

    def actualizaEstadoById(Long sesionId, boolean nuevoEstado){
        Sesion sesion = Sesion.findById(sesionId)
        sesion.activa = nuevoEstado
        update(sesion)
    }

    @Transactional
    def update(Sesion sesion) {
        if (sesion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        LocalTime horaInicio = LocalTime.of(sesion.horaInicio.split(':')[0] as Integer, sesion.horaInicio.split(':')[1] as Integer)
        LocalTime horaFin = LocalTime.of(sesion.horaFin.split(':')[0] as Integer, sesion.horaFin.split(':')[1] as Integer)
        sesion.horaInicio = horaInicio
        sesion.horaFin = horaFin

        if (sesion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sesion.errors, view: 'edit'
            return
        }

        sesion.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'sesion.label', default: 'Sesion'), sesion.id])
                redirect sesion
            }
            '*' { respond sesion, [status: OK] }
        }
    }

    @Transactional
    def delete(Sesion sesion) {

        if (sesion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        sesion.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'sesion.label', default: 'Sesion'), sesion.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sesion.label', default: 'Sesion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
