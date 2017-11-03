package gobela

import static org.springframework.http.HttpStatus.*
import grails.util.Holders
import grails.transaction.Transactional



@Transactional(readOnly = false)
class EventoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static final String UPLOAD_FOLDER = Holders.getGrailsApplication().config.uploadFolder + "/eventos"


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
        def eventoId = params.eventoId
        ArrayList<Map> infoDocsList = []
        def f = new File("${UPLOAD_FOLDER}/${eventoId}/info/")
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
        infoDocsList.sort { a, b -> b.value <=> a.value }

        ArrayList<Map> permDocsList = []
        def f2 = new File("${UPLOAD_FOLDER}/${eventoId}/permisos/")
        if (f2.exists()) {
            f2.eachFile() { file ->
                if (!file.isDirectory()) {
                    Map fileInfo = [:]
                    fileInfo.nombre = file.name
                    fileInfo.tamaño = file.size()
                    permDocsList.add(fileInfo)
                }
            }
        }
        permDocsList.sort { a, b -> b.value <=> a.value }
        [infoDocsList: infoDocsList, infoDocsCount: infoDocsList.size(), permDocsList: permDocsList, permDocsCount: permDocsList.size()]
    }

    def deleteFile() {
        def filename = params.fileId.replace('###', '.')
        def eventoId = params.eventoId
        String tipo = params.tipo
        String ruta = "${UPLOAD_FOLDER}/${eventoId}/${tipo}/"
        def file = new File( ruta + File.separatorChar + filename)
        file.delete()
        flash.message = "El fichero ${filename} ha sido borrado"
        redirect(action: 'listFiles', params: [eventoId: eventoId])
    }

    def downloadFile() {
        def filename = params.fileId.replace('###', '.')
        def eventoId = params.eventoId
        String tipo = params.tipo
        String ruta = "${UPLOAD_FOLDER}/${eventoId}/${tipo}/"
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

    def uploadInfoFile() {
        def eventoId = params.eventoId
        def f = request.getFile('infoFileUpload')
        String ruta = "${UPLOAD_FOLDER}/${eventoId}/info/"
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
        redirect(action: 'listFiles', params: [eventoId: eventoId])
    }

    def uploadPermFile() {
        def eventoId = params.eventoId
        def f = request.getFile('permFileUpload')
//        String tipo = params.tipo
        String ruta = "${UPLOAD_FOLDER}/${eventoId}/permisos/"
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
        redirect(action: 'listFiles', params: [eventoId: eventoId])
    }

    def getLugarByZona(params){
        def zonaId = params.id
        Zona zona = Zona.get(zonaId)
        def listaLugares = Lugar.findAllByZona(zona)
        render template: "lugar", model: [listaLugares: listaLugares]
    }
}
