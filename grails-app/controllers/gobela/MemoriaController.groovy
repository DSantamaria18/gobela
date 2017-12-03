package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class MemoriaController {
    def PdfBoxService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Memoria.list(params), model:[memoriaCount: Memoria.count()]
    }

    def show(Memoria memoria) {
        respond memoria
    }

    def create() {
        respond new Memoria(params)
    }

    @Transactional
    def save(Memoria memoria) {
        if (memoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (memoria.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond memoria.errors, view:'create'
            return
        }

        memoria.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'memoria.label', default: 'Memoria'), memoria.id])
                redirect memoria
            }
            '*' { respond memoria, [status: CREATED] }
        }
    }

    def edit(Memoria memoria) {
        respond memoria
    }

    @Transactional
    def update(Memoria memoria) {
        if (memoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (memoria.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond memoria.errors, view:'edit'
            return
        }

        memoria.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'memoria.label', default: 'Memoria'), memoria.id])
                redirect memoria
            }
            '*'{ respond memoria, [status: OK] }
        }
    }

    @Transactional
    def delete(Memoria memoria) {

        if (memoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        memoria.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'memoria.label', default: 'Memoria'), memoria.id])
                redirect(uri:'/')
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'memoria.label', default: 'Memoria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def imprimirMemoria(){
        def memoriaId = params.memoriaId
        Memoria memoria = Memoria.get(memoriaId)
        PdfBoxService.printMemoria(memoria)
        redirect action:"index", method:"GET"
    }
}
