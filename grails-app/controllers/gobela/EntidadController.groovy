package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EntidadController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Entidad.list(params), model:[entidadCount: Entidad.count()]
    }

    def show(Entidad entidad) {
        respond entidad
    }

    def create() {
        respond new Entidad(params)
    }

    @Transactional
    def save(Entidad entidad) {
        if (entidad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (entidad.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond entidad.errors, view:'create'
            return
        }

        entidad.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'entidad.label', default: 'Entidad'), entidad.id])
                redirect entidad
            }
            '*' { respond entidad, [status: CREATED] }
        }
    }

    def edit(Entidad entidad) {
        respond entidad
    }

    @Transactional
    def update(Entidad entidad) {
        if (entidad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (entidad.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond entidad.errors, view:'edit'
            return
        }

        entidad.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'entidad.label', default: 'Entidad'), entidad.id])
                redirect entidad
            }
            '*'{ respond entidad, [status: OK] }
        }
    }

    @Transactional
    def delete(Entidad entidad) {

        if (entidad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        entidad.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'entidad.label', default: 'Entidad'), entidad.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidad.label', default: 'Entidad'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
