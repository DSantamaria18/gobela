
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'solicitud.label', default: 'Solicitud')}"/>
    <title>Estadísticas</title>
</head>

<body>
<a href="#list-solicitud" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="informeAnual">Informe Anual</g:link></li>
        %{--<li><g:link class="list" action="create">Informe Semestral</g:link></li>--}%
    </ul>
    <ul>
        <div class="paginateButtons">
            %{--  <g:paginate total="${solicitudInstance.count()}"/>--}%
            <export:formats formats="['csv', 'excel', 'ods', 'pdf', 'rtf', 'xml']"/>
        </div>
    </ul>
</div>

<div id="list-solicitud" class="content scaffold-list" role="main">
    <h1>Resultados</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <f:table collection="${resultList}" properties="['codigo', 'nombreSolicitante', 'solicitanteId', 'municipioSolicitante', 'emailSolicitante']"/>

    <div class="pagination">
        <g:paginate total="${solicitudInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>