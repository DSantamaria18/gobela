<%@ page import="gobela.SolicitudMaterial" %>

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

<div class="fieldcontain ${hasErrors(bean: solicitudMaterial, field: 'observaciones', 'error')} ">
    <label for="observaciones">
        <g:message code="solicitudMaterial.observaciones.label" default="Observaciones:"/>

    </label>
    <g:textArea name="observaciones" cols="60" rows="15" maxlength="2000"
                value="${this.solicitudMaterial?.observaciones}"/>

</div>