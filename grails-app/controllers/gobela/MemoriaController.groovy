package gobela

import grails.util.Holders

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class MemoriaController {
    def PdfBoxService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static final String UPLOAD_FOLDER = Holders.getGrailsApplication().config.uploadFolder + "/subvenciones/balances"

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Memoria.list(params), model: [memoriaCount: Memoria.count()]
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
            respond memoria.errors, view: 'create'
            return
        }

        memoria.save flush: true

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
            respond memoria.errors, view: 'edit'
            return
        }

        memoria.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'memoria.label', default: 'Memoria'), memoria.id])
                redirect memoria
            }
            '*' { respond memoria, [status: OK] }
        }
    }

    @Transactional
    def delete(Memoria memoria) {

        if (memoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        memoria.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'memoria.label', default: 'Memoria'), memoria.id])
                redirect(uri: '/')
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'memoria.label', default: 'Memoria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def imprimirMemoria() {
        final def memoriaId = params.memoriaId
        Memoria memoria = Memoria.get(memoriaId)
        PdfBoxService.printMemoria(memoria, UPLOAD_FOLDER)

        String ruta = "${UPLOAD_FOLDER}/${memoriaId}/"
        final String fileName = "${memoriaId}_Memoria_Deportiva.pdf"
        def file = new File(ruta + File.separatorChar + fileName)

        response.setContentType("APPLICATION/OCTET-STREAM")
        response.setHeader("Content-Disposition", "Attachment;Filename=\"${fileName}\"")
        def fileInputStream = new FileInputStream(file)

        def outputStream = response.getOutputStream()
        byte[] buffer = new byte[4096]
        int len
        while ((len = fileInputStream.read(buffer)) > 0) {
            outputStream.write(buffer, 0, len)
        }
        outputStream.flush()
        outputStream.close()
        fileInputStream.close()
    }
}
