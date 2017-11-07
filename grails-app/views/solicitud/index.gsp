<%@ page import="gobela.Solicitud" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'solicitud.label', default: 'Solicitud')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-solicitud" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="div-search" class="content scaffold-list">
    <h1>Buscar solicitud:</h1>
    <g:form action="buscarSolicitud" method="post">
        <g:textField id="mytext" class="input-xxlarge" name="q" placeholder="Número o descripción" value="${q}"/>
        <button id="submit-values" class="btn btn-small btn-primary" type="submit">
            <i class="icon-ok"></i>Buscar
        </button>
    </g:form>
</div>

<div id="list-solicitud" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table>
        <thead>
        <tr>
            <g:sortableColumn property="codigo" title="${message(code: 'solicitud.codigo.label', default: 'Codigo')}" />
            <g:sortableColumn property="descSolicitud" title="${message(code: 'solicitud.descSolicitud.label', default: 'Desc')}" />
            %{--<g:sortableColumn property="nombreSolicitante" title="${message(code: 'solicitud.nombreSolicitante.label', default: 'Solicitante')}" />--}%
            <g:sortableColumn property="nombreEntidad" title="${message(code: 'solicitud.nombreEntidad.label', default: 'Entidad / Solicitante')}" />
            <g:sortableColumn property="linea" title="${message(code: 'solicitud.linea.label', default: 'Línea')}" />
            %{--<g:sortableColumn property="importeSolicitado" title="${message(code: 'solicitud.importeSolicitado.label', default: 'Importe Solicitado')}" />--}%
            <g:sortableColumn property="balance" title="${message(code: 'solicitud.balance.label', default: 'Balance')}" />
            <g:sortableColumn property="memoria" title="${message(code: 'solicitud.memoria.label', default: 'Memoria')}" />
            <g:sortableColumn property="valoracion" title="${message(code: 'solicitud.valoracion.label', default: 'Valoración')}" />
            <g:sortableColumn property="justificacion" title="${message(code: 'solicitud.justificacion.label', default: 'Justificación')}" />
        </tr>
        </thead>
        <tbody>
        <g:each in="${solicitudList}" status="i" var="solicitudInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" id="${solicitudInstance.id}">${fieldValue(bean: solicitudInstance, field: "codigo")}</g:link></td>
                <td><g:link action="show" id="${solicitudInstance.id}">${fieldValue(bean: solicitudInstance, field: "descSolicitud")}</g:link></td>
            %{--<td>${fieldValue(bean: solicitudInstance, field: "descSolicitud")}</td>--}%
                <g:if test="${solicitudInstance.nombreEntidad == null}">
                    <td>${fieldValue(bean: solicitudInstance, field: "nombreSolicitante")}</td>
                </g:if>
                <g:else>
                    <td>${fieldValue(bean: solicitudInstance, field: "nombreEntidad")}</td>
                </g:else>
                <td>${fieldValue(bean: solicitudInstance, field: "linea")}</td>
                %{--<td>${g.formatNumber(number: solicitudInstance.importeSolicitado, type: "currency", currencyCode: "EUR")}</td>--}%
                <td><g:link controller="balance" action="show" id="${solicitudInstance.balanceId}">${fieldValue(bean: solicitudInstance, field: "balanceId")}</g:link></td>
                <td><g:link controller="memoria" action="show" id="${solicitudInstance.memoriaId}">${fieldValue(bean: solicitudInstance, field: "memoriaId")}</g:link></td>
                <td><g:link controller="valoracion" action="show" id="${solicitudInstance.valoracionId}">${fieldValue(bean: solicitudInstance, field: "valoracionId")}</g:link></td>
                <td><g:link controller="justificacion" action="show" id="${solicitudInstance.justificacionId}">${fieldValue(bean: solicitudInstance, field: "justificacionId")}</g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>


    <div class="pagination">
        <g:paginate total="${solicitudCount ?: 0}"/>
    </div>
</div>
</body>
</html>