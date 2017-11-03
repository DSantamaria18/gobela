package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class ZonaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Zona.list(params), model:[zonaCount: Zona.count()]
    }

    def show(Zona zona) {
        respond zona
    }

    def create() {
        respond new Zona(params)
    }

    @Transactional
    def save(Zona zona) {
        if (zona == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (zona.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond zona.errors, view:'create'
            return
        }

        zona.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'zona.label', default: 'Zona'), zona.id])
                redirect zona
            }
            '*' { respond zona, [status: CREATED] }
        }
    }

    def edit(Zona zona) {
        respond zona
    }

    @Transactional
    def update(Zona zona) {
        if (zona == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (zona.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond zona.errors, view:'edit'
            return
        }

        zona.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'zona.label', default: 'Zona'), zona.id])
                redirect zona
            }
            '*'{ respond zona, [status: OK] }
        }
    }

    @Transactional
    def delete(Zona zona) {

        if (zona == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        zona.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'zona.label', default: 'Zona'), zona.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'zona.label', default: 'Zona'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
