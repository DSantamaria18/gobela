<div class="fieldcontain ${hasErrors(bean: incidencia, field: 'asunto', 'error')} required">
    <label for="asunto">
        <g:message code="incidencia.asunto.label" default="Asunto:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="asunto" value="${this.incidencia?.asunto}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidencia, field: 'estado', 'error')} required">
    <label for="estado">
        <g:message code="incidencia.estado.label" default="Estado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="estado" from="${this.incidencia.constrainedProperties.estado.inList}" required=""
              value="${fieldValue(bean: incidencia, field: 'estado')}" valueMessagePrefix="incidencia.estado"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidencia, field: 'tipo', 'error')} required">
    <label for="tipo">
        <g:message code="incidencia.tipo.label" default="Tipo de Incidencia:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="tipo" from="${this.incidencia.constrainedProperties.tipo.inList}" required=""
              value="${fieldValue(bean: incidencia, field: 'tipo')}" valueMessagePrefix="incidencia.tipo"/>
</div>

<div class="fieldcontain ${hasErrors(bean: incidencia, field: 'descripcion', 'error')} ">
    <label for="descripcion">
        <g:message code="incidencia.descripcion.label" default="Descripción de la Incidencia:"/>

    </label>
    <g:textArea name="descripcion" cols="60" rows="15" maxlength="2000"
                value="${this.incidencia?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: incidencia, field: 'fecha', 'error')} required hidden ">
    <label for="fecha">
        <g:message code="incidencia.fecha.label" default="Fecha:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fecha" precision="day" value="${this.incidencia?.fecha}"/>
</div>