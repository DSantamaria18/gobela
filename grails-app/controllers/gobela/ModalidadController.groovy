package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class ModalidadController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Modalidad.list(params), model:[modalidadCount: Modalidad.count()]
    }

    def show(Modalidad modalidad) {
        respond modalidad
    }

    def create() {
        respond new Modalidad(params)
    }

    @Transactional
    def save(Modalidad modalidad) {
        if (modalidad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (modalidad.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond modalidad.errors, view:'create'
            return
        }

        modalidad.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'modalidad.label', default: 'Modalidad'), modalidad.id])
                redirect modalidad
            }
            '*' { respond modalidad, [status: CREATED] }
        }
    }

    def edit(Modalidad modalidad) {
        respond modalidad
    }

    @Transactional
    def update(Modalidad modalidad) {
        if (modalidad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (modalidad.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond modalidad.errors, view:'edit'
            return
        }

        modalidad.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'modalidad.label', default: 'Modalidad'), modalidad.id])
                redirect modalidad
            }
            '*'{ respond modalidad, [status: OK] }
        }
    }

    @Transactional
    def delete(Modalidad modalidad) {

        if (modalidad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        modalidad.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'modalidad.label', default: 'Modalidad'), modalidad.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidad.label', default: 'Modalidad'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
