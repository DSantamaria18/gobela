<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'asamblea.label', default: 'Asamblea')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-asamblea" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-asamblea" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.asamblea}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.asamblea}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.asamblea}" method="PUT">
                <g:hiddenField name="version" value="${this.asamblea?.version}" />
                <fieldset class="form">
                    <g:textField name="club" value="${this.asamblea?.club?.id}" readonly="true" hidden="true"/>
                    <div class="fieldcontain">
                        <label for="nombreClub">Club</label>
                        <g:textField name="nombreClub" value="${this.asamblea?.club?.entidad?.nombreEntidad}" readonly="true"/>
                    </div>
                    <div class="fieldcontain">
                        <label for="nombre">Nombre</label>
                        <g:textField name="nombre" value="${this.asamblea?.nombre}"/>
                    </div>
                    <div class="fieldcontain">
                        <label for="fecha">Fecha</label>
                        <g:datePicker name="fecha" value="${this.asamblea?.fecha}" precision="day"/>
                    </div>
                    <div class="fieldcontain">
                        <label for="observaciones">Observaciones</label>
                        <g:textArea name="observaciones" value="${this.asamblea?.observaciones}"/>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
