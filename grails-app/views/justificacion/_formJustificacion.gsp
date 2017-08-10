<%@ page import="gobela.Justificacion" %>

<div class="fieldcontain ${hasErrors(bean: justificacion, field: 'codigo', 'error')} required">
    <label for="codigo">
        <g:message code="justificacion.codigo.label" default="Número de justificación:" />
    </label>
    <g:textField name="codigo" required="" value="${this.justificacion?.codigo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: justificacion, field: 'importeRecibido', 'error')} required">
    <label for="importeRecibido">
        <g:message code="justificacion.importeRecibido.label" default="Importe Recibido:" />
    </label>
    <g:field name="importeRecibido" value="${fieldValue(bean: justificacion, field: 'importeRecibido')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: justificacion, field: 'importeJustificado', 'error')} required">
    <label for="importeJustificado">
        <g:message code="justificacion.importeJustificado.label" default="Importe Justificado:" />
    </label>
    <g:field name="importeJustificado" value="${fieldValue(bean: justificacion, field: 'importeJustificado')}" required=""/>

</div>

