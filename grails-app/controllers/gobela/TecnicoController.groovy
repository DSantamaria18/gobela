package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class TecnicoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tecnico.list(params), model:[tecnicoCount: Tecnico.count()]
    }

    def show(Tecnico tecnico) {
        respond tecnico
    }

    def create() {
        respond new Tecnico(params)
    }

    @Transactional
    def save(Tecnico tecnico) {
        if (tecnico == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tecnico.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tecnico.errors, view:'create'
            return
        }

        tecnico.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tecnico.label', default: 'Tecnico'), tecnico.id])
                redirect tecnico
            }
            '*' { respond tecnico, [status: CREATED] }
        }
    }

    def edit(Tecnico tecnico) {
        respond tecnico
    }

    @Transactional
    def update(Tecnico tecnico) {
        if (tecnico == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tecnico.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tecnico.errors, view:'edit'
            return
        }

        tecnico.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tecnico.label', default: 'Tecnico'), tecnico.id])
                redirect tecnico
            }
            '*'{ respond tecnico, [status: OK] }
        }
    }

    @Transactional
    def delete(Tecnico tecnico) {

        if (tecnico == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        tecnico.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tecnico.label', default: 'Tecnico'), tecnico.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tecnico.label', default: 'Tecnico'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
