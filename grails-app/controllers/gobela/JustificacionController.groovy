package gobela

import grails.util.Holders

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class JustificacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static final String UPLOAD_FOLDER = Holders.getGrailsApplication().config.uploadFolder + "/subvenciones/justificaciones/"

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Justificacion.list(params), model:[justificacionCount: Justificacion.count()]
    }

    def show(Justificacion justificacion) {
        respond justificacion
    }

    def create() {
        respond new Justificacion(params)
    }

    @Transactional
    def save(Justificacion justificacion) {
        if (justificacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (justificacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond justificacion.errors, view:'create'
            return
        }

        justificacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'justificacion.label', default: 'Justificacion'), justificacion.id])
                redirect justificacion
            }
            '*' { respond justificacion, [status: CREATED] }
        }
    }

    def edit(Justificacion justificacion) {
        respond justificacion
    }

    @Transactional
    def update(Justificacion justificacion) {
        if (justificacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (justificacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond justificacion.errors, view:'edit'
            return
        }

        justificacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'justificacion.label', default: 'Justificacion'), justificacion.id])
                redirect justificacion
            }
            '*'{ respond justificacion, [status: OK] }
        }
    }

    @Transactional
    def delete(Justificacion justificacion) {

        if (justificacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        justificacion.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'justificacion.label', default: 'Justificacion'), justificacion.id])
                redirect(uri:'/')
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'justificacion.label', default: 'Justificacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def listFiles() {
        def justificacionId = params.justificacionId
        ArrayList<Map> justificacionesDocsList = []
        def f = new File("${UPLOAD_FOLDER}/${justificacionId}/")
        if (f.exists()) {
            f.eachFile() { file ->
                if (!file.isDirectory()) {
                    Map fileInfo = [:]
                    fileInfo.nombre = file.name
                    fileInfo.tamaño = file.size()
                    justificacionesDocsList.add(fileInfo)
                }
            }
        }
        justificacionesDocsList.sort { a, b -> b.value <=> a.value }
        [justificacionesDocsList: justificacionesDocsList, justificacionesDocsCount: justificacionesDocsList.size()]
    }

    def deleteFile() {
        def filename = params.fileId.replace('###', '.')
        def justificacionId = params.justificacionId
//        String tipo = params.tipo
        String ruta = "${UPLOAD_FOLDER}/${justificacionId}/"
        def file = new File( ruta + File.separatorChar + filename)
        file.delete()
        flash.message = "El fichero ${filename} ha sido borrado"
        redirect(action: 'listFiles', params: [justificacionId: justificacionId])
    }

    def downloadFile() {
        def filename = params.fileId.replace('###', '.')
        def justificacionId = params.justificacionId
//        String tipo = params.tipo
        String ruta = "${UPLOAD_FOLDER}/${justificacionId}/"
        def file = new File(ruta + File.separatorChar + filename)

        response.setContentType("APPLICATION/OCTET-STREAM")
        response.setHeader("Content-Disposition", "Attachment;Filename=\"${filename}\"")
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

    def uploadJustificacionFile() {
        def justificacionId = params.justificacionId
        def f = request.getFile('justificacionFileUpload')
        String ruta = "${UPLOAD_FOLDER}/${justificacionId}/"
        File folder = new File(ruta)
        if(!folder.exists()){
            folder.mkdirs()
        }
        if (!f.empty) {
            flash.message = "Se ha subido ${f.getOriginalFilename()}"
            f.transferTo(new File( ruta + File.separatorChar + f.getOriginalFilename()))
        } else {
            flash.message = 'Debes seleccionar un fichero'
        }
        redirect(action: 'listFiles', params: [justificacionId: justificacionId])
    }
}
