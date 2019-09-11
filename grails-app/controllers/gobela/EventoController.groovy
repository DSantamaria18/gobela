package gobela

import evento.EventoService
import grails.gorm.PagedResultList
import groovy.sql.GroovyRowResult
import jxl.Workbook
import jxl.WorkbookSettings
import jxl.write.Border
import jxl.write.BorderLineStyle
import jxl.write.Colour
import jxl.write.DateTime
import jxl.write.Label
import jxl.write.Number
import jxl.write.WritableCellFormat
import jxl.write.WritableFont
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook
import org.codehaus.groovy.runtime.NullObject

import java.sql.Timestamp
import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.util.Holders
import grails.transaction.Transactional


@Transactional(readOnly = false)
class EventoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static final String UPLOAD_FOLDER = Holders.getGrailsApplication().config.uploadFolder + "/eventos"
    EventoService eventoService

    def index(Integer max) {
        params.max = Math.min(max ?: 30, 100)
        def eventoList = Evento.findAllByEstadoNotInList(['Finalizado', 'Cancelado', 'Rechazado'])
        respond eventoList, model: [eventoCount: eventoList.size()]
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

        ArrayList<Map> postEventDocsList = []
        def f3 = new File("${UPLOAD_FOLDER}/${eventoId}/postEvento/")
        if (f3.exists()) {
            f3.eachFile() { file ->
                if (!file.isDirectory()) {
                    Map fileInfo = [:]
                    fileInfo.nombre = file.name
                    fileInfo.tamaño = file.size()
                    postEventDocsList.add(fileInfo)
                }
            }
        }
        postEventDocsList.sort { a, b -> b.value <=> a.value }

        [infoDocsList: infoDocsList, infoDocsCount: infoDocsList.size(), permDocsList: permDocsList, permDocsCount: permDocsList.size(), postEventDocsList: postEventDocsList, postEventDocsCount: postEventDocsList.size()]
    }

    def deleteFile() {
        def filename = params.fileId.replace('###', '.')
        def eventoId = params.eventoId
        String tipo = params.tipo
        String ruta = "${UPLOAD_FOLDER}/${eventoId}/${tipo}/"
        def file = new File(ruta + File.separatorChar + filename)
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
        if (!folder.exists()) {
            folder.mkdirs()
        }
        if (!f.empty) {
            flash.message = "Se ha subido ${f.getOriginalFilename()}"
            f.transferTo(new File(ruta + File.separatorChar + f.getOriginalFilename()))
        } else {
            flash.message = 'Debes seleccionar un fichero'
        }
        redirect(action: 'listFiles', params: [eventoId: eventoId])
    }

    def uploadPermFile() {
        def eventoId = params.eventoId
        def f = request.getFile('permFileUpload')
        String ruta = "${UPLOAD_FOLDER}/${eventoId}/permisos/"
        File folder = new File(ruta)
        if (!folder.exists()) {
            folder.mkdirs()
        }
        if (!f.empty) {
            flash.message = "Se ha subido ${f.getOriginalFilename()}"
            f.transferTo(new File(ruta + File.separatorChar + f.getOriginalFilename()))
        } else {
            flash.message = 'Debes seleccionar un fichero'
        }
        redirect(action: 'listFiles', params: [eventoId: eventoId])
    }

    def uploadPostEventFile() {
        def eventoId = params.eventoId
        def f = request.getFile('postEventFileUpload')
        String ruta = "${UPLOAD_FOLDER}/${eventoId}/postEvento/"
        File folder = new File(ruta)
        if (!folder.exists()) {
            folder.mkdirs()
        }
        if (!f.empty) {
            flash.message = "Se ha subido ${f.getOriginalFilename()}"
            f.transferTo(new File(ruta + File.separatorChar + f.getOriginalFilename()))
        } else {
            flash.message = 'Debes seleccionar un fichero'
        }
        redirect(action: 'listFiles', params: [eventoId: eventoId])
    }

    def getLugarByZona(params) {
        def zonaId = params.id
        Zona zona = Zona.get(zonaId)
        def listaLugares = Lugar.findAllByZona(zona)
        render template: "lugar", model: [listaLugares: listaLugares]
    }

    def getInstalacionByRecinto(params) {
        def recintoId = params.id
        Recinto recinto = Recinto.get(recintoId)
        def listaInstalaciones = Instalacion.findAllByRecinto(recinto)
        final String comboTemplate = (request.getHeader("referer").contains("/sesion/create?")) ? "/sesion/instalacion" : "/sesion/comboInstalacionesEdit"
        render template: comboTemplate, model: [listaInstalaciones: listaInstalaciones]
    }

    def getContactoByEntidad(params) {
        Boolean activos = (params.activos != "undefined") ?: null
        def entidadId = params.id
        Entidad entidad = Entidad.get(entidadId)

//        def listaContactos = Contacto.findAllByEntidad(entidad)
        def listaContactos = (activos) ? Contacto.findAllByEntidadAndActivo(entidad, activos) : Contacto.findAllByEntidad(entidad)
        render template: "contacto", model: [listaContactos: listaContactos]
    }

    def getContactoInfo(params) {
        Contacto contacto = Contacto.get(params.id)
        render template: "contactoInfo", model: [emailContacto: contacto.email, telefonoContacto: contacto.telefono]
    }

    def filtrarEventos(params) {
        def eventoList = eventoService.filtrarEventos(params)
        render template: "tablaEventos", model: [eventoList: eventoList, eventoCount: eventoList.size()]
    }

    def exportEventosFiltrados(params) {
        String fDesde = params.fechaDesde_year + "-" + params.fechaDesde_month + "-" + params.fechaDesde_day
        String fHasta = params.fechaHasta_year + "-" + params.fechaHasta_month + "-" + params.fechaHasta_day
        String fechaDesde = fDesde.split('-').reverse().join('-')
        String fechaHasta = fHasta.split('-').reverse().join('-')

        params.fechaDesde = fDesde
        params.fechaHasta = fHasta

        if (params.multikirola) {
            if (params.multikirola == "SI") params.multikirola = true else params.multikirola = false
        }

        if (params.deporteAdaptado) {
            if (params.deporteAdaptado == "SI") params.deporteAdaptado = true else params.deporteAdaptado = false
        }

        if (params.inclusivo) {
            if (params.inclusivo == "SI") params.inclusivo = true else params.inclusivo = false
        }

        if (params.relevante) {
            if (params.relevante == "SI") params.relevante = true else params.relevante = false
        }

        if (params.solidario) {
            if (params.solidario == "SI") params.solidario = true else params.solidario = false
        }

        def eventosList = eventoService.filtrarEventosFullInfo(params)

        if (eventosList.size() > 0) {
            WritableWorkbook workbook = ExcelUtils.createWorkbook(response, "Eventos")
            WritableCellFormat titleFormat = ExcelUtils.defaultTitleFormat()
            WritableCellFormat headerFormat = ExcelUtils.defaultHeaderFormat()
            WritableCellFormat cellFormat = ExcelUtils.defaultCellFormat()

            String nombreHoja = "Eventos"
            WritableSheet sheet = workbook.createSheet(nombreHoja, 0)

            sheet.addCell(new Label(0, 0, "Eventos", titleFormat))

            int columna = 0
            int fila = 3

            try {

                def cabeceras = eventosList[0].keySet()
                cabeceras.each {
                    sheet.addCell(new Label(columna, fila, it, headerFormat))
                    columna++
                }
                fila++
                columna = 0
                eventosList.each {
                    def datosEvento = it.values()
                    datosEvento.each {
//                    println("FILA: ${it} - ${it.getClass()}")
                        if (it?.getClass() == String) {
                            sheet.addCell(new Label(columna, fila, it.toUpperCase(), cellFormat))
                        } else {
                            if (it?.getClass() == Boolean) {
                                if (it == true) {
                                    sheet.addCell(new Label(columna, fila, "SI", cellFormat))
                                } else {
                                    sheet.addCell(new Label(columna, fila, "NO", cellFormat))
                                }
                            } else {
                                if (it?.getClass() == Timestamp) {
                                    String fecha = new SimpleDateFormat("dd/MM/yyyy").format(it)
                                    sheet.addCell(new Label(columna, fila, fecha, cellFormat))
                                } else {
                                    if (it.getClass() == NullObject) {
                                        sheet.addCell(new Label(columna, fila, "", cellFormat))
                                    } else {
                                        if (it == 0) {
                                            sheet.addCell(new Label(columna, fila, it.toString(), cellFormat))
                                        } else {
                                            if (it) sheet.addCell(new Number(columna, fila, it as int, cellFormat))
                                        }
                                    }
                                }
                            }
                        }
                        columna++
                    }
                    fila++
                    columna = 0
                }
                fila = fila + 2

                for (int c = 0; c < 40; c++) {
                    sheet.setColumnView(c, 25)
                }

            } catch (Exception e) {
                e.printStackTrace()
            }

            workbook.write()
            workbook.close()
        } else {
            flash.message = "Error al exportar. El filtro seleccionado no devolvió ningún resultado"
            redirect(uri: "/evento/index")
        }
    }

}