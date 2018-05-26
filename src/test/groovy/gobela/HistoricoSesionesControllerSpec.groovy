package gobela

import grails.test.mixin.*
import spock.lang.*

@TestFor(HistoricoSesionesController)
@Mock(HistoricoSesiones)
class HistoricoSesionesControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.historicoSesionesList
            model.historicoSesionesCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.historicoSesiones!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def historicoSesiones = new HistoricoSesiones()
            historicoSesiones.validate()
            controller.save(historicoSesiones)

        then:"The create view is rendered again with the correct model"
            model.historicoSesiones!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            historicoSesiones = new HistoricoSesiones(params)

            controller.save(historicoSesiones)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/historicoSesiones/show/1'
            controller.flash.message != null
            HistoricoSesiones.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def historicoSesiones = new HistoricoSesiones(params)
            controller.show(historicoSesiones)

        then:"A model is populated containing the domain instance"
            model.historicoSesiones == historicoSesiones
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def historicoSesiones = new HistoricoSesiones(params)
            controller.edit(historicoSesiones)

        then:"A model is populated containing the domain instance"
            model.historicoSesiones == historicoSesiones
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/historicoSesiones/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def historicoSesiones = new HistoricoSesiones()
            historicoSesiones.validate()
            controller.update(historicoSesiones)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.historicoSesiones == historicoSesiones

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            historicoSesiones = new HistoricoSesiones(params).save(flush: true)
            controller.update(historicoSesiones)

        then:"A redirect is issued to the show action"
            historicoSesiones != null
            response.redirectedUrl == "/historicoSesiones/show/$historicoSesiones.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/historicoSesiones/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def historicoSesiones = new HistoricoSesiones(params).save(flush: true)

        then:"It exists"
            HistoricoSesiones.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(historicoSesiones)

        then:"The instance is deleted"
            HistoricoSesiones.count() == 0
            response.redirectedUrl == '/historicoSesiones/index'
            flash.message != null
    }
}
