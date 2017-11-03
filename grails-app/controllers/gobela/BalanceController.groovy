package gobela

import grails.util.Holders

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class BalanceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static final String UPLOAD_FOLDER = Holders.getGrailsApplication().config.uploadFolder + "/subvenciones/balances"

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Balance.list(params), model:[balanceCount: Balance.count()]
    }

    def show(Balance balance) {
        respond balance
    }

    def create() {
        respond new Balance(params)
    }

    @Transactional
    def save(Balance balance) {
        if (balance == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (balance.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond balance.errors, view:'create'
            return
        }

        balance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'balance.label', default: 'Balance'), balance.id])
                redirect balance
            }
            '*' { respond balance, [status: CREATED] }
        }
    }

    def edit(Balance balance) {
        respond balance
    }

    @Transactional
    def update(Balance balance) {
        if (balance == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (balance.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond balance.errors, view:'edit'
            return
        }

        balance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'balance.label', default: 'Balance'), balance.id])
                redirect balance
            }
            '*'{ respond balance, [status: OK] }
        }
    }

    @Transactional
    def delete(Balance balance) {

        if (balance == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        balance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'balance.label', default: 'Balance'), balance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'balance.label', default: 'Balance'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def listFiles() {
        def balanceId = params.balanceId
        ArrayList<Map> balanceDocsList = []
        def f = new File("${UPLOAD_FOLDER}/${balanceId}/")
        if (f.exists()) {
            f.eachFile() { file ->
                if (!file.isDirectory()) {
                    Map fileInfo = [:]
                    fileInfo.nombre = file.name
                    fileInfo.tamaño = file.size()
                    balanceDocsList.add(fileInfo)
                }
            }
        }
        balanceDocsList.sort { a, b -> b.value <=> a.value }
        [balanceDocsList: balanceDocsList, infoDocsCount: balanceDocsList.size()]
    }

    def deleteFile() {
        def filename = params.fileId.replace('###', '.')
        def balanceId = params.balanceId
//        String tipo = params.tipo
        String ruta = "${UPLOAD_FOLDER}/${balanceId}/"
        def file = new File( ruta + File.separatorChar + filename)
        file.delete()
        flash.message = "El fichero ${filename} ha sido borrado"
        redirect(action: 'listFiles', params: [balanceId: balanceId])
    }

    def downloadFile() {
        def filename = params.fileId.replace('###', '.')
        def balanceId = params.balanceId
//        String tipo = params.tipo
        String ruta = "${UPLOAD_FOLDER}/${balanceId}/"
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

    def uploadBalanceFile() {
        def balanceId = params.balanceId
        def f = request.getFile('balanceFileUpload')
        String ruta = "${UPLOAD_FOLDER}/${balanceId}/"
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
        redirect(action: 'listFiles', params: [balanceId: balanceId])
    }
}
