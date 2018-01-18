package gobela

import jxl.Workbook
import jxl.WorkbookSettings
import jxl.write.Border
import jxl.write.BorderLineStyle
import jxl.write.Colour
import jxl.write.Formula
import jxl.write.Label
import jxl.write.Number
import jxl.write.WritableCellFormat
import jxl.write.WritableFont
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook
import org.codehaus.groovy.runtime.NullObject

import java.sql.Timestamp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class SolicitudMaterialController {
    SolicitudesMaterialService solicitudesMaterialService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        String fechaDesde = new Date().toTimestamp().toString()
        String fechaHasta = new Date().copyWith(year: 2199).toTimestamp().toString()
        def solicitudesMaterialList = solicitudesMaterialService.filtrarSolicitudesMaterial(fechaDesde, fechaHasta, null, null)
        respond solicitudesMaterialList, model: [solicitudesMateriaCount: solicitudesMaterialList.size()]
    }

    def show(SolicitudMaterial solicitudMaterial) {
        respond solicitudMaterial
    }

    def create() {
        respond new SolicitudMaterial(params)
    }

    @Transactional
    def save(SolicitudMaterial solicitudMaterial) {

        if (solicitudMaterial == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (solicitudMaterial.hasErrors()) {
            transactionStatus.setRollbackOnly()
            render solicitudMaterial.errors
//            respond solicitudMaterial.errors, view: 'create'
            return
        }

        solicitudMaterial.save flush: true
        def newId = solicitudMaterial.id

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'solicitudMaterial.label', default: 'SolicitudMaterial'), solicitudMaterial.id])
//                redirect solicitudMaterial
            }
//            '*' { redirect(uri: request.getHeader('referer'),  status: CREATED) }
//            '*' { respond solicitudMaterial, status: CREATED }
        }
        render(template: 'formCreate', model: [eventId: solicitudMaterial.evento.id, oldFechaEntrega: solicitudMaterial.fechaEntrega, oldFechaDevolucion: solicitudMaterial.fechaDevolucion, oldLugarEntrega: solicitudMaterial.lugarEntrega, oldLugarDevolucion: solicitudMaterial.lugarDevolucion, newId: newId])
    }

    def edit(SolicitudMaterial solicitudMaterial) {
        respond solicitudMaterial
    }

    @Transactional
    def update(SolicitudMaterial solicitudMaterial) {
        if (solicitudMaterial == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (solicitudMaterial.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond solicitudMaterial.errors, view: 'edit'
            return
        }

        solicitudMaterial.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'solicitudMaterial.label', default: 'SolicitudMaterial'), solicitudMaterial.id])
                redirect solicitudMaterial
            }
            '*' { respond solicitudMaterial, [status: OK] }
        }
    }

    @Transactional
    def delete(SolicitudMaterial solicitudMaterial) {

        if (solicitudMaterial == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        solicitudMaterial.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'solicitudMaterial.label', default: 'SolicitudMaterial'), solicitudMaterial.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    @Transactional
    def deleteById(Long solicitudMaterialId) {

        SolicitudMaterial solicitudMaterial = SolicitudMaterial.get(solicitudMaterialId)

        if (solicitudMaterial == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        solicitudMaterial.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'solicitudMaterial.label', default: 'SolicitudMaterial'), solicitudMaterial.id])
//                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'solicitudMaterial.label', default: 'SolicitudMaterial'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def checkStock(params) {
        Material materialInstance = Material.get(params.id)
        //TODO: Crear método para obtener el stock disponible en la fecha del evento

        render template: "stock", model: [stock: materialInstance.stock]
    }

    def filtrarSolicitudesMaterial(params) {
        def solicitudesMaterialList = solicitudesMaterialService.filtrarSolicitudesMaterial(params.fechaDesde, params.fechaHasta, params.lugarEntrega, params.lugarDevolucion)
        render template: "tablaSolicitudesMaterial", model: [solicitudesMaterialList: solicitudesMaterialList]
    }

    def exportarListadoSolicitudesMaterial(params) {
        String fDesde = params.fechaDesde_year + "-" + params.fechaDesde_month + "-" + params.fechaDesde_day
        String fHasta = params.fechaHasta_year + "-" + params.fechaHasta_month + "-" + params.fechaHasta_day

        String fechaDesde = fDesde.split('-').reverse().join('-')
        String fechaHasta = fHasta.split('-').reverse().join('-')

        String entrega = (params.lugarEntrega) ?: null
        String devolucion = (params.lugarDevolucion) ?: null

        def resultList = solicitudesMaterialService.filtrarSolicitudesMaterial(fDesde, fHasta, entrega, devolucion)
        response.setContentType('application/vnd.ms-excel')
        response.setHeader('Content-Disposition', "Attachment;Filename='Solicitudes_Material_${fechaDesde}_${fechaHasta}.xls'")
        WorkbookSettings ws = new WorkbookSettings()
        ws.setLocale(new Locale("es", "ES"))
        WritableWorkbook workbook = Workbook.createWorkbook(response.outputStream, ws)
        String nombreHoja = "Solicitudes Material"

        WritableSheet sheet = workbook.createSheet(nombreHoja, 0)
        WritableFont titleFont = new WritableFont(WritableFont.ARIAL, 16, WritableFont.BOLD)
        WritableCellFormat titleFormat = new WritableCellFormat()
        titleFormat.setFont(titleFont)

        WritableFont headerFont = new WritableFont(WritableFont.ARIAL, 11, WritableFont.BOLD)
        WritableCellFormat headerFormat = new WritableCellFormat()
        headerFormat.with {
            setBackground(Colour.GREY_25_PERCENT)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setFont(headerFont)
            setWrap(true)
        }

        WritableFont cellFont = new WritableFont(WritableFont.ARIAL, 10)
        WritableCellFormat cellFormat = new WritableCellFormat()
        cellFormat.with {
            setFont(cellFont)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setWrap(true)
        }

        try {
            for (int i = 0; i < resultList.size(); i++) {
                def solicitud = resultList[i]
                if (solicitud.size() > 0) {

                    sheet.addCell(new Label(0, 0, "SOLICITUDES DE MATERIAL ${fechaDesde} a ${fechaHasta}", titleFormat))

                    def cabeceras = solicitud.keySet() as ArrayList<String>
                    for (int j = 0; j < cabeceras.size(); j++) {
                        if (j == 0) cabeceras[j] = "SOLICITUD"
                        if (j == 2) cabeceras[j] = "FECHA EVENTO"
                        if (j == 5) cabeceras[j] = "FECHA ENTREGA"
                        if (j == 6) cabeceras[j] = "LUGAR ENTREGA"
                        if (j == 7) cabeceras[j] = "FECHA DEVOLUCION"
                        if (j == 8) cabeceras[j] = "LUGAR DEVOLUCION"
                        sheet.addCell(new Label(j, 3, cabeceras[j].toUpperCase(), headerFormat))
                    }

                    for (int col = 0; col < solicitud.size(); col++) {
                        if (solicitud[col] && solicitud[col].getClass() == String) {
                            sheet.addCell(new Label(col, i + 4, solicitud[col], cellFormat))
                        } else {
                            if (solicitud[col].getClass() == BigDecimal) {
                                sheet.addCell(new Number(col, i + 4, solicitud[col], cellFormat))
                            } else {
                                if (solicitud[col].getClass() == Timestamp) {
                                    String fecha = new Date(solicitud[col].getTime()).getDateString()
                                    sheet.addCell(new Label(col, i + 4, fecha, cellFormat))
                                } else {
                                    if (solicitud[col].getClass() == NullObject) {
                                        sheet.addCell(new Label(col, i + 4, "", cellFormat))
                                    } else {
                                        if (solicitud[col]) sheet.addCell(new Number(col, i + 4, solicitud[col], cellFormat))
                                    }
                                }
                            }
                        }
                    }

                    for (int c = 0; c < 11; c++) {
                        sheet.setColumnView(c, 20)
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace()
        }

        workbook.write()
        workbook.close()
    }
}
