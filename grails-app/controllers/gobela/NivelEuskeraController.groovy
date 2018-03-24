package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class NivelEuskeraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NivelEuskera.list(params), model:[nivelEuskeraCount: NivelEuskera.count()]
    }

    def show(NivelEuskera nivelEuskera) {
        respond nivelEuskera
    }

    def create() {
        respond new NivelEuskera(params)
    }

    @Transactional
    def save(NivelEuskera nivelEuskera) {
        if (nivelEuskera == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (nivelEuskera.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond nivelEuskera.errors, view:'create'
            return
        }

        nivelEuskera.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'nivelEuskera.label', default: 'NivelEuskera'), nivelEuskera.id])
                redirect nivelEuskera
            }
            '*' { respond nivelEuskera, [status: CREATED] }
        }
    }

    def edit(NivelEuskera nivelEuskera) {
        respond nivelEuskera
    }

    @Transactional
    def update(NivelEuskera nivelEuskera) {
        if (nivelEuskera == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (nivelEuskera.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond nivelEuskera.errors, view:'edit'
            return
        }

        nivelEuskera.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'nivelEuskera.label', default: 'NivelEuskera'), nivelEuskera.id])
                redirect nivelEuskera
            }
            '*'{ respond nivelEuskera, [status: OK] }
        }
    }

    @Transactional
    def delete(NivelEuskera nivelEuskera) {

        if (nivelEuskera == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        nivelEuskera.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'nivelEuskera.label', default: 'NivelEuskera'), nivelEuskera.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'nivelEuskera.label', default: 'NivelEuskera'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
