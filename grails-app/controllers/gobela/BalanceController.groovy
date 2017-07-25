package gobela

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class BalanceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

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
}
