
<label for="contacto">
    <g:message code="evento.contacto.label" default="Contacto:"/>
</label>
<g:select name="contacto"
          from="${listaContactos}"
          value="${evento?.contacto?.id}"
          noSelection="${['': 'Selecciona un contacto...']}"
          optionKey="id"
          onchange="fillContactoInfo(this.value)"/>


