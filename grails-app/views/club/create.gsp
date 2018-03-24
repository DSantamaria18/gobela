<%@ page import="gobela.Entidad" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'club.label', default: 'Club')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-club" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-club" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.club}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.club}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.club}" method="POST">
                <fieldset class="form">
                    <div class="fieldcontain">
                        <label for="entidad">Entidad</label>
                        %{--<g:textField name="entidad" value="${this.club.entidad}" readonly="true" style="width: 69ch"/>--}%
                        <g:select name="entidad" from="${Entidad.findAllById(this.club.entidad.id)}" value="nombreEntidad" optionKey="id" readonly="true"/>
                    </div>

                    <div class="fieldcontain">
                        <label for="fechaFundacion">Fecha Fundación</label>
                        <g:datePicker name="fechaFundacion" value="${this.club?.fechaFundacion}" precision="day"/>
                    </div>

                    <div class="fieldcontain">
                        <label for="fechaElecciones">Fecha Elecciones</label>
                        <g:datePicker name="fechaElecciones" value="${this.club?.fechaElecciones}" precision="day"/>
                    </div>
                    <div class="fieldcontain">
                        <label for="numDirectivos">Num Directivos</label>
                        <g:textField type="number" name="numDirectivos" value="${this.club?.numDirectivos}"/>
                    </div>

                    <div class="fieldcontain">
                        <label for="carnetGK">Carnet GK</label>
                        <g:checkBox name="carnetGK" value="${this.club?.carnetGK}"/>
                    </div>
                    %{--<f:all bean="club"/>--}%
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
