<%@ page import="gobela.Entidad;" %>

<div class="fieldcontain ${hasErrors(bean: contacto, field: 'nombre', 'error')} required">
    <label for="nombre">
        <g:message code="contacto.nombre.label" default="Nombre:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nombre" value="${this.contacto?.nombre}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: contacto, field: 'email', 'error')} required">
    <label for="email">
        <g:message code="contacto.email.label" default="Email:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="email" value="${this.contacto?.email}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: contacto, field: 'telefono', 'error')} required">
    <label for="telefono">
        <g:message code="contacto.telefono.label" default="Teléfono:"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="telefono" value="${this.contacto?.telefono}" required=""/>
</div>
