<label for="instalacion">
    <g:message code="evento.instalacion.label" default="Instalación:"/>
</label>
<g:select name="instalacion"
          from="${listaInstalaciones}"
          value="${evento?.instalacion}"
          noSelection="${['': 'Selecciona un instalación...']}"
          optionKey="id"/>

<label for="ocupacion">
    <g:message code="evento.ocupacion.label" default="Ocupación:"/>
</label>
<g:textField name="ocupacion" id="ocupacion" value="${this.evento?.ocupacion}"/>%