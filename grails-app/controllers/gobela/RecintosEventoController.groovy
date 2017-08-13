package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RecintosEventoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RecintosEvento.list(params), model:[recintosEventoCount: RecintosEvento.count()]
    }

    def show(RecintosEvento recintosEvento) {
        respond recintosEvento
    }

    def create() {
        respond new RecintosEvento(params)
    }

    @Transactional
    def save(RecintosEvento recintosEvento) {
        if (recintosEvento == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (recintosEvento.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond recintosEvento.errors, view:'create'
            return
        }

        recintosEvento.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'recintosEvento.label', default: 'RecintosEvento'), recintosEvento.id])
                redirect recintosEvento
            }
            '*' { respond recintosEvento, [status: CREATED] }
        }
    }

    def edit(RecintosEvento recintosEvento) {
        respond recintosEvento
    }

    @Transactional
    def update(RecintosEvento recintosEvento) {
        if (recintosEvento == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (recintosEvento.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond recintosEvento.errors, view:'edit'
            return
        }

        recintosEvento.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'recintosEvento.label', default: 'RecintosEvento'), recintosEvento.id])
                redirect recintosEvento
            }
            '*'{ respond recintosEvento, [status: OK] }
        }
    }

    @Transactional
    def delete(RecintosEvento recintosEvento) {

        if (recintosEvento == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        recintosEvento.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'recintosEvento.label', default: 'RecintosEvento'), recintosEvento.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'recintosEvento.label', default: 'RecintosEvento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
