<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'historicoSesiones.label', default: 'HistoricoSesiones')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-historicoSesiones" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index">Histórico</g:link></li>
                %{--<li><g:link class="create" action="create">Crear </g:link></li>--}%
            </ul>
        </div>
        <div id="edit-historicoSesiones" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.historicoSesiones}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.historicoSesiones}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.historicoSesiones}" method="PUT">
                <g:hiddenField name="version" value="${this.historicoSesiones?.version}" />
                <fieldset class="form">
                    <div class="fieldcontain ${hasErrors(bean: historicoSesiones, field: 'sesion', 'error')} required">
                        <label>${this.historicoSesiones?.sesion?.categoria?.club}</label>
                        <label>${this.historicoSesiones?.sesion?.categoria}</label>
                        <label>${this.historicoSesiones?.sesion?.diaSemana} ${this.historicoSesiones?.sesion?.horaInicio} - ${this.historicoSesiones?.sesion?.horaFin}</label>
                        <label>${this.historicoSesiones?.sesion?.recinto} ${this.historicoSesiones?.sesion?.instalacion}</label>
                        %{--<g:hiddenField name="sesion" value="${this.historicoSesiones?.sesion}" />--}%
                        %{--<g:hiddenField name="fecha" value="${this.historicoSesiones?.fecha}" />--}%
                    </div>
                    <div class="fieldcontain ${hasErrors(bean: historicoSesiones, field: 'fecha', 'error')} required">
                        <label for="fecha">
                            <g:message code="historicoSesiones.fecha.label" default="Fecha Sesión:"/>
                            <span class="required-indicator">*</span>
                        </label>
                        %{--<g:datePicker name="fecha" value="${historicoSesiones?.fecha}" precision="day"/>--}%
                        <label><g:formatDate date="${this.historicoSesiones?.fecha}" format="dd-MM-yyyy"/></label>
                    </div>
                    <div class="fieldcontain ${hasErrors(bean: historicoSesiones, field: 'participantes', 'error')} required">
                        <label for="fecha">
                            <g:message code="historicoSesiones.participantes.label" default="Participantes:"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="number" name="participantes" id="participantes" value="${historicoSesiones?.participantes}"
                               min="0" step="1" required/>
                    </div>
                    <div class="fieldcontain ${hasErrors(bean: historicoSesiones, field: 'opcupacion', 'error')} required">
                        <label for="fecha">
                            <g:message code="historicoSesiones.ocupacion.label" default="Ocupación:"/>
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="number" name="ocupacion" id="ocupacion" value="${historicoSesiones?.ocupacion}"
                               min="0" max="100" step="1" required/>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: historicoSesiones, field: 'observaciones', 'error')} required">
                        <label for="fecha">
                            <g:message code="historicoSesiones.observaciones.label" default="Observaciones:"/>
                        </label>
                        <textarea name="observaciones" id="observaciones" value="${historicoSesiones?.observaciones}"></textarea>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: historicoSesiones, field: 'resultadoOk', 'error')} required">
                        <label for="fecha">
                            <g:message code="historicoSesiones.resultadoOk.label" default="Resultado OK:"/>
                        </label>
                        <g:checkBox name="resultadoOk" value="${this.historicoSesiones?.resultadoOk}" id="resultadoOk"/>
                    </div>

                    %{--<f:all bean="historicoSesiones"/>--}%
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
