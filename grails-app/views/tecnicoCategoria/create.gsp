<%@ page import="gobela.Tecnico" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'tecnicoCategoria.label', default: 'TecnicoCategoria')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<a href="#create-tecnicoCategoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                         default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="create-tecnicoCategoria" class="content scaffold-create" role="main">
    <h1>Asignar Técnico a ${categoria}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.tecnicoCategoria}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.tecnicoCategoria}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.tecnicoCategoria}" method="POST">
        <fieldset class="form">
            <input type="hidden" value="${categoria.id}" name="categoria">
            <div class="fieldcontain ${hasErrors(bean: tecnicoCategoria, field: 'tecnico', 'error')} required">
                <label for="tecnico">
                    <g:message code="evento.tecnico.label" default="Técnico:"/>
                    <span class="required-indicator">*</span>
                </label>
                <g:select name="tecnico"
                          from="${Tecnico.listOrderByNombre()}"
                          noSelection="${['': 'Selecciona un técnico...']}"
                          optionKey="id"
                          optionValue="${tecnico}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: tecnicoCategoria, field: 'principal', 'error')} required">
                <label for="principal">
                    <g:message code="evento.principal.label" default="Principal:"/>
                    <span class="required-indicator">*</span>
                </label>
                <g:checkBox name="principal" value="${this?.principal}" />
            </div>


            %{--<f:all bean="tecnicoCategoria"/>--}%
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
