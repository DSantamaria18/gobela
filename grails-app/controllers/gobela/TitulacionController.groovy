package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class TitulacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Titulacion.list(params), model:[titulacionCount: Titulacion.count()]
    }

    def show(Titulacion titulacion) {
        respond titulacion
    }

    def create() {
        respond new Titulacion(params)
    }

    @Transactional
    def save(Titulacion titulacion) {
        if (titulacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (titulacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond titulacion.errors, view:'create'
            return
        }

        titulacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'titulacion.label', default: 'Titulacion'), titulacion.id])
                redirect titulacion
            }
            '*' { respond titulacion, [status: CREATED] }
        }
    }

    def edit(Titulacion titulacion) {
        respond titulacion
    }

    @Transactional
    def update(Titulacion titulacion) {
        if (titulacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (titulacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond titulacion.errors, view:'edit'
            return
        }

        titulacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'titulacion.label', default: 'Titulacion'), titulacion.id])
                redirect titulacion
            }
            '*'{ respond titulacion, [status: OK] }
        }
    }

    @Transactional
    def delete(Titulacion titulacion) {

        if (titulacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        titulacion.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'titulacion.label', default: 'Titulacion'), titulacion.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'titulacion.label', default: 'Titulacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
