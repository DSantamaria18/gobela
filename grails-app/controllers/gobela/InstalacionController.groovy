package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class InstalacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Instalacion.list(params), model:[instalacionCount: Instalacion.count()]
    }

    def show(Instalacion instalacion) {
        respond instalacion
    }

    def create() {
        respond new Instalacion(params)
    }

    @Transactional
    def save(Instalacion instalacion) {
        if (instalacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (instalacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond instalacion.errors, view:'create'
            return
        }

        instalacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'instalacion.label', default: 'Instalacion'), instalacion.id])
                redirect instalacion
            }
            '*' { respond instalacion, [status: CREATED] }
        }
    }

    def edit(Instalacion instalacion) {
        respond instalacion
    }

    @Transactional
    def update(Instalacion instalacion) {
        if (instalacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (instalacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond instalacion.errors, view:'edit'
            return
        }

        instalacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'instalacion.label', default: 'Instalacion'), instalacion.id])
                redirect instalacion
            }
            '*'{ respond instalacion, [status: OK] }
        }
    }

    @Transactional
    def delete(Instalacion instalacion) {

        if (instalacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        instalacion.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'instalacion.label', default: 'Instalacion'), instalacion.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'instalacion.label', default: 'Instalacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
