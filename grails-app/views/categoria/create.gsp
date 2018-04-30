<%@ page import="gobela.Categoria; gobela.Modalidad" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                %{--<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
            </ul>
        </div>
        <div id="create-categoria" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.categoria}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.categoria}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.categoria}" method="POST">
                <fieldset class="form">
                    <input type="hidden" name="club" value="${clubId}"/>
                    <div class="fieldcontain ${hasErrors(bean: categoria, field: 'modalidad', 'error')} required">
                        <label for="modalidad">
                            <g:message code="categoria.modalidad.label" default="Modalidad:"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:select name="modalidad"
                                  from="${Modalidad.listOrderByNombre()}"
                                  value="${categoria?.modalidad?.id}"
                                  noSelection="${['': 'Selecciona una modalidad...']}"
                                  optionKey="id"
                                  optionValue="nombre"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: categoria, field: 'nombre', 'error')} required">
                        <label for="nombre">
                            <g:message code="categoria.nombre.label" default="Nombre:"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="nombre" value="${categoria?.nombre}" />
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: categoria, field: 'sexo', 'error')} required">
                        <label for="sexo">
                            <g:message code="categoria.sexo.label" default="Sexo:"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:select name="sexo"
                                  from="${Categoria.constrainedProperties.sexo.inList}"
                                  value="${categoria?.sexo}"
                                  noSelection="${['': 'Selecciona un sexo...']}"/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: categoria, field: 'edadMin', 'error')} required">
                        <label for="edadMin">
                            <g:message code="categoria.edadMin.label" default="Edad Min:"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="edadMin" value="${categoria?.edadMin}" />
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: categoria, field: 'edadMax', 'error')} required">
                        <label for="edadMax">
                            <g:message code="categoria.edadMax.label" default="Edad Max:"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="edadMax" value="${categoria?.edadMax}" />
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: categoria, field: 'numDeportistas', 'error')} required">
                        <label for="numDeportistas">
                            <g:message code="categoria.numDeportistas.label" default="Nº Deportistas:"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <g:textField name="numDeportistas" value="${categoria?.numDeportistas}" />
                    </div>

                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
