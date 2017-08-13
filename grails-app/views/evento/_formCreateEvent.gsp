<%@ page import="gobela.Modalidad; gobela.Evento" %>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'nombre', 'error')} required">
    <label for="nombre">
        <g:message code="evento.nombre.label" default="Nombre:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nombre" value="${this.evento?.nombre}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'estado', 'error')} required">
    <label for="estado">
        <g:message code="evento.estado.label" default="Estado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="estado" from="${this.evento.constrainedProperties.estado.inList}" required=""
              value="${fieldValue(bean: evento, field: 'estado')}" valueMessagePrefix="evento.estado"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'fecha', 'error')} required">
    <label for="fecha">
        <g:message code="evento.fecha.label" default="Fecha del evento:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fecha" precision="day" value="${this.evento?.fecha}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'tipoActividad', 'error')} required">
    <label for="tipoActividad">
        <g:message code="evento.tipoActividad.label" default="Tipo de actividad:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="tipoActividad"
              from="${this.evento.constrainedProperties.tipoActividad.inList}"
              required=""
              value="${fieldValue(bean: evento, field: 'tipoActividad')}"
              valueMessagePrefix="evento.tipoActividad"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'modalidad', 'error')} required">
    <label for="modalidad">
        <g:message code="evento.modalidad.label" default="Modalidad:"/>
        <span class="required-indicator">*</span>
    </label>

    <g:select name="modalidad"
              from="${Modalidad.list()}"
              value="${evento?.modalidad}"
              optionKey="id"
              optionValue="nombre"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evento, field: 'entidadOrganizadora', 'error')} required">
    <label for="entidadOrganizadora">
        <g:message code="evento.entidadOrganizadora.label" default="Entidad organizadora:"/>
        <span class="required-indicator">*</span>
    </label>

    <g:select name="entidadOrganizadora"
              from="${gobela.Entidad.list()}"
              value="${evento?.entidadOrganizadora}"
              optionKey="id"
              optionValue="nombreEntidad"/>
</div>

%{--
<div class="fieldcontain ${hasErrors(bean: evento, field: 'estado', 'error')} required">
    <label for="estado">
        <g:message code="evento.estado.label" default="Estado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="estado" from="${this.evento.constrainedProperties.estado.inList}" required=""
              value="${fieldValue(bean: evento, field: 'estado')}" valueMessagePrefix="evento.estado"/>
</div>


<div class="fieldcontain ${hasErrors(bean: evento, field: 'estado', 'error')} required">
    <label for="estado">
        <g:message code="evento.estado.label" default="Estado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="estado" from="${this.evento.constrainedProperties.estado.inList}" required=""
              value="${fieldValue(bean: evento, field: 'estado')}" valueMessagePrefix="evento.estado"/>
</div>


<div class="fieldcontain ${hasErrors(bean: evento, field: 'estado', 'error')} required">
    <label for="estado">
        <g:message code="evento.estado.label" default="Estado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="estado" from="${this.evento.constrainedProperties.estado.inList}" required=""
              value="${fieldValue(bean: evento, field: 'estado')}" valueMessagePrefix="evento.estado"/>
</div>


<div class="fieldcontain ${hasErrors(bean: evento, field: 'estado', 'error')} required">
    <label for="estado">
        <g:message code="evento.estado.label" default="Estado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="estado" from="${this.evento.constrainedProperties.estado.inList}" required=""
              value="${fieldValue(bean: evento, field: 'estado')}" valueMessagePrefix="evento.estado"/>
</div>


<div class="fieldcontain ${hasErrors(bean: evento, field: 'estado', 'error')} required">
    <label for="estado">
        <g:message code="evento.estado.label" default="Estado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="estado" from="${this.evento.constrainedProperties.estado.inList}" required=""
              value="${fieldValue(bean: evento, field: 'estado')}" valueMessagePrefix="evento.estado"/>
</div>


<div class="fieldcontain ${hasErrors(bean: evento, field: 'estado', 'error')} required">
    <label for="estado">
        <g:message code="evento.estado.label" default="Estado:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="estado" from="${this.evento.constrainedProperties.estado.inList}" required=""
              value="${fieldValue(bean: evento, field: 'estado')}" valueMessagePrefix="evento.estado"/>
</div>--}%
