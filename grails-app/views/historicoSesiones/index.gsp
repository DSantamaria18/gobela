<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'historicoSesiones.label', default: 'HistoricoSesiones')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-historicoSesiones" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                        default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-historicoSesiones" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
%{--<f:table collection="${historicoSesionesList}" />--}%
    <table>
        <thead>
        <tr>
            <th>Fecha</th>
            <th>Sesion</th>
            <th>Club</th>
            <th>Categoría</th>
            <th>Resultado</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${historicoSesionesList}" var="hSesion" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" id="${hSesion.id}">${formatDate(date: hSesion.fecha, format: "dd-MM-yyyy")}</g:link></td>
                <td><g:link action="show" id="${hSesion.sesion.id}">${hSesion.sesion}</g:link></td>
                <td>${hSesion.club}</td>
                <td>${hSesion.categoria}</td>
                <td><g:if test="${hSesion.resultado == true}">
                    OK
                </g:if>
                <g:else>
                    NO OK
                </g:else></td>
            </tr>
        </g:each>
        </tbody>
    </table>

<div class="pagination">
    <g:paginate total="${historicoSesionesCount ?: 0}"/>
</div>
</div>
</body>
</html>