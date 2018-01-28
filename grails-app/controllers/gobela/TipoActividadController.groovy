package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class TipoActividadController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoActividad.list(params), model:[tipoActividadCount: TipoActividad.count()]
    }

    def show(TipoActividad tipoActividad) {
        respond tipoActividad
    }

    def create() {
        respond new TipoActividad(params)
    }

    @Transactional
    def save(TipoActividad tipoActividad) {
        if (tipoActividad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoActividad.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoActividad.errors, view:'create'
            return
        }

        tipoActividad.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoActividad.label', default: 'TipoActividad'), tipoActividad.id])
                redirect tipoActividad
            }
            '*' { respond tipoActividad, [status: CREATED] }
        }
    }

    def edit(TipoActividad tipoActividad) {
        respond tipoActividad
    }

    @Transactional
    def update(TipoActividad tipoActividad) {
        if (tipoActividad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoActividad.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoActividad.errors, view:'edit'
            return
        }

        tipoActividad.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoActividad.label', default: 'TipoActividad'), tipoActividad.id])
                redirect tipoActividad
            }
            '*'{ respond tipoActividad, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoActividad tipoActividad) {

        if (tipoActividad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        tipoActividad.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoActividad.label', default: 'TipoActividad'), tipoActividad.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoActividad.label', default: 'TipoActividad'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
