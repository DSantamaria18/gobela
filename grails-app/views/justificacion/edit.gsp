<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'justificacion.label', default: 'Justificacion')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-justificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <div id="edit-justificacion" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.justificacion}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.justificacion}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.justificacion}" method="PUT">
                <g:hiddenField name="version" value="${this.justificacion?.version}" />
                <fieldset class="form">
                    <g:render template="formJustificacion"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <g:actionSubmit class="button"
                                    action="cancel"
                                    value="${message(code: 'default.button.cancel.label', default: 'Cancelar')}"
                                    onclick="return confirm('${message(code: 'default.button.cancel.confirm.message', default: '¿Estás seguro/a?')}');"/>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
