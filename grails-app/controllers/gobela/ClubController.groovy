package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class ClubController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Club.list(params), model: [clubCount: Club.count()]
    }

    def show(params) {
        Entidad entidad = Entidad.get(params.entidadId as Long)
        Club club = Club.findAllByEntidad(entidad).first()
        [club: club]
    }

    def create() {
        respond new Club(params)
    }

    @Transactional
    def save(Club club) {
        if (club == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (club.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond club.errors, view: 'create'
            return
        }

        Entidad entidad = Entidad.get(club.entidad.id)
        club.save flush: true
        entidad.es_club = true
        entidad.save(flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'club.label', default: 'Club'), club.id])
                redirect(action: "show", params: [entidadId: entidad.id])
            }
            '*' { respond club, [status: CREATED] }
        }
    }

    def edit(Club club) {
        respond club
    }

    @Transactional
    def update(Club club) {
        if (club == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (club.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond club.errors, view: 'edit'
            return
        }

        Entidad entidad = Entidad.get(club.entidad.id)
        club.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'club.label', default: 'Club'), club.id])
                redirect(action: "show", params: [entidadId: entidad.id])
            }
            '*' { respond club, [status: OK] }
        }
    }

    @Transactional
    def delete(Club club) {

        if (club == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        Entidad entidad = Entidad.get(club.entidad.id)
        club.delete flush: true

        entidad.es_club = false
        entidad.save(flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'club.label', default: 'Club'), club.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'club.label', default: 'Club'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
