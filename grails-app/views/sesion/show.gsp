<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'sesion.label', default: 'Sesion')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-sesion" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        %{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
    </ul>
</div>

<div id="show-sesion" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list sesion">
        <li class="fieldcontain">
            <span id="diaSemana-label" class="property-label"><g:message code="sesion.diaSemana.label"
                                                                         default="Día:"/></span>
            <span class="property-value" aria-labelledby="diaSemana-label"><g:fieldValue bean="${sesion}"
                                                                                         field="diaSemana"/></span>
        </li>

        <li class="fieldcontain">
            <span id="horaInicio-label" class="property-label"><g:message code="sesion.horaInicio.label"
                                                                          default="Hora Inicio:"/></span>
            <span class="property-value" aria-labelledby="horaInicio-label"><g:fieldValue bean="${sesion}"
                                                                                          field="horaInicio"/></span>
        </li>

        <li class="fieldcontain">
            <span id="horaFin-label" class="property-label"><g:message code="sesion.horaFin.label"
                                                                       default="Hora Fin:"/></span>
            <span class="property-value" aria-labelledby="horaFin-label"><g:fieldValue bean="${sesion}"
                                                                                       field="horaFin"/></span>
        </li>

        <li class="fieldcontain">
            <span id="recinto-label" class="property-label"><g:message code="sesion.recinto.label"
                                                                       default="Recinto:"/></span>
            <span class="property-value" aria-labelledby="recinto-label"><g:fieldValue bean="${sesion}"
                                                                                       field="recinto"/></span>
        </li>

        <li class="fieldcontain">
            <span id="Instalacion-label" class="property-label"><g:message code="sesion.Instalacion.label"
                                                                           default="Instalación:"/></span>
            <span class="property-value" aria-labelledby="Instalacion-label"><g:fieldValue bean="${sesion}"
                                                                                           field="instalacion"/></span>
        </li>

        <li class="fieldcontain">
            <span id="Ocupacion-label" class="property-label"><g:message code="sesion.Ocupacion.label"
                                                                         default="Ocupación:"/></span>
            <span class="property-value" aria-labelledby="Ocupacion-label"><g:fieldValue bean="${sesion}"
                                                                                         field="ocupacion"/></span>
        </li>

        <li class="fieldcontain">
            <span id="activa-label" class="property-label"><g:message code="sesion.activa.label"
                                                                         default="Activa:"/></span>
            <span class="property-value" aria-labelledby="activa-label">
                <g:if test="${sesion?.activa}">
                    SI
                </g:if>
                <g:else>
                    NO
                </g:else>
%{--                <g:fieldValue bean="${sesion}" field="activa"/></span>--}%
        </li>
    </ol>
    <g:form resource="${this.sesion}" method="DELETE">
        <fieldset class="buttons">
            %{--<g:link class="edit" action="edit" resource="${this.sesion}"><g:message code="default.button.edit.label"
                                                                                    default="Edit"/></g:link>--}%
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
