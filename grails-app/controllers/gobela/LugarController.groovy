package gobela

import grails.plugin.springsecurity.SpringSecurityUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class LugarController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Lugar.list(params), model:[lugarCount: Lugar.count()]
    }

    def show(Lugar lugar) {
        respond lugar
    }

    def create() {
        def authenticatedUser = User.findByUsername(springSecurityService.principal.username)
        if (SpringSecurityUtils.ifNotGranted('ROLE_GUEST')) {
            flash.message = "No tienes permisos para esta acción..."
            redirect(controller: 'evento', action: 'index')
        } else {
            respond new Lugar(params)
        }
    }

    @Transactional
    def save(Lugar lugar) {
        if (lugar == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (lugar.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond lugar.errors, view:'create'
            return
        }

        lugar.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'lugar.label', default: 'Lugar'), lugar.id])
                redirect lugar
            }
            '*' { respond lugar, [status: CREATED] }
        }
    }

    def edit(Lugar lugar) {
        def authenticatedUser = User.findByUsername(springSecurityService.principal.username)
        if (SpringSecurityUtils.ifNotGranted('ROLE_GUEST')) {
            flash.message = "No tienes permisos para esta acción..."
            redirect(controller: 'evento', action: 'index')
        } else {
            respond lugar
        }
    }

    @Transactional
    def update(Lugar lugar) {
        if (lugar == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (lugar.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond lugar.errors, view:'edit'
            return
        }

        lugar.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'lugar.label', default: 'Lugar'), lugar.id])
                redirect lugar
            }
            '*'{ respond lugar, [status: OK] }
        }
    }

    @Transactional
    def delete(Lugar lugar) {
        def authenticatedUser = User.findByUsername(springSecurityService.principal.username)
        if (SpringSecurityUtils.ifNotGranted('ROLE_GUEST')) {
            flash.message = "No tienes permisos para esta acción..."
            redirect(controller: 'evento', action: 'index')
        } else {
            if (lugar == null) {
                transactionStatus.setRollbackOnly()
                notFound()
                return
            }

            lugar.delete flush: true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'lugar.label', default: 'Lugar'), lugar.id])
                    redirect action: "index", method: "GET"
                }
                '*' { render status: NO_CONTENT }
            }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'lugar.label', default: 'Lugar'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
