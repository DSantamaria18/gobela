
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'entidad.label', default: 'Entidad')}"/>
    <title>Entidades</title>
</head>

<body>
<a href="#list-solicitud" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

<div id="list-solicitud" class="content scaffold-list" role="main">
    <h1>Resultados</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <f:table collection="${resultList}" properties="['nombreEntidad', 'cif', 'direccionEntidad', 'emailEntidad', 'telefonoEntidad1', 'telefonoEntidad2']"/>

    <div class="pagination">
        <g:paginate total="${entidadInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>