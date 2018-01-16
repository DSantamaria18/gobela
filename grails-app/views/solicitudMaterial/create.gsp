<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'solicitudMaterial.label', default: 'SolicitudMaterial')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<a href="#create-solicitudMaterial" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                          default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="create-solicitudMaterial" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.solicitudMaterial}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.solicitudMaterial}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:set var="eventId" value="${params.eventoId}"/>
    <input type="hidden" name="eventoId" value="${eventId}"/>
    <div id="tabla-solicitudes-material">
        <g:render template="formCreate"/>
    </div>
</div>

<g:javascript>
        $(document).ready(function (){
            var fecha = `${params.fecha}`.toString();
            var entregaAño = parseInt(fecha.split('-')[0]);
            var entregaMes = parseInt(fecha.split('-')[1]);
            var entregaDia = parseInt(fecha.split('-')[2].split(' ')[0]);
            $('[name="entrega_year"]').val(entregaAño);
            $('[name="entrega_month"]').val(entregaMes);
            $('[name="entrega_day"]').val(entregaDia);

            var fechaFin = `${params.fechaFin}`.toString();
            var recogidaAño = parseInt(fechaFin.split('-')[0]);
            var recogidaMes = parseInt(fechaFin.split('-')[1]);
            var recogidaDia = parseInt(fechaFin.split('-')[2].split(' ')[0]);
            $('[name="recogida_year"]').val(recogidaAño);
            $('[name="recogida_month"]').val(recogidaMes);
            $('[name="recogida_day"]').val(recogidaDia);
        })
</g:javascript>

</body>
</html>
