<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'justificacion.label', default: 'Justificacion')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-justificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" controller="solicitud" action="index">
                    <g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="listFiles"
                            params="['justificacionId': justificacion.id]">Ficheros</g:link></li>
            </ul>
        </div>
        <div id="show-justificacion" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list justificacion">
                <g:if test="${this.justificacion?.codigo}">
                    <li class="fieldcontain">
                        <span id="codigo-label" class="property-label"><g:message code="justificacion.codigo.label" default="Número de justificación:" /></span>
                        <span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${justificacion}" field="codigo"/></span>
                    </li>
                </g:if>

                <g:if test="${this.justificacion?.importeRecibido}">
                    <li class="fieldcontain">
                        <span id="importeRecibido-label" class="property-label"><g:message code="justificacion.importeRecibido.label" default="Importe recibido:" /></span>
                        <span class="property-value" aria-labelledby="importeRecibido-label">
                            <g:formatNumber number="${this.justificacion.importeRecibido}" type="currency" currencyCode="EUR" locale="es_ES" />
                        </span>
                    </li>
                </g:if>

                <g:if test="${this.justificacion?.importeJustificado}">
                    <li class="fieldcontain">
                        <span id="importeJustificado-label" class="property-label"><g:message code="justificacion.importeJustificado.label" default="Importe justificado:" /></span>
                        <span class="property-value" aria-labelledby="importeJustificado-label">
                            <g:formatNumber number="${this.justificacion.importeJustificado}" type="currency" currencyCode="EUR" locale="es_ES"/>
                        </span>
                    </li>
                </g:if>

                <g:if test="${this.justificacion?.solicitud}">
                    <li class="fieldcontain">
                        <span id="solicitud-label" class="property-label"><g:message code="justificacion.solicitud.label" default="Solicitud" /></span>
                        <span class="property-value" aria-labelledby="solicitud-label"><g:link controller="solicitud" action="show" id="${this.justificacion?.solicitud?.id}">${this.justificacion?.solicitud?.encodeAsHTML()}</g:link></span>
                    </li>
                </g:if>

            </ol>
            <g:form resource="${this.justificacion}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.justificacion}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
