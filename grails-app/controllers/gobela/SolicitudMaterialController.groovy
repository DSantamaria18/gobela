package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class SolicitudMaterialController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SolicitudMaterial.list(params), model: [solicitudMaterialCount: SolicitudMaterial.count()]
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
            respond solicitudMaterial.errors, view: 'create'
            return
        }

        solicitudMaterial.save flush: true
        def newIndex = solicitudMaterial.id

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'solicitudMaterial.label', default: 'SolicitudMaterial'), solicitudMaterial.id])
                redirect solicitudMaterial
            }
            '*' { respond solicitudMaterial, model: [status: CREATED, newId: newIndex] }
        }

       /* solicitudMaterialList.each { SolicitudMaterial it ->
            if (it == null) {
                transactionStatus.setRollbackOnly()
                notFound()
                return
            }

            if (it.hasErrors()) {
                transactionStatus.setRollbackOnly()
                respond it.errors, view: 'create'
                return
            }

            it.save flush: true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'it.label', default: 'SolicitudMaterial'), it.id])
                    redirect it
                }
                '*' { respond it, [status: CREATED] }
            }
        }*/
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
}
