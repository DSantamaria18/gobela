package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class IncidenciaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Incidencia.list(params), model:[incidenciaCount: Incidencia.count()]
    }

    def show(Incidencia incidencia) {
        respond incidencia
    }

    def create() {
        respond new Incidencia(params)
    }

    @Transactional
    def save(Incidencia incidencia) {
        if (incidencia == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (incidencia.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond incidencia.errors, view:'create'
            return
        }

        incidencia.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), incidencia.id])
                redirect incidencia
            }
            '*' { respond incidencia, [status: CREATED] }
        }
    }

    def edit(Incidencia incidencia) {
        respond incidencia
    }

    @Transactional
    def update(Incidencia incidencia) {
        if (incidencia == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (incidencia.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond incidencia.errors, view:'edit'
            return
        }

        incidencia.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), incidencia.id])
                redirect incidencia
            }
            '*'{ respond incidencia, [status: OK] }
        }
    }

    @Transactional
    def delete(Incidencia incidencia) {

        if (incidencia == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        incidencia.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), incidencia.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
