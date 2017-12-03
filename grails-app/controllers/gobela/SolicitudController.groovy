package gobela

import grails.core.GrailsApplication
import grails.gorm.PagedResultList
import jxl.Workbook
import jxl.write.*
import jxl.WorkbookSettings
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
//import com.adobe.fdf

@Transactional(readOnly = false)
class SolicitudController {
    def exportService
    GrailsApplication grailsApplication
    def SolicitudesService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Solicitud.list(params), model:[solicitudCount: Solicitud.count()]
    }

    def show(Solicitud solicitud) {
        respond solicitud
    }

    def create() {
        respond new Solicitud(params)
    }

    @Transactional
    def save(Solicitud solicitud) {
        if (solicitud == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (solicitud.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond solicitud.errors, view:'create'
            return
        }

        solicitud.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'solicitud.label', default: 'Solicitud'), solicitud.id])
                redirect solicitud
            }
            '*' { respond solicitud, [status: CREATED] }
        }
    }

    def edit(Solicitud solicitud) {
        respond solicitud
    }

    @Transactional
    def update(Solicitud solicitud) {
        if (solicitud == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (solicitud.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond solicitud.errors, view:'edit'
            return
        }

        solicitud.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'solicitud.label', default: 'Solicitud'), solicitud.id])
                redirect solicitud
            }
            '*'{ respond solicitud, [status: OK] }
        }
    }

    @Transactional
    def delete(Solicitud solicitud) {

        if (solicitud == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        solicitud.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'solicitud.label', default: 'Solicitud'), solicitud.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitud.label', default: 'Solicitud'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def estadisticas() {
        if (!params.max) params.max = 10
        if (params?.format && params.format != "html") {
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment;filename = solicitudInstance.${params.extension}")
            exportService.export(params.format, response.outputStream, Solicitud.list(params), [:], [:])
        }
        [solicitudInstanceList: Solicitud.list(params)]
    }

    def filtrar(params) {
        println("   :: Filtrando")
        String query = "SELECT * FROM solicitud, balance, memoria, valoracion WHERE solicitud.id = balance.solicitud "
        if (params.codigoSolicitante) query = query + "AND codigo = ${params.codigoSolicitante} "
        if (params.nombreSolicitante) query = query + "AND nombre = ${params.nombreSolicitante} "
        if (params.municipioSolicitante) query = query + "AND municipio = ${params.municipioSolicitante} "

        println("   :: ${query}")
        println()
    }

    def exportarSolicitud() {
        Solicitud solicitud = Solicitud.get(params.id)
        response.setContentType('application/vnd.ms-excel')
        response.setHeader('Content-Disposition', "Attachment;Filename='solicitud_${solicitud.codigo}.xls'")
        WorkbookSettings ws = new WorkbookSettings()
        ws.setLocale(new Locale("es", "ES"))
        WritableWorkbook workbook = Workbook.createWorkbook(response.outputStream, ws)

        try {
            WritableSheet sheet = workbook.createSheet("SOLICITUD", 0)

            WritableFont titleFont = new WritableFont(WritableFont.ARIAL, 16, WritableFont.BOLD)
            WritableCellFormat titleFormat = new WritableCellFormat()
            titleFormat.setFont(titleFont)
            Label title = new Label(0, 0, "ANEXO 1. SOLICITUD DE SUBVENCION ${solicitud.codigo}", titleFormat)
            sheet.addCell(title)

            WritableFont headerFont = new WritableFont(WritableFont.ARIAL, 11, WritableFont.BOLD)
            WritableCellFormat headerFormat = new WritableCellFormat()
            headerFormat.with {
                setBackground(Colour.GREY_25_PERCENT)
                setBorder(Border.ALL, BorderLineStyle.THIN)
                setFont(headerFont)
                setAlignment(jxl.format.Alignment.RIGHT)
                setWrap(true)
            }

            WritableFont cellFont = new WritableFont(WritableFont.ARIAL, 10)
            WritableCellFormat cellFormat = new WritableCellFormat()
            cellFormat.with {
                setFont(cellFont)
                setBorder(Border.ALL, BorderLineStyle.THIN)
                setWrap(true)
            }

            int col = 0
            int row = 2

            solicitud.properties.each { key, value ->
                String msg = "solicitud.${key}.label"
                if (value && key!='valoracionId') {
                    Label campo = new Label(col, row, message(code: msg)+':', headerFormat)
                    Label valor = new Label(col + 1, row, value.toString(), cellFormat)
                    sheet.addCell(campo)
                    sheet.addCell(valor)
                    row++
                }
                sheet.setColumnView(col, 30)
                sheet.setColumnView(col+1, 30)
            }
        } catch (Exception e) {
            e.printStackTrace()
        }

        workbook.write()
        workbook.close()
    }

    def buscarSolicitud(params){
        PagedResultList<Solicitud> resultList = SolicitudesService.buscarSolicitudesPorNumeroOPorDescripcion(params).solicitudInstanceList
        [resultList: resultList, solicitudCount: resultList.size()]
    }
}
