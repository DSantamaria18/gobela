<%@ page import="gobela.Balance" %>

<div class="fieldcontain ${hasErrors(bean: balance, field: 'gastosEjercicioAnterior', 'error')} required">
    <label for="gastosEjercicioAnterior">
        <g:message code="balance.gastosEjercicioAnterior.label" default="Gastos Ejercicio Anterior" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="gastosEjercicioAnterior" value="${fieldValue(bean: balance, field: 'gastosEjercicioAnterior')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: balance, field: 'gastosEstimados', 'error')} required">
    <label for="gastosEstimados">
        <g:message code="balance.gastosEstimados.label" default="Gastos Estimados" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="gastosEstimados" value="${fieldValue(bean: balance, field: 'gastosEstimados')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: balance, field: 'ingresosEjercicioAnterior', 'error')} required">
    <label for="ingresosEjercicioAnterior">
        <g:message code="balance.ingresosEjercicioAnterior.label" default="Ingresos Ejercicio Anterior" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="ingresosEjercicioAnterior" value="${fieldValue(bean: balance, field: 'ingresosEjercicioAnterior')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: balance, field: 'ingresosEstimados', 'error')} required">
    <label for="ingresosEstimados">
        <g:message code="balance.ingresosEstimados.label" default="Ingresos Estimados" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="ingresosEstimados" value="${fieldValue(bean: balance, field: 'ingresosEstimados')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: balance, field: 'dificultades', 'error')} required">
    <label for="dificultades">
        <g:message code="balance.dificultades.label" default="Dificultades" />
    </label>
    <g:textArea name="dificultades" cols="40" rows="5" maxlength="500" value="${balance?.dificultades}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: balance, field: 'clubConvenio', 'error')} required">
    <label for="clubConvenio">
        <g:message code="balance.clubConvenio.label" default="Club Convenio" />
    </label>
    <g:textField name="clubConvenio" value="${balance?.clubConvenio}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: balance, field: 'aportacionConvenio', 'error')} required">
    <label for="aportacionConvenio">
        <g:message code="balance.aportacionConvenio.label" default="Aportacion Convenio" />
    </label>
    <g:field name="aportacionConvenio" value="${fieldValue(bean: balance, field: 'aportacionConvenio')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: balance, field: 'fechaInicioConvenio', 'error')} ">
    <label for="fechaInicioConvenio">
        <g:message code="balance.fechaInicioConvenio.label" default="Fecha Inicio Convenio" />
    </label>
    <g:datePicker name="fechaInicioConvenio" precision="day"  value="${balance?.fechaInicioConvenio}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: balance, field: 'fechaFinConvenio', 'error')} ">
    <label for="fechaFinConvenio">
        <g:message code="balance.fechaFinConvenio.label" default="Fecha Fin Convenio" />
    </label>
    <g:datePicker name="fechaFinConvenio" precision="day"  value="${balance?.fechaFinConvenio}" default="none" noSelection="['': '']" />

</div>
<g:hiddenField name="solicitud.id" value="${balance?.solicitud?.id}" />