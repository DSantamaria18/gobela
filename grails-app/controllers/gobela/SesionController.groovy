package gobela

import java.time.LocalTime

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class SesionController {

    SesionService sesionService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        def recintosConSesion = Sesion.executeQuery("select distinct s.recinto from Sesion s order by s.instalacion.recinto")
        def recintosList = []
        recintosConSesion.each {
            def instalaciones = Sesion.executeQuery("select distinct s.instalacion from Sesion s where s.instalacion.recinto = :recinto order by s.instalacion", [recinto: it])
            recintosList.add(instalaciones)
        }

        def sesionesList = []
        [recintosList: recintosList, sesionesList: sesionesList]
    }

    def filtraSesiones(params){
        DiaSemana dia = params.diaSemana as DiaSemana
        Instalacion instalacion = Instalacion.get(params.instalacionId as Long)
//        def sesionesList = Sesion.executeQuery("from HistoricoSesiones hs right join hs.sesion s where s.diaSemana = :dia and s.instalacion = :instalacion", [dia: dia, instalacion: instalacion])
        def sesionesList = sesionService.filtraSesiones(dia, instalacion)

        render template: "listaSesiones", model: [sesionesList: sesionesList, dia: dia.toString(), instalacion: instalacion]
    }

    def show(Sesion sesion) {
        respond sesion
    }

    def create() {
        Categoria categoria = Categoria.get(params.categoria as Long)
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
            respond sesion.errors, view:'create'
            return
        }

        sesion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sesion.label', default: 'Sesion'), sesion.id])
                redirect sesion
            }
            '*' { respond sesion, [status: CREATED] }
        }
    }

    def edit(Sesion sesion) {

       /* horaInicio = LocalTime.of(sesion.horaInicio.split(':')[0] as Integer, sesion.horaInicio.split(':')[1] as Integer)
        LocalTime horaFin = LocalTime.of(sesion.horaFin.split(':')[0] as Integer, sesion.horaFin.split(':')[1] as Integer)
        sesion.horaInicio = horaInicio as Date
        sesion.horaFin = horaFin as Date*/

        respond sesion
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
            respond sesion.errors, view:'edit'
            return
        }

        sesion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'sesion.label', default: 'Sesion'), sesion.id])
                redirect sesion
            }
            '*'{ respond sesion, [status: OK] }
        }
    }

    @Transactional
    def delete(Sesion sesion) {

        if (sesion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        sesion.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'sesion.label', default: 'Sesion'), sesion.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sesion.label', default: 'Sesion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
