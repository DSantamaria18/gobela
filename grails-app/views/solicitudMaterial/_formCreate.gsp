<%@ page import="gobela.SolicitudMaterial" %>
<%@ page import="gobela.Material" %>

<div class="fieldcontain ${hasErrors(bean: solicitudMaterial, field: 'entrega', 'error')} required">
    <label for="entrega">
        <g:message code="solicitudMaterial.entrega.label" default="Fecha de Entrega:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="entrega" precision="day" value="${solicitudMaterial?.entrega}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudMaterial, field: 'recogida', 'error')} required">
    <label for="recogida">
        <g:message code="solicitudMaterial.recogida.label" default="Fecha de Recogida:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="recogida" precision="day" value="${solicitudMaterial?.recogida}"/>
</div>

<div class="fieldcontain">
    <hr>
</div>

<div class="fieldcontain ${hasErrors(bean: material, field: 'recinto', 'error')} required">
    <label for="material">
        <g:message code="material.label" default="Material:"/>
    </label>

    <g:select name="material"
              from="${gobela.Material.listOrderByNombre()}"
              value="${material?.nombre})"
              noSelection="${['': 'Selecciona un material...']}"
              optionKey="id"
              optionValue="nombre"
              onchange="fillAvailableStock(this.value)"/>

    <div class="fieldcontain">
        <label for="cantidad">
            <g:message code="cantidad.label" default="Cantidad:"/>
        </label>
        <g:field type="number" name="cantidad"/>

        <input type="button" value="Añadir" class="btn-info" onclick="addMaterial()">
    </div>
</div>

<div id="list-Material" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="Material"/></h1>
    <g:if test="\${flash.message}">
        <div class="message" role="status">\${flash.message}</div>
    </g:if>
    <f:table collection="\${MaterialList}"/>

    <div class="pagination">
        <g:paginate total="\${MaterialCount ?: 0}"/>
    </div>
</div>

<div class="fieldcontain">
    <hr>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudMaterial, field: 'observaciones', 'error')} ">
    <label for="observaciones">
        <g:message code="solicitudMaterial.observaciones.label" default="Observaciones:"/>
    </label>
    <g:textArea name="observaciones" cols="60" rows="15" maxlength="2000"
                value="${this.solicitudMaterial?.observaciones}"/>
</div>