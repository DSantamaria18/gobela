package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class RecintoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Recinto.list(params), model:[recintoCount: Recinto.count()]
    }

    def show(Recinto recinto) {
        respond recinto
    }

    def create() {
        respond new Recinto(params)
    }

    @Transactional
    def save(Recinto recinto) {
        if (recinto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (recinto.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond recinto.errors, view:'create'
            return
        }

        recinto.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'recinto.label', default: 'Recinto'), recinto.id])
                redirect recinto
            }
            '*' { respond recinto, [status: CREATED] }
        }
    }

    def edit(Recinto recinto) {
        respond recinto
    }

    @Transactional
    def update(Recinto recinto) {
        if (recinto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (recinto.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond recinto.errors, view:'edit'
            return
        }

        recinto.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'recinto.label', default: 'Recinto'), recinto.id])
                redirect recinto
            }
            '*'{ respond recinto, [status: OK] }
        }
    }

    @Transactional
    def delete(Recinto recinto) {

        if (recinto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        recinto.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'recinto.label', default: 'Recinto'), recinto.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'recinto.label', default: 'Recinto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
