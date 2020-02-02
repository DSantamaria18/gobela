package gobela

import grails.test.mixin.*
import spock.lang.*

//@TestFor(RecintoController)
//@Mock(Recinto)
class RecintoControllerSpec extends Specification {

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
            !model.recintoList
            model.recintoCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.recinto!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def recinto = new Recinto()
            recinto.validate()
            controller.save(recinto)

        then:"The create view is rendered again with the correct model"
            model.recinto!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            recinto = new Recinto(params)

            controller.save(recinto)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/recinto/show/1'
            controller.flash.message != null
            Recinto.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def recinto = new Recinto(params)
            controller.show(recinto)

        then:"A model is populated containing the domain instance"
            model.recinto == recinto
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def recinto = new Recinto(params)
            controller.edit(recinto)

        then:"A model is populated containing the domain instance"
            model.recinto == recinto
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/recinto/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def recinto = new Recinto()
            recinto.validate()
            controller.update(recinto)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.recinto == recinto

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            recinto = new Recinto(params).save(flush: true)
            controller.update(recinto)

        then:"A redirect is issued to the show action"
            recinto != null
            response.redirectedUrl == "/recinto/show/$recinto.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/recinto/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def recinto = new Recinto(params).save(flush: true)

        then:"It exists"
            Recinto.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(recinto)

        then:"The instance is deleted"
            Recinto.count() == 0
            response.redirectedUrl == '/recinto/index'
            flash.message != null
    }
}
