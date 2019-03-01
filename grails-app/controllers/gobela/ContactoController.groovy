package gobela

import jxl.Workbook
import jxl.WorkbookSettings
import jxl.write.Border
import jxl.write.BorderLineStyle
import jxl.write.Colour
import jxl.write.Label
import jxl.write.WritableCellFormat
import jxl.write.WritableFont
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class ContactoController {

    ContactoService contactoService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Contacto.list(params), model: [contactoCount: Contacto.count()]
    }

    def show(Contacto contacto) {
        respond contacto
    }

    def create() {
        respond new Contacto(params)
    }

    @Transactional
    def save(Contacto contacto) {
        if (contacto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (contacto.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond contacto.errors, view: 'create'
            return
        }

        contacto.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contacto.label', default: 'Contacto'), contacto.id])
                redirect contacto
            }
            '*' { respond contacto, [status: CREATED] }
        }
    }

    def edit(Contacto contacto) {
        respond contacto
    }

    @Transactional
    def update(Contacto contacto) {
        if (contacto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (contacto.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond contacto.errors, view: 'edit'
            return
        }

        contacto.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'contacto.label', default: 'Contacto'), contacto.id])
                redirect contacto
            }
            '*' { respond contacto, [status: OK] }
        }
    }

    @Transactional
    def delete(Contacto contacto) {

        if (contacto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        contacto.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'contacto.label', default: 'Contacto'), contacto.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contacto.label', default: 'Contacto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def filtrarContactos(params) {
        def contactoList = contactoService.filtrarContactos(params)
        render template: "tablaContactos", model: [contactoList: contactoList, contactoCount: contactoList.size()]
    }

    def exportContactosClubs() {
        def listaClubes = contactoService.getListaClubes()
        def listaContactos = contactoService.getListaContactos(listaClubes)

        if (listaContactos.size() > 0) {
            response.setContentType('application/vnd.ms-excel')
            response.setHeader('Content-Disposition', "Attachment;Filename='Contactos.xls'")
            WorkbookSettings ws = new WorkbookSettings()
            ws.setLocale(new Locale("es", "ES"))
            WritableWorkbook workbook = Workbook.createWorkbook(response.outputStream, ws)

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

            String nombreHoja = "Contactos"
            WritableSheet sheet = workbook.createSheet(nombreHoja, 0)

            sheet.addCell(new Label(0, 0, "Contactos", titleFormat))

            int columna = 0
            int fila = 3

            try {
                def cabeceras = ['CLUB', 'NOMBRE', 'EMAIL', 'TELEFONO']
                cabeceras.each {
                    sheet.addCell(new Label(columna, fila, it, headerFormat))
                    columna++
                }
                fila++
                columna = 0
                listaContactos.each {
                    if(it.activo){
                        sheet.addCell(new Label(columna, fila, it.entidad.nombreEntidad.toUpperCase(), cellFormat))
                        columna++
                        sheet.addCell(new Label(columna, fila, it.nombre.toUpperCase(), cellFormat))
                        columna++
                        sheet.addCell(new Label(columna, fila, it.email.toUpperCase(), cellFormat))
                        columna++
                        sheet.addCell(new Label(columna, fila, it.telefono.toUpperCase(), cellFormat))
                        columna = 0
                        fila++
                    }

                }

                for (int c = 0; c < 6; c++) {
                    sheet.setColumnView(c, 40)
                }

            } catch (Exception e) {
                e.printStackTrace()
            }

            workbook.write()
            workbook.close()
        } else {
            flash.message = "Error al exportar. El filtro seleccionado no devolvió ningún resultado"
            redirect(uri: "/contacto/index")
        }
    }
}
