
<div class="fieldcontain" ${hasErrors(bean: evento, field: 'emailContacto', 'error')}>
    <label for="emailContacto">
        <g:message code="evento.emailContacto.label" default="Email Contacto:"/>
    </label>
    <g:textField name="emailContacto" value="${emailContacto}"/>
    %{--<g:textField name="emailContacto" value="${this.evento?.emailContacto}"/>--}%
</div>


<div class="fieldcontain" ${hasErrors(bean: evento, field: 'telefonoContacto', 'error')}>
    <label for="telefonoContacto">
        <g:message code="evento.telefonoContacto.label" default="Teléfono Contacto:"/>
    </label>
    <g:textField name="telefonoContacto" value="${telefonoContacto}"/>
    %{--<g:textField name="telefonoContacto" value="${this.evento?.telefonoContacto}"/>--}%
</div>