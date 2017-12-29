<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'entidad.label', default: 'Entidad')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-entidad" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="div-search" class="content scaffold-list">
    <h1>Buscar Entidad:</h1>
    <g:form action="buscarEntidad" method="post">
        <g:textField id="mytext" class="input-xxlarge" name="q" placeholder="con el texto en el nombre... " value="${q}"/>
        <button id="submit-values" class="btn btn-small btn-primary" type="submit">
            <i class="icon-ok"></i>Buscar
        </button>
    </g:form>
</div>

<div id="list-entidad" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:table collection="${entidadList}"/>

    <div class="pagination">
        <g:paginate total="${entidadCount ?: 0}"/>
    </div>
</div>
</body>
</html>