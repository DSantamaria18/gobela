package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class AsambleaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Asamblea.list(params), model:[asambleaCount: Asamblea.count()]
    }

    def show(Asamblea asamblea) {
        respond asamblea
    }

    def create() {
        Long clubId = params.clubId as Long
        Club club = Club.get(clubId)
        params.club = club
        respond new Asamblea(params)
    }

    @Transactional
    def save(Asamblea asamblea) {
        if (asamblea == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (asamblea.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond asamblea.errors, view:'create'
            return
        }

        asamblea.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'asamblea.label', default: 'Asamblea'), asamblea.id])
                redirect asamblea
            }
            '*' { respond asamblea, [status: CREATED] }
        }
    }

    def edit(Asamblea asamblea) {
        respond asamblea
    }

    @Transactional
    def update(Asamblea asamblea) {
        if (asamblea == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (asamblea.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond asamblea.errors, view:'edit'
            return
        }

        asamblea.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'asamblea.label', default: 'Asamblea'), asamblea.id])
                redirect asamblea
            }
            '*'{ respond asamblea, [status: OK] }
        }
    }

    @Transactional
    def delete(Asamblea asamblea) {

        if (asamblea == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        asamblea.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'asamblea.label', default: 'Asamblea'), asamblea.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'asamblea.label', default: 'Asamblea'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
