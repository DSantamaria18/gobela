package gobela

import jxl.write.WritableCellFormat
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
//        def listaContactos = contactoService.getListaContactosByModalidadAndClub()
        def listaClubes = contactoService.getListaClubes()
        def listaContactos = contactoService.getListaContactos(listaClubes)

        if (listaContactos.size() > 0) {
            WritableWorkbook workbook = ExcelUtils.createWorkbook(response, "Contactos")
            WritableCellFormat titleFormat = ExcelUtils.defaultTitleFormat()
            WritableCellFormat headerFormat = ExcelUtils.defaultHeaderFormat()
            WritableCellFormat cellFormat = ExcelUtils.defaultCellFormat()

            try {
                workbook = contactoService.writeContactData(listaContactos, workbook, headerFormat, cellFormat, titleFormat)
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
