package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class JustificacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Justificacion.list(params), model:[justificacionCount: Justificacion.count()]
    }

    def show(Justificacion justificacion) {
        respond justificacion
    }

    def create() {
        respond new Justificacion(params)
    }

    @Transactional
    def save(Justificacion justificacion) {
        if (justificacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (justificacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond justificacion.errors, view:'create'
            return
        }

        justificacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'justificacion.label', default: 'Justificacion'), justificacion.id])
                redirect justificacion
            }
            '*' { respond justificacion, [status: CREATED] }
        }
    }

    def edit(Justificacion justificacion) {
        respond justificacion
    }

    @Transactional
    def update(Justificacion justificacion) {
        if (justificacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (justificacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond justificacion.errors, view:'edit'
            return
        }

        justificacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'justificacion.label', default: 'Justificacion'), justificacion.id])
                redirect justificacion
            }
            '*'{ respond justificacion, [status: OK] }
        }
    }

    @Transactional
    def delete(Justificacion justificacion) {

        if (justificacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        justificacion.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'justificacion.label', default: 'Justificacion'), justificacion.id])
                redirect(uri:'/')
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'justificacion.label', default: 'Justificacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
