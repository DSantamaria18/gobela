package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class EventoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 30, 100)
        respond Evento.list(params), model: [eventoCount: Evento.count()]
    }

    def show(Evento evento) {
        respond evento
    }

    def create() {
        respond new Evento(params)
    }

    def clone() {
        respond new Evento(params)
    }

    @Transactional
    def save(Evento evento) {
        if (evento == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (evento.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond evento.errors, view: 'create'
            return
        }

        evento.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'evento.label', default: 'Evento'), evento.id])
                redirect evento
            }
            '*' { respond evento, [status: CREATED] }
        }
    }

    def edit(Evento evento) {
        respond evento
    }

    @Transactional
    def update(Evento evento) {
        if (evento == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (evento.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond evento.errors, view: 'edit'
            return
        }

        evento.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'evento.label', default: 'Evento'), evento.id])
                redirect evento
            }
            '*' { respond evento, [status: OK] }
        }
    }

    @Transactional
    def delete(Evento evento) {

        if (evento == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        evento.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'evento.label', default: 'Evento'), evento.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'evento.label', default: 'Evento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def listFiles() {
        ArrayList<Map> infoDocsList = []
        def f = new File("C:/temp/upload/")
        if (f.exists()) {
            f.eachFile() { file ->
                if (!file.isDirectory()) {
                    Map fileInfo = [:]
                    fileInfo.nombre = file.name
                    fileInfo.tamaño = file.size()
                    infoDocsList.add(fileInfo)
                }
            }
        }
//        infoDocsList.sort{ it.values()}
        infoDocsList.sort { a, b -> b.value <=> a.value }
        [infoDocsList: infoDocsList, infoDocsCount: infoDocsList.size()]
    }

    def deleteFile() {
        def filename = params.id.replace('###', '.')
        def file = new File(grailsApplication.config.images.location.toString() + File.separatorChar + filename)
        file.delete()
        flash.message = "file ${filename} removed"
        redirect(action: list)
    }

    def uploadFile() {
        def f = request.getFile('fileUpload')
        if (!f.empty) {
            flash.message = 'Your file has been uploaded'
            new File(grailsApplication.config.images.location.toString()).mkdirs()
            f.transferTo(new File(grailsApplication.config.images.location.toString() + File.separatorChar + f.getOriginalFilename()))
        } else {
            flash.message = 'file cannot be empty'
        }
        redirect(action: list)
    }
}
