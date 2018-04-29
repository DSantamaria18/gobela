package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class TecnicoCategoriaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TecnicoCategoria.list(params), model:[tecnicoCategoriaCount: TecnicoCategoria.count()]
    }

    def show(TecnicoCategoria tecnicoCategoria) {
        respond tecnicoCategoria
    }

    def create() {
        Categoria categoria = Categoria.get(params.categoriaId as Long)
        respond new TecnicoCategoria(params), model: ['categoria': categoria]
    }

    @Transactional
    def save(TecnicoCategoria tecnicoCategoria) {
        if (tecnicoCategoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tecnicoCategoria.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tecnicoCategoria.errors, view:'create'
            return
        }

        tecnicoCategoria.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tecnicoCategoria.label', default: 'TecnicoCategoria'), tecnicoCategoria.id])
                redirect tecnicoCategoria
            }
            '*' { respond tecnicoCategoria, [status: CREATED] }
        }
    }

    def edit(TecnicoCategoria tecnicoCategoria) {
        respond tecnicoCategoria
    }

    @Transactional
    def update(TecnicoCategoria tecnicoCategoria) {
        if (tecnicoCategoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tecnicoCategoria.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tecnicoCategoria.errors, view:'edit'
            return
        }

        tecnicoCategoria.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tecnicoCategoria.label', default: 'TecnicoCategoria'), tecnicoCategoria.id])
                redirect tecnicoCategoria
            }
            '*'{ respond tecnicoCategoria, [status: OK] }
        }
    }

    @Transactional
    def delete(TecnicoCategoria tecnicoCategoria) {

        if (tecnicoCategoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        tecnicoCategoria.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tecnicoCategoria.label', default: 'TecnicoCategoria'), tecnicoCategoria.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tecnicoCategoria.label', default: 'TecnicoCategoria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
