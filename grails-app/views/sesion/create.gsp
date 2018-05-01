<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'sesion.label', default: 'Sesion')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<a href="#create-sesion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        %{--<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>--}%
    </ul>
</div>

<div id="create-sesion" class="content scaffold-create" role="main">
    <h1>Crear Sesión de Entrenamiento</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.sesion}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.sesion}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.sesion}" method="POST">
        <fieldset class="form">

            <div class="fieldcontain ${hasErrors(bean: sesion, field: 'categoria', 'error')} required">
                <label for="nombre">
                    Categoría:
                </label>
                <span>${this.categoria}</span>
                <input type="hidden" value="${this.categoria.id}" name="categoria">
            </div>

            <div class="fieldcontain ${hasErrors(bean: sesion, field: 'diaSemana', 'error')} required">
                <label for="diaSemana">
                    <g:message code="evento.diaSemana.label" default="Día:"/>
                    <span class="required-indicator">*</span>
                </label>
                <g:select name="diaSemana"
                          from="['LUNES', 'MARTES', 'MIERCOLES', 'JUEVES', 'VIERNES', 'SABADO', 'DOMINGO']"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: sesion, field: 'horaInicio', 'error')} required">
                <label for="horaInicio">
                    <g:message code="evento.horaInicio.label" default="Hora Inicio:"/>
                    <span class="required-indicator">*</span>
                </label>
                <input type="time" class="date" name="horaInicio" step="900"
                       value="${this.sesion?.horaInicio}" required=""/> (hh:mm)
            </div>

            <div class="fieldcontain ${hasErrors(bean: sesion, field: 'horaFin', 'error')} required">
                <label for="horaFin">
                    <g:message code="evento.horaFin.label" default="Hora Fin:"/>
                    <span class="required-indicator">*</span>
                </label>
                <input type="time" class="date" name="horaFin" step="900"
                       value="${this.sesion?.horaFin}" required=""/> (hh:mm)
            </div>

            <div class="fieldcontain ${hasErrors(bean: sesion, field: 'recinto', 'error')} required">
                <label for="recinto">
                    <g:message code="sesion.recinto.label" default="Recinto:"/>
                </label>
                <g:set var="instalacionId" value="${sesion?.instalacion?.id}"/>
                <g:select name="recinto"
                          from="${gobela.Recinto.listOrderByNombre()}"
                          value="${sesion?.recinto?.id}"
                          noSelection="${['': 'Selecciona un recinto...']}"
                          optionKey="id"
                          optionValue="nombre"
                          onchange="fillInstalacionByRecinto(this.value, ${instalacionId})"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: sesion, field: 'instalacion', 'error')}"
                 id="instalacion-container">
                <g:render template="instalacion"/>
            </div>

        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
