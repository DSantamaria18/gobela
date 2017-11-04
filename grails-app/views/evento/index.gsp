<!DOCTYPE html>
<html>
<head>
    <%@ page import="gobela.Modalidad" %>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-evento" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<br/>
<hr/>
<br/>

<div class="container">
    
    <div class="row" id="filter-options">
        <div class="row fieldcontain">
            <label for="estado">
                <g:message code="evento.estado.label" default="Estado:"/>
            </label>
            <g:select name="estado"
                      from="${['Cualquiera', 'Pendiente', 'Confirmado', 'Rechazado', 'Finalizado', 'Cancelado']}"
                      value=""/>
        </div>

        <div class="row fieldcontain">
            <label for="fechaInicioEntre">
                Fecha de inicio entre:
            </label>
            <g:datePicker name="fechaInicioDesde" precision="day"/> y
            <g:datePicker name="fechaInicioHaste" precision="day"/>
        </div>

        <div class="row fieldcontain">
            <label for="tipoActividad">
                <g:message code="evento.tipoActividad.label" default="Tipo de actividad:"/>
            </label>
            <g:select name="tipoActividad"
                      from="${['Cualquiera', 'Formación', 'Regular/Competición', 'Exhibición', 'Cultural', 'Txangoa - Excursión', 'Topaketa - Encuentro Deportivo', 'Otros', 'Txapelketa/Torneo']}"/>
        </div>

        <div class="row fieldcontain">
            <label for="modalidad">
                <g:message code="evento.modalidad.label" default="Modalidad:"/>
            </label>
            <g:select name="modalidad"
                      from="${Modalidad.listOrderByNombre()}"
                      value="''"
                      noSelection="${['': 'Selecciona una modalidad...']}"
                      optionKey="id"
                      optionValue="nombre"/>
        </div>

        <div class="row fieldcontain">
            <label for="multikirola">
                <g:message code="evento.multikirola.label" default="Multikirola:"/>
            </label>
            <g:checkBox name="multikirola"/>
            <label for="deporteAdaptado">
                <g:message code="evento.deporteAdaptado.label" default="Deporte Adaptado:"/>
            </label>
            <g:checkBox name="deporteAdaptado"/>
        </div>
    </div>

    <br/>
    <hr/>
    <br/>

    <div id="list-evento" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <f:table collection="${eventoList}"/>
        <div class="pagination">
            <g:paginate total="${eventoCount ?: 0}"/>
        </div>
    </div>
</div>

<br/>
<hr/>
<br/>

<div id="list-evento" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:table collection="${eventoList}"/>

    <div class="pagination">
        <g:paginate total="${eventoCount ?: 0}"/>
    </div>
</div>
</body>
</html>